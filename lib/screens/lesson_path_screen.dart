import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'letter_lesson_screen.dart';

class LearningPathScreen extends StatefulWidget {
  const LearningPathScreen({Key? key}) : super(key: key);

  @override
  State<LearningPathScreen> createState() => _LearningPathScreenState();
}

class _LearningPathScreenState extends State<LearningPathScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration:  const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF112117),
      body: Stack(
        children: [
          // Background decorations
          _buildBackgroundDecorations(),

          // Main content with proper scrolling
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    bottom: 100, // Space for bottom navigation
                  ),
                  child: _buildPathMap(),
                ),
              ),
            ],
          ),

          // Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF112117).withOpacity(0.0),
                    const Color(0xFF112117).withOpacity(0.9),
                    const Color(0xFF112117),
                  ],
                ),
              ),
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).padding.bottom + 16,
                top: 16,
              ),
              child: _buildBottomNavigation(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundDecorations() {
    return Positioned.fill(
      child: IgnorePointer(
        child:  Opacity(
          opacity: 0.2,
          child: Stack(
            children: [
              Positioned(
                top: 80,
                left: 40,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 160,
                right: 80,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color:  Color(0xFF36e27b),
                    shape:  BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom:  240,
                left: 100,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color:  const Color(0xFFFFC800).withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF112117).withOpacity(0.9),
        border: const Border(
          bottom: BorderSide(
            color: Color(0xFF3d5245),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            children: [
              // Top Row: Unit & Settings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CURRENT UNIT',
                        style:  TextStyle(
                          color: const Color(0xFF36e27b),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Unit 1: The Basics',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color:  const Color(0xFF1c3326),
                      shape:  BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white. withOpacity(0.8),
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height:  16),
              // Stats Row
              Row(
                children: [
                  _buildStatBadge(
                    icon: Icons.favorite,
                    color: Colors.red,
                    value: '5',
                  ),
                  const SizedBox(width: 16),
                  _buildStatBadge(
                    icon:  Icons.diamond,
                    color: Color(0xFFFFC800),
                    value: '142',
                  ),
                  const SizedBox(width: 16),
                  _buildStatBadge(
                    icon: Icons.electric_bolt,
                    color:  Color(0xFF36e27b),
                    value: '3',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatBadge({
    required IconData icon,
    required Color color,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1c3326),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF3d5245),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPathMap() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 48),
      child: Column(
        children: [
          // Locked Node (Ta - Two Dots)
          _buildLockedNode(
            label: 'Ta - Two Dots',
            offsetX: 40,
          ),

          const SizedBox(height: 32),

          // Bonus Chest
          Transform.translate(
            offset: const Offset(-50, 0),
            child: Transform.rotate(
              angle: -0.17, // ~-10 degrees
              child: _buildBonusChest(),
            ),
          ),

          const SizedBox(height: 96),

          // Active Lesson Node (Ba - Jump)
          _buildActiveNode(),

          const SizedBox(height: 48),

          // Completed Node (Alif)
          _buildCompletedNode(
            stars: 3,
            offsetX: -40,
          ),

          const SizedBox(height: 48),

          // Start Node (Intro)
          _buildStartNode(offsetX: 30),

          const SizedBox(height: 48),

          // More nodes can be added here...
          // Add more lessons/levels as needed
          _buildLockedNode(label: 'Tha', offsetX: -30),
          const SizedBox(height: 48),
          _buildLockedNode(label: 'Jeem', offsetX: 50),
          const SizedBox(height: 48),
          _buildLockedNode(label: 'Ha', offsetX: -40),
          const SizedBox(height: 48),
          _buildLockedNode(label: 'Kha', offsetX: 30),
          const SizedBox(height: 48),
          _buildLockedNode(label: 'Dal', offsetX: -50),
          const SizedBox(height: 48),
          _buildLockedNode(label: 'Thal', offsetX: 40),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget _buildLockedNode({
    required String label,
    required double offsetX,
  }) {
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF1c3326),
              shape:  BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF3d5245),
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius:  10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.lock,
              color: Color(0xFF3d5245),
              size: 36,
            ),
          ),
          const SizedBox(height:  8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF112117).withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
            ),
            child:  Text(
              label,
              style: const TextStyle(
                color: Color(0xFF5c7a69),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBonusChest() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFF3d5245),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:  Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        Icons.inventory_2,
        color: Colors.white. withOpacity(0.5),
        size: 32,
      ),
    );
  }

  Widget _buildActiveNode() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      // Speech Bubble
      Positioned(
        top: -48,
        right: 16,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 10),
          duration: const Duration(seconds: 2),
          builder: (context, double value, child) {
            return Transform.translate(
              offset: Offset(0, math.sin(value) * 5),
              child: child,
            );
          },
          child: Container(
            constraints: const BoxConstraints(maxWidth: 140),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color:  Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              boxShadow:  [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius:  10,
                  offset:  Offset(0, 4),
                ),
              ],
            ),
            child: const Text(
              "Let's learn Ba! ",
              style: TextStyle(
                color: Color(0xFF112117),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),

      // Mascot
      Positioned(
        top: -8,
        right: -8,
        child: Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF36e27b),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF36e27b).withOpacity(0.4),
                blurRadius: 20,
              ),
            ],
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1599557621743-982194600109?q=80&w=200&auto=format&fit=crop',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),

      // Active Button with Ripple
      Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Ripple effect
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Container(
                    width: 96 + (_pulseController.value * 20),
                    height: 96 + (_pulseController.value * 20),
                    decoration: BoxDecoration(
                      shape:  BoxShape.circle,
                      color: const Color(0xFF36e27b)
                          .withOpacity(0.2 - (_pulseController.value * 0.2)),
                    ),
                  );
                },
              ),

              // Main Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LessonScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xFF36e27b),
                    shape:  BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF36e27b).withOpacity(0.4),
                        blurRadius:  30,
                        spreadRadius: 5,
                      ),
                      const BoxShadow(
                        color: Color(0xFF2ab863),
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.star,
                    color: Color(0xFF112117),
                    size: 48,
                  ),
                ),
              ),

              // Start Label
              Positioned(
                bottom: -40,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF36e27b),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black. withOpacity(0.2),
                        blurRadius:  10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child:  const Text(
                    'START',
                    style: TextStyle(
                      color: Color(0xFF112117),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

  Widget _buildCompletedNode({
    required int stars,
    required double offsetX,
  }) {
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFFFC800),
              shape: BoxShape.circle,
              boxShadow: [
                const BoxShadow(
                  color: Color(0xFFe6b400),
                  offset: Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.check,
              color: Color(0xFF112117),
              size: 40,
            ),
          ),
          const SizedBox(height:  8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              stars,
              (index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Icon(
                  Icons.star,
                  color: Color(0xFFFFC800),
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartNode({required double offsetX}) {
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: const Color(0xFFFFC800).withOpacity(0.8),
          shape: BoxShape. circle,
          boxShadow: [
            const BoxShadow(
              color: Color(0xFFe6b400),
              offset: Offset(0, 4),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons. flag,
          color: Color(0xFF112117),
          size: 32,
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF1c3326).withOpacity(0.95),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xFF3d5245),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(
              icon: Icons.school,
              isActive: true,
              onTap: () {
                // Already on learning path
              },
            ),
            _buildNavItem(
              icon: Icons.auto_stories,
              isActive: false,
              onTap: () {
                // Navigate to lesson
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LessonScreen(),
                  ),
                );
              },
            ),
            _buildNavItem(
              icon: Icons.leaderboard,
              isActive: false,
              onTap: () {
                // Navigate back to home
                Navigator.pop(context);
              },
            ),
            _buildNavItem(
              icon: Icons.face,
              isActive: false,
              onTap: () {
                // Could navigate to profile or settings
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required bool isActive,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF36e27b).withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isActive
              ? const Color(0xFF36e27b)
              : const Color(0xFF9eb7a8),
          size: 28,
        ),
      ),
    );
  }
}

