import 'package:flutter/material.dart';
import 'lesson_path_screen.dart';
import 'letter_lesson_screen.dart';
import 'reward_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _buildTopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children:  [
                        const SizedBox(height: 16),
                        _buildWelcomeMessage(),
                        const SizedBox(height: 24),
                        _buildGamePath(context),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
            Positioned(
              bottom: 24,
              left: 24,
              right: 24,
              child: _buildBottomNavigation(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical:  16),
      child: Row(
        children: [
          _buildStatChip(
            icon: Icons. local_fire_department,
            value: '5',
            color: const Color(0xFFffd33d),
          ),
          const SizedBox(width: 12),
          _buildStatChip(
            icon: Icons.diamond,
            value: '142',
            color: const Color(0xFF4aa9ff),
          ),
          const Spacer(),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF1c2e24).withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white. withOpacity(0.05),
              ),
            ),
            child: Icon(
              Icons.settings,
              color: Colors.white. withOpacity(0.7),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip({
    required IconData icon,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets. symmetric(horizontal: 12, vertical:  6),
      decoration: BoxDecoration(
        color: const Color(0xFF1c2e24).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 6),
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

  Widget _buildWelcomeMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize:  30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'Marhaban, '),
                TextSpan(
                  text: 'Ali! ',
                  style: TextStyle(color: Color(0xFF36e27b)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Ready for an adventure? ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGamePath(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          _buildMascotSection(context),
          const SizedBox(height: 80),
          _buildLevelNode(level: 2, label: 'Alif', isLocked: false, offsetX: 80),
          const SizedBox(height: 48),
          _buildLevelNode(level: 3, isLocked: true, offsetX: -64),
          const SizedBox(height: 48),
          _buildStarChallenge(offsetX: 32),
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget _buildMascotSection(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 100),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical:  8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius. circular(16),
              boxShadow:  [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius:  10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Text(
              'هيا بنا! ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF112117),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF36e27b).withOpacity(0.2),
                shape: BoxShape. circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF36e27b).withOpacity(0.3),
                    blurRadius:  60,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
            Container(
              width: 192,
              height: 192,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCQR2FJSnlnolg2jxslQRyzVmaNZNKRJxX-Nhqxsn-yKVQ8JhUSD0tN05U2siDJci_VGJhFMErVdK4iQmLf6QBXI6hW_pnnOj4ueDfFWxV18SBP_aedg8tew0bBOUVCzwvxR5lXIdcv8Ps0IkDcBtCD-pdPS4RLpW8jGN6bKldnw6vDrj1LX4XUt1lqadrQVGlXsusFHBlDW_fpAP5v2Kvf2iQ-xyeNB54l1-FCI-JAEJXztdHSSAvYOIuuMrLfcwQXqyRrE1Dafsc',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: -16,
              child: ElevatedButton. icon(
                onPressed: () {
                  // Navigate to Learning Path Screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LearningPathScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.play_arrow, size: 28),
                label: const Text(
                  "Let's Play! ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style:  ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF36e27b),
                  foregroundColor: const Color(0xFF112117),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  elevation: 6,
                  shadowColor: const Color(0xFF1d8547),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius. circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLevelNode({
    required int level,
    String?  label,
    required bool isLocked,
    required double offsetX,
  }) {
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFF1c2e24),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.1), width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: isLocked
                  ? Icon(Icons.lock, color: Colors.white. withOpacity(0.3), size: 28)
                  : Text(
                      '$level',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          if (label != null) ...[
            const SizedBox(height:  8),
            Text(
              label. toUpperCase(),
              style: TextStyle(
                color: Colors. white.withOpacity(0.4),
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStarChallenge({required double offsetX}) {
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: const Color(0xFF1c2e24),
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFffd33d).withOpacity(0.3),
            width: 4,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFffd33d).withOpacity(0.2),
            shape: BoxShape. circle,
          ),
          child: const Icon(Icons.star, color: Color(0xFFffd33d), size: 24),
        ),
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF1c2e24),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNavButton(icon: Icons.home, isActive: true),
            _buildNavButton(
              icon: Icons.menu_book,
              isActive: false,
              onTap: () {
                // Navigate to Learning Path
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LearningPathScreen(),
                  ),
                );
              },
            ),
            _buildNavButton(
              icon: Icons.storefront, 
              isActive: false, 
              hasNotification: true,
              onTap: () {
                // Navigate to Lesson Screen (demo)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LessonScreen(),
                  ),
                );
              },
            ),
            _buildNavButton(
              icon: Icons.face, 
              isActive: false,
              onTap: () {
                // Navigate to Reward Screen (demo)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RewardScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required bool isActive,
    bool hasNotification = false,
    VoidCallback? onTap,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 56,
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: isActive ?  Colors.white. withOpacity(0.1) : Colors.transparent,
            shape: BoxShape. circle,
          ),
          child: IconButton(
            onPressed: onTap ??  () {},
            icon: Icon(
              icon,
              color:  isActive ? const Color(0xFF36e27b) : Colors.white. withOpacity(0.4),
              size: 30,
            ),
          ),
        ),
        if (hasNotification)
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF1c2e24), width: 2),
              ),
            ),
          ),
      ],
    );
  }
}