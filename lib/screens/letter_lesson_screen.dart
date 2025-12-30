import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'reward_screen.dart';
import 'tracing_activity_screen.dart';


class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen>
    with TickerProviderStateMixin {
  late AnimationController _bounceController;
  late AnimationController _scaleController;
  bool _showConfetti = false;

  @override
  void initState() {
    super.initState();
    
    // Bounce animation for mascot
    _bounceController = AnimationController(
      vsync: this,
      duration:  const Duration(seconds: 2),
    )..repeat(reverse: true);

    // Scale animation for card hover effect
    _scaleController = AnimationController(
      vsync:  this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 1.0,
      upperBound: 1.05,
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main Content
          Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        _buildLetterCard(),
                        const SizedBox(height: 32),
                        _buildInteractionButtons(),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Bottom Action Bar
          Positioned(
            bottom: 0,
            left: 0,
            right:  0,
            child: _buildBottomActionBar(),
          ),

          // Confetti overlay (when answer is correct)
          if (_showConfetti) _buildConfettiOverlay(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      bottom: false,
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
        child: Column(
          children: [
            // Top bar with close button, progress, and hearts
            Row(
              children:  [
                // Close button
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon:  const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 32,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),

                const SizedBox(width: 16),

                // Progress bar
                Expanded(
                  child:  Container(
                    height: 16,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1c2e24),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.35,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF36e27b),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF36e27b).withOpacity(0.5),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8, top: 4),
                                child: Container(
                                  width: 8,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white. withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // Hearts
                Row(
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 24,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height:  16),

            // Lesson title
            Text(
              'LESSON 1: LETTER ALIF',
              style:  TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLetterCard() {
    return Center(
      child: SizedBox(
        width: 340,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Mascot character
            Positioned(
              top: -64,
              right: -16,
              child: AnimatedBuilder(
                animation: _bounceController,
                builder:  (context, child) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      math.sin(_bounceController.value * math.pi * 2) * 10,
                    ),
                    child: child,
                  );
                },
                child: Container(
                  width: 128,
                  height: 128,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDj8jOpH5gokzFdogERa1l1f-Dp-21zuWd13WQNwpTFzjEAOLm5z07PrBxaSh8EC0f4ov65dg3tXHstusYqjrMB5ZMFChT_rqo3wZFjYirQ65IdT1P--P9JO1H4z1G5TZwL84rkQYSX4pN4s-gZwVt52BJlZ9h7MBlRmY2RFu_isnLjHCQMOtpGk7LeNGRrCqOIinkHCFHW4cOgOwcCCVUp8yF4B_CsLM6Ep102vj9N3btfZMgN7YokFOa1lzk0f_exmiMaOrsnME4',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            // The card
            GestureDetector(
              onTapDown: (_) => _scaleController.forward(),
              onTapUp: (_) => _scaleController.reverse(),
              onTapCancel: () => _scaleController.reverse(),
              child: AnimatedBuilder(
                animation: _scaleController,
                builder:  (context, child) {
                  return Transform.scale(
                    scale: _scaleController. value,
                    child: child,
                  );
                },
                child: AspectRatio(
                  aspectRatio: 4 / 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color:  const Color(0xFF1c2e24),
                      borderRadius: BorderRadius.circular(48),
                      border: Border.all(
                        color: const Color(0xFF2a4034),
                        width: 6,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius:  40,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child:  Stack(
                      children: [
                        // Background pattern
                        Positioned.fill(
                          child:  Opacity(
                            opacity: 0.1,
                            child: CustomPaint(
                              painter:  DotPatternPainter(),
                            ),
                          ),
                        ),

                        // Letter content
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Arabic letter
                              const Text(
                                'أَ',
                                style: TextStyle(
                                  fontSize: 160,
                                  fontWeight:  FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.0,
                                  shadows: [
                                    Shadow(
                                      color: Colors. black26,
                                      blurRadius: 20,
                                      offset:  Offset(0, 10),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Transliteration
                              Text(
                                'Alif',
                                style:  TextStyle(
                                  fontSize: 24,
                                  fontWeight:  FontWeight.bold,
                                  color: Colors.grey[400],
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Pronunciation
                              const Text(
                                '( a )',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF36e27b),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Audio button
                        Positioned(
                          bottom: 24,
                          right: 24,
                          child: _buildAudioButton(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioButton() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFF36e27b),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF36e27b).withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Play audio
            print('Playing audio.. .');
          },
          customBorder: const CircleBorder(),
          child: const Center(
            child: Icon(
              Icons.volume_up,
              color: Color(0xFF112117),
              size: 32,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInteractionButtons() {
  return SizedBox(
    width: 340,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildInteractionButton(
          icon: Icons.edit,
          label: 'Trace',
          onTap:  () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TracingScreen(),
              ),
            );
          },
        ),
        _buildInteractionButton(
          icon: Icons.search,
          label: 'Find',
          onTap: () {
            print('Find tapped');
          },
        ),
        _buildInteractionButton(
          icon: Icons.mic,
          label: 'Speak',
          onTap:  () {
            print('Speak tapped');
          },
        ),
      ],
    ),
  );
}

  Widget _buildInteractionButton({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap:  onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFF1c2e24),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF2a4034),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius:  10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.grey[400],
              size: 32,
            ),
          ),
          const SizedBox(height:  8),
          Text(
            label. toUpperCase(),
            style:  TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400],
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildBottomActionBar() {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF112117).withOpacity(0.95),
      border: const Border(
        top: BorderSide(
          color: Colors. white10,
          width: 1,
        ),
      ),
    ),
    child: SafeArea(
      top: false,
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ElevatedButton(
              onPressed: () {
                // Show confetti briefly
                setState(() {
                  _showConfetti = true;
                });
                
                // Navigate to reward screen after a short delay
                Future.delayed(const Duration(milliseconds: 1500), () {
                  Navigator. pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RewardScreen(
                        coinsEarned: 50,
                        totalXP: 120,
                        streakDays: 12,
                        celebrationText: 'Mumtaz! ',
                      ),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF36e27b),
                foregroundColor: const Color(0xFF112117),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius. circular(30),
                ),
                elevation:  0,
                shadowColor:  Colors.transparent,
              ).copyWith(
                overlayColor:  MaterialStateProperty.all(
                  const Color(0xFF2cc968),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF25a256),
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Text(
                  'CHECK',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
  Widget _buildConfettiOverlay() {
    return Positioned.fill(
      child: IgnorePointer(
        child:  Stack(
          children: List.generate(
            30,
            (index) => _ConfettiParticle(
              key: ValueKey(index),
              delay: Duration(milliseconds: index * 50),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom painter for dot pattern background
class DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF36e27b)
      ..style = PaintingStyle.fill;

    const spacing = 20.0;
    const dotSize = 1.0;

    for (double x = 0; x < size. width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Confetti particle widget
class _ConfettiParticle extends StatefulWidget {
  final Duration delay;

  const _ConfettiParticle({
    Key? key,
    required this.delay,
  }) : super(key: key);

  @override
  State<_ConfettiParticle> createState() => _ConfettiParticleState();
}

class _ConfettiParticleState extends State<_ConfettiParticle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _startX;
  late double _endX;
  late Color _color;
  late double _rotation;

  @override
  void initState() {
    super.initState();

    final random = math.Random();
    _startX = random.nextDouble();
    _endX = _startX + (random.nextDouble() - 0.5) * 0.3;
    _rotation = random.nextDouble() * math.pi * 4;
    
    final colors = [
      const Color(0xFF36e27b),
      const Color(0xFFFFC800),
      const Color(0xFF4aa9ff),
      Colors.red,
      Colors.purple,
    ];
    _color = colors[random.nextInt(colors.length)];

    _controller = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: 1500 + random.nextInt(1000)),
    );

    _animation = CurvedAnimation(
      parent:  _controller,
      curve:  Curves.easeOut,
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller. forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final screenSize = MediaQuery.of(context).size;
        final x = (_startX + (_endX - _startX) * _animation.value) * screenSize.width;
        final y = _animation.value * screenSize.height;

        return Positioned(
          left: x,
          top: y,
          child: Transform.rotate(
            angle: _rotation * _animation.value,
            child: Opacity(
              opacity: 1 - _animation.value,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _color,
                  shape: BoxShape. circle,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}