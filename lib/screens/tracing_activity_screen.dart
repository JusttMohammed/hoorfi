import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class TracingScreen extends StatefulWidget {
  const TracingScreen({Key? key}) : super(key: key);

  @override
  State<TracingScreen> createState() => _TracingScreenState();
}

class _TracingScreenState extends State<TracingScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _dashController;
  late AnimationController _bounceController;

  double _progress = 0.4; // 40% traced
  final List<Offset> _tracedPath = [];
  // ignore: unused_field
  bool _isTracing = false;

  @override
  void initState() {
    super.initState();

    // Pulse animation for start dot
    _pulseController = AnimationController(
      vsync: this,
      duration:  const Duration(seconds: 2),
    )..repeat(reverse: true);

    // Dash animation for guide arrows
    _dashController = AnimationController(
      vsync:  this,
      duration: const Duration(seconds: 3),
    )..repeat();

    // Bounce animation for helper label
    _bounceController = AnimationController(
      vsync:  this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _dashController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _isTracing = true;
      _tracedPath.clear();
      _tracedPath.add(details.localPosition);
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _tracedPath.add(details. localPosition);
      // Calculate progress based on path length
      _progress = (_tracedPath.length / 100).clamp(0.0, 1.0);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      _isTracing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF112117),
      body: Stack(
        children: [
          // Background blur effects
          _buildBackgroundEffects(),

          // Main content
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: _buildMainContent(),
              ),
              _buildFooter(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundEffects() {
    return Stack(
      children: [
        Positioned(
          top: 80,
          right: 0,
          child: Container(
            width: 256,
            height: 256,
            decoration: BoxDecoration(
              color: const Color(0xFF36e27b).withOpacity(0.05),
              shape: BoxShape. circle,
            ),
            child: BackdropFilter(
              filter:  ui.ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left:  0,
          child: Container(
            width: 192,
            height: 192,
            decoration: BoxDecoration(
              color: const Color(0xFF36e27b).withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 80, sigmaY: 80),
              child:  Container(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      bottom: false,
      child:  Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Close button
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
                color: Colors.white. withOpacity(0.7),
                size: 32,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),

            const SizedBox(width: 24),

            // Progress bar
            Expanded(
              child: Container(
                height: 16,
                decoration: BoxDecoration(
                  color: const Color(0xFF3d5245),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.05),
                  ),
                ),
                child:  Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: _progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF36e27b),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:  Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end:  Alignment.centerRight,
                                colors: [
                                  Colors.transparent,
                                  Colors.white.withOpacity(0.3),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 24),

            // Hearts
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical:  4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.05),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons. favorite,
                    color: const Color(0xFF36e27b).withOpacity(0.9),
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Stack(
      children: [
        // Instruction text
        Positioned(
          top: 16,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const Text(
                'Trace the letter Alif',
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign. center,
              ),
              const SizedBox(height: 4),
              Text(
                'Start at the top dot',
                style: TextStyle(
                  color: Colors. white.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // Tracing canvas
        Center(
          child: _buildTracingCanvas(),
        ),
      ],
    );
  }

  Widget _buildTracingCanvas() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background glow
        Container(
          width: 300,
          height: 450,
          decoration: BoxDecoration(
            color: const Color(0xFF36e27b).withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
          ),
          child: BackdropFilter(
            filter:  ui.ImageFilter.blur(sigmaX: 48, sigmaY: 48),
            child: Container(),
          ),
        ),

        // SVG-like tracing area
        GestureDetector(
          onPanStart: _onPanStart,
          onPanUpdate: _onPanUpdate,
          onPanEnd: _onPanEnd,
          child:  Container(
            width: 256,
            height: 384,
            color: Colors.transparent,
            child: CustomPaint(
              painter: TracingPainter(
                progress: _progress,
                pulseAnimation: _pulseController,
                dashAnimation: _dashController,
                tracedPath: _tracedPath,
              ),
            ),
          ),
        ),

        // Helper label
        if (_progress < 0.9)
          Positioned(
            top: 200,
            right: 40,
            child: AnimatedBuilder(
              animation: _bounceController,
              builder:  (context, child) {
                return Transform.translate(
                  offset: Offset(
                    0,
                    math.sin(_bounceController.value * math.pi * 2) * 5,
                  ),
                  child: child,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors. white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius:  10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Text(
                  'Pull down!',
                  style: TextStyle(
                    color: Color(0xFF112117),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin:  Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF112117).withOpacity(0),
            const Color(0xFF112117).withOpacity(0.95),
            const Color(0xFF112117),
          ],
        ),
      ),
      child: SafeArea(
        top: false,
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Mascot with speech bubble
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Speech bubble
                  Positioned(
                    top: -48,
                    left: 24,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius. circular(16),
                          topRight:  Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius:  10,
                            offset:  Offset(0, 4),
                          ),
                        ],
                      ),
                      child:  const Text(
                        'Great job! ',
                        style: TextStyle(
                          color: Color(0xFF112117),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Mascot
                  Container(
                    width: 96,
                    height: 96,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuD32-Irlf8da8KcGvhsrkNheCI8SvdNfQ1BlJe8nuLFVV5e76q7yhVR0QECre5JVwvwI3b4rA_EtcMtE12E8iSt--flN8JzeofCIAKj0WHmZJlCX1HQ94sT4vQ6SRb5DEtunHlT9k0N970rhlyKbb6nGkohPzMgf_2WWiPjVKFU70umtUNsNvYQ4GOdej4dzPxq4yFdX8wXiE1phqQuNqmsDVuC2fRaUNuTUlPGd7Rjj1T2ZdFEEwliUPplVKTzYtu2fkX7ByCqhOA',
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 16),

              // Check button
              Expanded(
                child: _buildCheckButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckButton() {
    final bool isEnabled = _progress > 0.8;

    return Container(
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: const Color(0xFF36e27b).withOpacity(0.4),
                  blurRadius:  20,
                  spreadRadius: 0,
                ),
              ]
            : [],
      ),
      child: ElevatedButton(
        onPressed: isEnabled
            ? () {
                // Navigate to reward screen
                print('Check pressed');
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: 
              isEnabled ? const Color(0xFF36e27b) : const Color(0xFF2a3d33),
          foregroundColor: 
              isEnabled ? const Color(0xFF112117) : Colors.white. withOpacity(0.3),
          disabledBackgroundColor: const Color(0xFF2a3d33),
          disabledForegroundColor: Colors.white. withOpacity(0.3),
          minimumSize: const Size(double. infinity, 64),
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isEnabled ? 'Check' : 'Trace to continue',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isEnabled) ...[
              const SizedBox(width: 8),
              const Icon(Icons.check, size: 24),
            ],
          ],
        ),
      ),
    );
  }
}

// Custom painter for the tracing canvas
class TracingPainter extends CustomPainter {
  final double progress;
  final Animation<double> pulseAnimation;
  final Animation<double> dashAnimation;
  final List<Offset> tracedPath;

  TracingPainter({
    required this.progress,
    required this.pulseAnimation,
    required this.dashAnimation,
    required this.tracedPath,
  }) : super(
          repaint:  Listenable.merge([pulseAnimation, dashAnimation]),
        );

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final startY = 50.0;
    final endY = size.height - 50;

    // Draw helper grid lines
    final gridPaint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(20, 100),
      Offset(size.width - 20, 100),
      gridPaint,
    );
    canvas.drawLine(
      Offset(20, size.height - 100),
      Offset(size.width - 20, size.height - 100),
      gridPaint,
    );

    // Draw letter outline (the track)
    final trackPaint = Paint()
      ..color = const Color(0xFF2a3d33)
      ..strokeWidth = 45
      ..strokeCap = StrokeCap. round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(centerX, startY),
      Offset(centerX, endY),
      trackPaint,
    );

    // Draw inner dashed guide
    final dashGuidePaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap. round
      ..style = PaintingStyle.stroke;

    _drawDashedLine(
      canvas,
      Offset(centerX, startY),
      Offset(centerX, endY),
      dashGuidePaint,
      8,
      8,
    );

    // Draw animated guide arrows
    final arrowPaint = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle. stroke;

    final dashOffset = dashAnimation.value * 100;
    _drawDashedLine(
      canvas,
      Offset(centerX, startY),
      Offset(centerX, endY),
      arrowPaint,
      10,
      10,
      dashOffset:  dashOffset,
    );

    // Draw the traced path (simulating user progress)
    final tracedPaint = Paint()
      ..color = const Color(0xFF36e27b)
      ..strokeWidth = 36
      ..strokeCap = StrokeCap.round
      .. style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    final tracedLength = (endY - startY) * progress;
    canvas.drawLine(
      Offset(centerX, startY),
      Offset(centerX, startY + tracedLength),
      tracedPaint,
    );

    // Draw start point indicator (pulsing)
    final startDotSize = 12.0 + (pulseAnimation.value * 3);
    final startDotPaint = Paint()
      ..color = const Color(0xFF36e27b)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(centerX, startY),
      startDotSize,
      startDotPaint,
    );

    // Draw current position (cursor)
    final cursorY = startY + tracedLength;
    
    // Outer ping circle
    final pingPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(centerX, cursorY),
      24,
      pingPaint,
    );

    // Inner cursor dot
    final cursorPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(centerX, cursorY),
      14,
      cursorPaint,
    );

    // Draw end point indicator
    final endDotPaint = Paint()
      ..color = const Color(0xFF2a3d33)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(centerX, endY),
      10,
      endDotPaint,
    );

    final endDotBorderPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(centerX, endY),
      10,
      endDotBorderPaint,
    );
  }

  void _drawDashedLine(
    Canvas canvas,
    Offset start,
    Offset end,
    Paint paint,
    double dashWidth,
    double dashSpace, {
    double dashOffset = 0,
  }) {
    final distance = (end - start).distance;
    final direction = (end - start) / distance;

    double currentDistance = -dashOffset % (dashWidth + dashSpace);

    while (currentDistance < distance) {
      final startPoint = start + direction * currentDistance;
      final endPoint = start + direction * (currentDistance + dashWidth).clamp(0, distance);

      if (currentDistance >= 0) {
        canvas.drawLine(startPoint, endPoint, paint);
      }

      currentDistance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(TracingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.tracedPath != tracedPath;
  }
}