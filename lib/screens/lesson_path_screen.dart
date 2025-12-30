import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'letter_lesson_screen.dart';

class LearningPathScreen extends StatefulWidget {
  const LearningPathScreen({Key? key}) : super(key: key);

  @override
  State<LearningPathScreen> createState() => _LearningPathScreenState();
}

class _LearningPathScreenState extends State<LearningPathScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _floatController;
  int _selectedNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? const Color(0xFF221910) : const Color(0xFFF8F7F5),
        body: Stack(
          children: [
            // Main content
            Column(
              children: [
                _buildStickyHeader(isDark),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 120),
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 480),
                        child: Column(
                          children: [
                            _buildUnitCard(isDark),
                            _buildLearningPath(isDark),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            // Bottom Navigation
            _buildBottomNavigation(isDark),
          ],
        ),
      ),
    );
  }

  // Sticky Header with Stats
  Widget _buildStickyHeader(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: (isDark ? Colors.black : Colors.white).withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Settings icon on LEFT (in RTL, this appears visually on the left)
              IconButton(
                icon: const Icon(Icons.settings, size: 24),
                color: isDark ? Colors.white : Colors.black54,
                onPressed: () {},
              ),
              const Spacer(),
              // Stats on RIGHT (in RTL, these appear visually on the right)
              _buildStatItem(Icons.favorite, const Color(0xFFEF4444), '٥'),
              const SizedBox(width: 12),
              _buildStatItem(Icons.diamond, const Color(0xFF1CB0F6), '٤٥٠'),
              const SizedBox(width: 12),
              _buildStatItem(Icons.local_fire_department, const Color(0xFFF97316), '٣'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, Color color, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  // Unit Card Header
  Widget _buildUnitCard(bool isDark) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF48C25), Color(0xFFD67618)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF48C25).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Content
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الوحدة الأولى',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'الحروف الأساسية: أ، ب، ت',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.95),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.menu_book,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Learning Path
  Widget _buildLearningPath(bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      child: Column(
        children: [
          // Completed Star Node #1
          _buildCompletedNode(
            icon: Icons.star,
            offsetX: 0,
            isDark: isDark,
          ),
          
          const SizedBox(height: 32),
          
          // Completed Check Node #2 with badge
          _buildCompletedNodeWithBadge(
            offsetX: 32,
            isDark: isDark,
          ),
          
          const SizedBox(height: 48),
          
          // Current Active Node (درس ٣)
          _buildActiveNode(isDark),
          
          const SizedBox(height: 32),
          
          // Locked Node #1
          _buildLockedNode(
            offsetX: 32,
            isDark: isDark,
          ),
          
          const SizedBox(height: 32),
          
          // Locked Node #2
          _buildLockedNode(
            offsetX: 0,
            isDark: isDark,
          ),
          
          const SizedBox(height: 48),
          
          // Treasure/Reward Box
          _buildTreasureBox(isDark),
        ],
      ),
    );
  }

  // Completed Node
  Widget _buildCompletedNode({
    required IconData icon,
    required double offsetX,
    required bool isDark,
  }) {
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: GestureDetector(
        onTapDown: (_) => setState(() {}),
        onTapUp: (_) => setState(() {}),
        onTapCancel: () => setState(() {}),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFFFFC800),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 6),
              ),
              const BoxShadow(
                color: Color(0xFFE6B400),
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  // Completed Node with Star Badge
  Widget _buildCompletedNodeWithBadge({
    required double offsetX,
    required bool isDark,
  }) {
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTapDown: (_) => setState(() {}),
            onTapUp: (_) => setState(() {}),
            onTapCancel: () => setState(() {}),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC800),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(0, 6),
                  ),
                  const BoxShadow(
                    color: Color(0xFFE6B400),
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          // Star badge
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.star,
                color: Color(0xFFFFC800),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Active Node with Mascot
  Widget _buildActiveNode(bool isDark) {
    return Transform.translate(
      offset: const Offset(-24, 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Mascot and Speech Bubble
          Positioned(
            top: -70,
            right: -20,
            child: AnimatedBuilder(
              animation: _floatController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, math.sin(_floatController.value * 2 * math.pi) * 5),
                  child: child,
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Speech bubble
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      'هيا بنا نتعلم!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Mascot
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF48C25).withOpacity(0.1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuAkYt3iISGOYwPq0HE7cF_xzd_xG2YtXd36qsYaQ9Nx_Hd5iqgLV5nkL_Z_-xDLqKdr2nvYazqqhcPcGQ6-k-9dj1G0OO2F1sRi9VeTVP-w5Ub7PvnX9yiKJazxvTyBo2-FGF42deRDdLhibgd0nlHez8p_4YMzc9m4qhoPSx2dznWD1zUo0ued3a3B1SJKEV0SukgH4jUgksW5uOD4JVlk3wrM_HsgO2kaaYIoiSfz3rzkZcwerJxpJcOor6R94i-Npq8MiseOsnk',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Main Content
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // Ping animation background
                  AnimatedBuilder(
                    animation: _pulseController,
                    builder: (context, child) {
                      return Container(
                        width: 96 + (_pulseController.value * 40),
                        height: 96 + (_pulseController.value * 40),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFF48C25).withOpacity(0.2 - (_pulseController.value * 0.2)),
                        ),
                      );
                    },
                  ),
                  
                  // Ring effect
                  Container(
                    width: 112,
                    height: 112,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFF48C25).withOpacity(0.1),
                        width: 8,
                      ),
                    ),
                  ),
                  
                  // Main button
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
                        color: const Color(0xFFF48C25),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 8),
                          ),
                          const BoxShadow(
                            color: Color(0xFFD67618),
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'درس ٣',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Locked Node
  Widget _buildLockedNode({
    required double offsetX,
    required bool isDark,
  }) {
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: isDark ? const Color(0xFF1F2937) : const Color(0xFFD1D5DB),
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Icon(
          Icons.lock,
          color: isDark ? Colors.grey[600] : Colors.grey[400],
          size: 40,
        ),
      ),
    );
  }

  // Treasure Box
  Widget _buildTreasureBox(bool isDark) {
    return Column(
      children: [
        GestureDetector(
          onTapDown: (_) => setState(() {}),
          onTapUp: (_) => setState(() {}),
          onTapCancel: () => setState(() {}),
          child: Container(
            width: 96,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFBBF24), Color(0xFFF97316)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: const Offset(0, 6),
                ),
                const BoxShadow(
                  color: Color(0xFFEA580C),
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: const Icon(
              Icons.inventory_2,
              color: Colors.white,
              size: 48,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'كنز الوحدة',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white60 : Colors.black54,
          ),
        ),
      ],
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavigation(bool isDark) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          decoration: BoxDecoration(
            color: isDark ? Colors.black : Colors.white,
            border: Border(
              top: BorderSide(
                color: isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                width: 2,
              ),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home,
                label: 'الرئيسية',
                isActive: true,
                isDark: isDark,
                onTap: () {
                  setState(() => _selectedNavIndex = 0);
                },
              ),
              _buildNavItem(
                icon: Icons.fitness_center,
                label: 'تدريب',
                isActive: false,
                isDark: isDark,
                onTap: () {
                  setState(() => _selectedNavIndex = 1);
                },
              ),
              _buildNavItem(
                icon: Icons.shield,
                label: 'المتصدرين',
                isActive: false,
                isDark: isDark,
                onTap: () {
                  setState(() => _selectedNavIndex = 2);
                },
              ),
              _buildNavItem(
                icon: Icons.face,
                label: 'حسابي',
                isActive: false,
                isDark: isDark,
                hasNotification: true,
                onTap: () {
                  setState(() => _selectedNavIndex = 3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required bool isDark,
    bool hasNotification = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: isActive
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 8)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive 
              ? const Color(0xFFF48C25).withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  icon,
                  color: isActive
                      ? const Color(0xFFF48C25)
                      : (isDark ? Colors.white.withOpacity(0.3) : Colors.grey[400]),
                  size: 28,
                ),
                if (hasNotification)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEF4444),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            if (isActive) const SizedBox(height: 4),
            if (isActive)
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF48C25),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Remove the old PathLinePainter class - no longer needed