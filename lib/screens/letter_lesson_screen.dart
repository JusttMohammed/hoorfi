import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'reward_screen.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({Key? key}) : super(key: key);

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen>
    with TickerProviderStateMixin {
  bool _showConfetti = false;
  int? _selectedOptionIndex;
  late AnimationController _fadeInController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    
    // Fade-in-up animation for question section
    _fadeInController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _fadeInController,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _fadeInController,
      curve: Curves.easeOut,
    ));

    _fadeInController.forward();
  }

  @override
  void dispose() {
    _fadeInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? const Color(0xFF2a2018) : const Color(0xFFf8f7f5),
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                // Main scrollable content
                Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 480),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                                bottom: 120,
                              ),
                              child: Column(
                                children: [
                                  _buildHeader(),
                                  const SizedBox(height: 8),
                                  _buildQuestionSection(),
                                  const SizedBox(height: 32),
                                  _buildAnswerOptions(),
                                ],
                              ),
                            ),
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
                  right: 0,
                  child: _buildBottomActionBar(),
                ),

                // Confetti overlay (when answer is correct)
                if (_showConfetti) _buildConfettiOverlay(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          // Close button (LEFT side in RTL)
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            color: Colors.grey,
            iconSize: 32,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          const SizedBox(width: 16),

          // Progress bar (CENTER)
          Expanded(
            child: Container(
              height: 16,
              decoration: BoxDecoration(
                color: isDark 
                  ? Colors.white.withOpacity(0.1) 
                  : const Color(0xFFf1f0ed),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  // Filled portion
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 16,
                    decoration: BoxDecoration(
                      color: const Color(0xFFf48c25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        // Highlight bar
                        Positioned(
                          top: 4,
                          right: 8,
                          child: Container(
                            width: 20,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Hearts indicator (RIGHT side in RTL)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isDark 
                ? const Color(0xFF7f1d1d).withOpacity(0.2)
                : const Color(0xFFfee2e2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.favorite,
                  color: Color(0xFFef4444),
                  size: 28,
                ),
                SizedBox(width: 4),
                Text(
                  '5',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFef4444),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionSection() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return FadeTransition(
      opacity: _fadeInAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Mascot image (LEFT side in RTL)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFf48c25).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Transform.scale(
                  scale: 2.0,
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAkYt3iISGOYwPq0HE7cF_xzd_xG2YtXd36qsYaQ9Nx_Hd5iqgLV5nkL_Z_-xDLqKdr2nvYazqqhcPcGQ6-k-9dj1G0OO2F1sRi9VeTVP-w5Ub7PvnX9yiKJazxvTyBo2-FGF42deRDdLhibgd0nlHez8p_4YMzc9m4qhoPSx2dznWD1zUo0ued3a3B1SJKEV0SukgH4jUgksW5uOD4JVlk3wrM_HsgO2kaaYIoiSfz3rzkZcwerJxpJcOor6R94i-Npq8MiseOsnk',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.person, size: 40, color: Color(0xFFf48c25));
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Speech bubble (RIGHT side in RTL)
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withOpacity(0.05)
                      : Colors.white,
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withOpacity(0.1)
                        : const Color(0xFFe6e0db),
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'سؤال جديد',
                          style: TextStyle(
                            color: isDark 
                              ? Colors.white.withOpacity(0.5)
                              : const Color(0xFF8a7560),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : const Color(0xFF181411),
                              height: 1.4,
                            ),
                            children: const [
                              TextSpan(text: 'أي من هذه الحروف هو '),
                              TextSpan(
                                text: 'أ',
                                style: TextStyle(
                                  color: Color(0xFFf48c25),
                                  fontSize: 32,
                                ),
                              ),
                              TextSpan(text: '؟'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Audio button
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Material(
                        color: const Color(0xFFf48c25).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: () {
                            // TODO: Implement audio playback
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.volume_up,
                              color: Color(0xFFf48c25),
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerOptions() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final options = ['أ', 'ب', 'ت', 'ث'];
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        final isSelected = _selectedOptionIndex == index;
        final isCorrect = index == 0; // First option is correct (أ)
        
        return _buildOptionButton(
          letter: options[index],
          isSelected: isSelected && isCorrect,
          onTap: () {
            setState(() {
              _selectedOptionIndex = index;
            });
          },
          isDark: isDark,
        );
      },
    );
  }

  Widget _buildOptionButton({
    required String letter,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark 
                  ? const Color(0xFFf48c25).withOpacity(0.1) 
                  : const Color(0xFFf48c25).withOpacity(0.05))
              : (isDark 
                  ? Colors.white.withOpacity(0.05) 
                  : Colors.white),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFf48c25)
                : (isDark 
                    ? Colors.white.withOpacity(0.1) 
                    : const Color(0xFFe6e0db)),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: isSelected 
                  ? const Color(0xFFf48c25) 
                  : const Color(0xFFe6e0db),
              offset: const Offset(0, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Letter
            Center(
              child: Transform.scale(
                scale: isSelected ? 1.1 : 1.0,
                child: Text(
                  letter,
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w900,
                    color: isSelected 
                        ? const Color(0xFFf48c25) 
                        : (isDark ? Colors.white : const Color(0xFF181411)),
                    height: 1.0,
                  ),
                ),
              ),
            ),
            
            // Volume icon (top-right)
            Positioned(
              top: 12,
              right: 12,
              child: Icon(
                Icons.volume_up,
                size: 20,
                color: isSelected
                    ? const Color(0xFFf48c25)
                    : Colors.grey.withOpacity(0.3),
              ),
            ),
            
            // Check badge (top-left) - only for selected
            if (isSelected)
              Positioned(
                top: -8,
                left: -8,
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFFf48c25),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActionBar() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasSelection = _selectedOptionIndex != null;
    
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2a2018) : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark 
                ? Colors.white.withOpacity(0.05) 
                : const Color(0xFFf1f0ed),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  // Skip button (hidden on mobile, visible on md+)
                  if (MediaQuery.of(context).size.width > 600)
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO: Implement skip functionality
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: isDark 
                                ? Colors.white.withOpacity(0.1) 
                                : const Color(0xFFe6e0db),
                            width: 2,
                          ),
                          foregroundColor: isDark 
                              ? Colors.white.withOpacity(0.5)
                              : const Color(0xFF8a7560),
                          minimumSize: const Size(100, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'تخطى',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  
                  // Check button (Primary action)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: hasSelection ? () {
                        // Show confetti briefly
                        setState(() {
                          _showConfetti = true;
                        });
                        
                        // Navigate to reward screen after a short delay
                        Future.delayed(const Duration(milliseconds: 1500), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RewardScreen(
                                coinsEarned: 50,
                                totalXP: 120,
                                streakDays: 12,
                                celebrationText: 'Mumtaz!',
                              ),
                            ),
                          );
                        });
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hasSelection 
                            ? const Color(0xFFf48c25) 
                            : (isDark 
                                ? Colors.white.withOpacity(0.1) 
                                : const Color(0xFFe6e0db)),
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: isDark 
                            ? Colors.white.withOpacity(0.1) 
                            : const Color(0xFFe6e0db),
                        disabledForegroundColor: isDark 
                            ? Colors.white.withOpacity(0.3)
                            : const Color(0xFF8a7560),
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: hasSelection ? 8 : 0,
                        shadowColor: hasSelection 
                            ? const Color(0xFFf48c25).withOpacity(0.3) 
                            : Colors.transparent,
                      ),
                      child: const Text(
                        'تحقق',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
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
      const Color(0xFFf48c25),
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