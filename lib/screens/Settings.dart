import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _soundEnabled = true;
  bool _musicEnabled = true;
  String _reminderTime = '٠٤:٠٠ م';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:  TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFf8f7f5),
        body: Stack(
          children: [
            // Main content
            Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: _buildContent(),
                ),
                const SizedBox(height: 80), // Space for bottom nav
              ],
            ),

            // Bottom navigation
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomNavigation(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFf8f7f5).withOpacity(0.95),
      ),
      child: SafeArea(
        bottom: false,
        child:  Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              // User Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:  const Color(0xFFf48c25).withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuD6-1XJIZqkndHbFu0Ikt0UkBG9gUnddLivp3l10RtXRuTDEwUTNaQ_wnv77L4Pf-rEIG_W9uI0jHPNTd3-PbnFTVO3vuBGZ-Yt1JuLZFGKeMQSRnXK1UnkM-9CFajxFkzHwYtC_tD2t664wFJyftD5tkdnjKDdvB9dsA4IEyMujITz4R_bZ9AMJCHBNFLmlGJXmD2wPOrH-_y1ZZmIJ4x99klIsq0zlXhuOTYGyqRJK8wMNl1-wQCuWYAS1zdJG8OT9gWcKHt2arA',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.person, size: 24);
                    },
                  ),
                ),
              ),

              // Title
              const Text(
                'الإعدادات',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight:  FontWeight.w800,
                  color: Color(0xFF181411),
                ),
              ),

              // Spacer
              const SizedBox(width: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPremiumBanner(),
          const SizedBox(height: 24),
          _buildAccountSection(),
          const SizedBox(height: 24),
          _buildPreferencesSection(),
          const SizedBox(height: 24),
          _buildSupportSection(),
          const SizedBox(height: 16),
          _buildSignOutButton(),
          const SizedBox(height: 16),
          _buildVersionInfo(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildPremiumBanner() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFf48c25),
            Color(0xFFff9933),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:  const Color(0xFFf48c25).withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background decoration
          Positioned(
            right: -16,
            top: -16,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape. circle,
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Expanded(
                  child: Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'نسخة الأبطال 👑',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'افتح جميع الدروس بدون إعلانات! ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors. white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle upgrade
                  },
                  style:  ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor:  const Color(0xFFf48c25),
                    padding:  const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'ترقية',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            'حسابي',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF181411),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.black.withOpacity(0.05),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildSettingsItem(
                icon: Icons.person_outline,
                iconColor: Colors.blue,
                iconBg: Colors.blue.withOpacity(0.1),
                title: 'تعديل الملف الشخصي',
                subtitle: 'الاسم، الصورة، البريد',
                onTap: () {},
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.lock_outline,
                iconColor: Colors.purple,
                iconBg: Colors.purple.withOpacity(0.1),
                title: 'كلمة المرور',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical:  8),
          child: Text(
            'التفضيلات',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF181411),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border. all(
              color: Colors. black.withOpacity(0.05),
            ),
            boxShadow: [
              BoxShadow(
                color:  Colors.black.withOpacity(0.04),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildToggleItem(
                icon: Icons.volume_up,
                iconColor: Colors.green,
                iconBg: Colors.green.withOpacity(0.1),
                title: 'المؤثرات الصوتية',
                value: _soundEnabled,
                onChanged: (value) {
                  setState(() {
                    _soundEnabled = value;
                  });
                },
              ),
              _buildDivider(),
              _buildToggleItem(
                icon: Icons.music_note,
                iconColor:  Colors.pink,
                iconBg: Colors.pink.withOpacity(0.1),
                title: 'الموسيقى الخلفية',
                value: _musicEnabled,
                onChanged: (value) {
                  setState(() {
                    _musicEnabled = value;
                  });
                },
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.notifications_active,
                iconColor: Colors. orange,
                iconBg:  Colors.orange.withOpacity(0.1),
                title: 'التذكير اليومي',
                trailing: Row(
                  mainAxisSize:  MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFf48c25).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _reminderTime,
                        style: const TextStyle(
                          color: Color(0xFFf48c25),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Transform.rotate(
                      angle: 3.14159, // 180 degrees for RTL
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Show time picker
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical:  8),
          child: Text(
            'الدعم',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF181411),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius. circular(16),
            border:  Border.all(
              color: Colors.black.withOpacity(0.05),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildSettingsItem(
                icon: Icons.help_outline,
                iconColor:  Colors.teal,
                iconBg:  Colors.teal.withOpacity(0.1),
                title: 'المساعدة والتعليقات',
                onTap: () {},
              ),
              _buildDivider(),
              _buildSettingsItem(
                icon: Icons.policy_outlined,
                iconColor:  Colors.grey,
                iconBg: Colors.grey.withOpacity(0.1),
                title: 'سياسة الخصوصية',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    String? subtitle,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child:  Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius:  4,
                    offset:  const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child:  Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF181411),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize:  12,
                        color: Color(0xFF88827c),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            trailing ??
                Transform.rotate(
                  angle: 3.14159, // 180 degrees for RTL
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors. grey,
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children:  [
          Container(
            width: 40,
            height:  40,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius:  BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF181411),
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFFf48c25),
            activeTrackColor: const Color(0xFFf48c25).withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.only(right: 72),
      color: Colors.grey.withOpacity(0.1),
    );
  }

  Widget _buildSignOutButton() {
    return InkWell(
      onTap: () {
        _showSignOutDialog();
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red.withOpacity(0.1),
            width: 2,
          ),
          borderRadius: BorderRadius. circular(16),
        ),
        child: const Text(
          'تسجيل الخروج',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _buildVersionInfo() {
    return const Text(
      'الإصدار ٢.٤.٠',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 480),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius. circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                icon: Icons. home_outlined,
                label:  'الرئيسية',
                isActive: false,
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
              _buildNavItem(
                icon: Icons.school_outlined,
                label: 'تعلم',
                isActive: false,
                onTap: () {
                  Navigator. pushReplacementNamed(context, '/learning-path');
                },
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                label: 'حسابي',
                isActive: false,
                onTap: () {},
              ),
              _buildNavItem(
                icon: Icons. settings,
                label: 'الإعدادات',
                isActive: true,
                onTap: () {},
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
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets. symmetric(horizontal: 8, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size:  28,
              color: isActive
                  ? const Color(0xFFf48c25)
                  : Colors.grey.shade400,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight. bold : FontWeight.w500,
                color: isActive
                    ? const Color(0xFFf48c25)
                    : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection:  TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'تسجيل الخروج',
            style:  TextStyle(fontWeight: FontWeight.bold),
          ),
          content:  const Text('هل أنت متأكد من تسجيل الخروج؟'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'إلغاء',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/signup');
              },
              child:  const Text(
                'تسجيل الخروج',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}