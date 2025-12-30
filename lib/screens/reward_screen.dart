import 'package:flutter/material.dart';
import 'dart:math' as math;

class RewardScreen extends StatefulWidget {
  final int coinsEarned;
  final int totalXP;
  final int streakDays;
  final String celebrationText;
  final String subtitle;

  const RewardScreen({
    Key? key,
    this.coinsEarned = 50,
    this.totalXP = 120,
    this. streakDays = 12,
    this.celebrationText = 'Mumtaz!',
    this.subtitle = 'Lesson Complete',
  }) : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _scaleController;
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();

    // Float animation for stars
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // Scale animation for entrance
    _scaleController = AnimationController(
      vsync:  this,
      duration: const Duration(milliseconds: 1200),
    );

    // Glow pulse animation
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // Start entrance animation
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _scaleController.forward();
      }
    });
  }

  @override
  void dispose() {
    _floatController. dispose();
    _scaleController.dispose();
    _glowController.dispose();
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

          // Main content
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: _buildMainContent(),
                ),
              ],
            ),
          ),

          // Footer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildFooter(),
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
              // Top left star
              Positioned(
                top: 80,
                left: 40,
                child: Transform.rotate(
                  angle: 0.2,
                  child: const Text(
                    '★',
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF36e27b),
                    ),
                  ),
                ),
              ),
              // Top right circle
              Positioned(
                top: 160,
                right: 40,
                child: Transform.rotate(
                  angle: -0.2,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color:  Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              // Bottom left sparkle
              Positioned(
                bottom: 300,
                left: 20,
                child: Transform.rotate(
                  angle: 0.8,
                  child: const Text(
                    '✦',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF36e27b),
                    ),
                  ),
                ),
              ),
              // Middle right star
              Positioned(
                top: 200,
                right:  120,
                child: const Text(
                  '★',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Close button
          Container(
            width: 40,
            height:  40,
            decoration: BoxDecoration(
              color: const Color(0xFF1c3024).withOpacity(0.5),
              shape: BoxShape. circle,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap:  () => Navigator.pop(context),
                customBorder: const CircleBorder(),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),

          // Streak badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1c3024).withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.05),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons. local_fire_department,
                  color: Colors.orange,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  '${widget.streakDays} Day Streak',
                  style:  const TextStyle(
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
    );
  }

  Widget _buildMainContent() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment. center,
          children: [
            // Headline
            _buildHeadline(),

            const SizedBox(height: 48),

            // Hero:  Stars & Mascot
            _buildHeroSection(),

            const SizedBox(height: 48),

            // Rewards grid
            _buildRewardsGrid(),

            const SizedBox(height: 120), // Space for footer
          ],
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    return ScaleTransition(
      scale:  CurvedAnimation(
        parent:  _scaleController,
        curve:  Curves.elasticOut,
      ),
      child: Column(
        children: [
          // Main celebration text with glow
          AnimatedBuilder(
            animation: _glowController,
            builder:  (context, child) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF36e27b)
                          .withOpacity(0.3 + (_glowController.value * 0.2)),
                      blurRadius:  15 + (_glowController.value * 10),
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child:  child,
              );
            },
            child: Text(
              widget.celebrationText,
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w900,
                color: Color(0xFF36e27b),
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height:  8),
          // Subtitle
          Text(
            widget.subtitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF9eb7a8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Animated glow effect
          AnimatedBuilder(
            animation: _glowController,
            builder: (context, child) {
              return Container(
                width: 256 + (_glowController.value * 20),
                height: 256 + (_glowController.value * 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF36e27b)
                      .withOpacity(0.15 + (_glowController.value * 0.05)),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF36e27b)
                          .withOpacity(0.2 + (_glowController.value * 0.1)),
                      blurRadius: 60 + (_glowController.value * 20),
                      spreadRadius: 30,
                    ),
                  ],
                ),
              );
            },
          ),

          // Stars and Mascot
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Stars row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Left star
                  _buildFloatingStar(
                    imageUrl: 
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuBasmabut6FGVpWSScLSPo6-QCmrz4cls_m_ZXxLZwBumGJ_H79zdIO0ryauYUEgaWaDmDjRkbIjYwwZnlYz4WfcSfPcS8T5AhaR3n49sETMfLRrtA5yEgGMGzOCSKfmeDRd28UH5mQfveiIO14OF4HkBvvUKwzAy7Cz4EEsC32MYohrpFTh1htNGPlDKpXmFNwGfOCLBtkAfl1HA7EQR4XXRAxp3W9h7rZ7XO-HHlp8tV5FX7ZsjNwkEDs8P3GpVkyq57r_svZLl4',
                    size: 80,
                    rotation: -0.26,
                    delay: 0.5,
                  ),

                  const SizedBox(width: 16),

                  // Center star (larger)
                  _buildFloatingStar(
                    imageUrl:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuD9PNbNOKRXRd26gnvb3D6xIGN2pNPT5DJw1U39o6lTCFRQHwI5JyZyzyeUxWb87GJL9FGKiIDk1yM6fs42wVcEk15gS5FFVxqkDSByr2uXSQLHVtYlAqbibAQAHDP4ccZ9TWB00zo8dgyFlWie4PpGKLUiWZZqjBmO69t1wM6xo4L19LtMf29khIZwUVPHiCJd2V0ul9RsfwnuncSsMCc1tvIPDIVpFYIOzWy9MFNlH4CZnKwY6vIKmWqtzH-pmvIyymJI5r4VNjQ',
                    size: 120,
                    rotation: 0,
                    delay: 0,
                  ),

                  const SizedBox(width: 16),

                  // Right star
                  _buildFloatingStar(
                    imageUrl:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCso7SYfvcrbq6Xlgiw7Va2XlVjmK-U24TTod4K_UBy83A9C6V1iob2vgoUeyrHbDlglK5qRCJr0ZEMuoKaYyxeM1MXxryQMg3_m0gZ6f7VH2jAyggK5BJ6OEX1Te6oq72wccmj-jdGOv11Qi40D6jOR0pVZ-P4jJMhHfEZMtaIcymjuZ_OQ2OgDjkEH5vIEM0QG4SY3YUGOGDxBxkIo_FJEDHRVMKINGAvsGTJ-oiRkUaAb5g-NdzIUlztKL4zUFBdMEuquYAAW50',
                    size: 80,
                    rotation: 0.26,
                    delay: 0.5,
                  ),
                ],
              ),

              // Mascot
              Transform.translate(
                offset: const Offset(0, -20),
                child: FadeTransition(
                  opacity: CurvedAnimation(
                    parent: _scaleController,
                    curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
                  ),
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCDXiu_T7LPvLypgyNcvVj4VgTe__1Jw9H0JsX6oJRaUNBMzjHnmn8v9vQ_gK9Asj7cxmHViW-oBG1dA2u1upvhztm1hLog7rOx75hPEUutgzEAzMrx6g2n3T5Pfjz_YISCQclrLv0EsHIx8lg_gD2ZNgvsdSfIH-3ma0TPOv2UxX46Bk5jVJaOg_MlbprfJHtE9XGBRNhw_OQPDaoUMSh-I2xnoEZ7joZuMenqye6zgbqyoQmL-DgDdth2Xsd_S8BaDSqKzTMwqJ4',
                    width: 200,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color:  Colors.grey.shade800,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.emoji_emotions,
                          size: 100,
                          color: Colors. white54,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingStar({
    required String imageUrl,
    required double size,
    required double rotation,
    required double delay,
  }) {
    return AnimatedBuilder(
      animation: _floatController,
      builder:  (context, child) {
        return Transform.translate(
          offset: Offset(
            0,
            -10 +
                (math.sin((_floatController. value + delay) * 2 * math.pi) *
                    10),
          ),
          child: child,
        );
      },
      child: Transform. rotate(
        angle: rotation,
        child: FadeTransition(
          opacity:  CurvedAnimation(
            parent: _scaleController,
            curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
          ),
          child: Image. network(
            imageUrl,
            width: size,
            height: size,
            errorBuilder:  (context, error, stackTrace) {
              return Icon(
                Icons.star,
                size: size,
                color: Colors.amber,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRewardsGrid() {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent:  _scaleController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
      child: ConstrainedBox(
        constraints:  const BoxConstraints(maxWidth: 320),
        child: Row(
          children: [
            Expanded(
              child: _buildRewardCard(
                icon: Icons.monetization_on,
                iconColor: const Color(0xFFFFD700),
                value: '+${widget.coinsEarned}',
                label: 'Coins',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildRewardCard(
                icon: Icons.bolt,
                iconColor: Colors.blue,
                value: '${widget.totalXP}',
                label: 'Total XP',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardCard({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1c3024),
        borderRadius: BorderRadius. circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size:  24,
              ),
              const SizedBox(width: 6),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label. toUpperCase(),
            style:  const TextStyle(
              color:  Color(0xFF9eb7a8),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF112117).withOpacity(0),
            const Color(0xFF112117).withOpacity(0.8),
            const Color(0xFF112117),
          ],
        ),
      ),
      child: SafeArea(
        top: false,
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Motivational text
              Text(
                "You're on fire! Keep it up!",
                style: TextStyle(
                  color: Colors.white. withOpacity(0.8),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.3,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              
              // Continue button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator. pop(context);
                  },
                  borderRadius: BorderRadius.circular(32),
                  child:  Ink(
                    decoration: BoxDecoration(
                      color: const Color(0xFF36e27b),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF36e27b).withOpacity(0.4),
                          blurRadius:  20,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Container(
                      height: 64,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Continue',
                            style: TextStyle(
                              color: Color(0xFF112117),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xFF112117),
                            size: 24,
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
      ),
    );
  }
}