// Custom painter for the winding path
class PathLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment. bottomCenter,
        colors: [
          const Color(0xFF3d5245),
          const Color(0xFF36e27b),
          const Color(0xFFFFC800),
        ],
        stops: const [0.0, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    
    // Create a winding S-curve path
    final centerX = size.width / 2;
    
    path.moveTo(centerX, size.height - 50);
    
    path.cubicTo(
      centerX + 80, size.height - 150,
      centerX + 60, size.height - 250,
      centerX, size.height - 300,
    );
    
    path.cubicTo(
      centerX - 80, size.height - 350,
      centerX - 100, size.height - 450,
      centerX, size.height - 550,
    );
    
    path.cubicTo(
      centerX + 90, size.height - 650,
      centerX + 80, size.height - 750,
      centerX, size.height - 850,
    );

    // Draw dashed path
    _drawDashedPath(canvas, path, paint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    const dashWidth = 20.0;
    const dashSpace = 15.0;
    
    paint.color = paint.shader != null 
        ? Colors.transparent 
        : paint.color;
    
    final metric = path.computeMetrics().first;
    double distance = 0.0;
    
    while (distance < metric.length) {
      final start = metric.getTangentForOffset(distance)?. position;
      distance += dashWidth;
      final end = metric.getTangentForOffset(distance)?.position;
      
      if (start != null && end != null) {
        canvas.drawLine(
          start,
          end,
          paint.. color = const Color(0xFF36e27b).withOpacity(0.4),
        );
      }
      
      distance += dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}