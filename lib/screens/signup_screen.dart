import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController. dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:  TextDirection.rtl, // RTL for Arabic
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child:  Column(
              children: [
                _buildHeaderImage(),
                _buildHeadline(),
                _buildSignUpForm(),
                _buildFooter(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 480),
      child:  Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Stack(
          children: [
            Container(
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image:  NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAkYt3iISGOYwPq0HE7cF_xzd_xG2YtXd36qsYaQ9Nx_Hd5iqgLV5nkL_Z_-xDLqKdr2nvYazqqhcPcGQ6-k-9dj1G0OO2F1sRi9VeTVP-w5Ub7PvnX9yiKJazxvTyBo2-FGF42deRDdLhibgd0nlHez8p_4YMzc9m4qhoPSx2dznWD1zUo0ued3a3B1SJKEV0SukgH4jUgksW5uOD4JVlk3wrM_HsgO2kaaYIoiSfz3rzkZcwerJxpJcOor6R94i-Npq8MiseOsnk',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin:  Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black. withOpacity(0.6),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Back button
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors. white,
                          size: 32,
                        ),
                      ),
                    ),
                    // Welcome text
                    Positioned(
                      bottom: 24,
                      right: 24,
                      left: 24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'مرحباً بك!',
                            style:  TextStyle(
                              color:  Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'في عالم ألف باء',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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

  Widget _buildHeadline() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Column(
        children: [
          const Text(
            'ابدأ رحلة التعلم',
            style: TextStyle(
              fontSize:  28,
              fontWeight:  FontWeight.bold,
              color: Color(0xFF181411),
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'أنشئ حساباً للوالدين لمتابعة تقدم طفلك في تعلم الحروف العربية',
            style: TextStyle(
              fontSize: 16,
              color: const Color(0xFF8a7560),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Email field
            _buildInputField(
              label: 'البريد الإلكتروني',
              placeholder: 'name@example.com',
              controller: _emailController,
              icon: Icons.mail,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 20),

            // Password field
            _buildInputField(
              label: 'كلمة المرور',
              placeholder: '******',
              controller: _passwordController,
              icon: Icons.lock,
              isPassword: true,
              obscureText: _obscurePassword,
              onToggleVisibility: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),

            const SizedBox(height: 20),

            // Confirm password field
            _buildInputField(
              label: 'تأكيد كلمة المرور',
              placeholder: '******',
              controller: _confirmPasswordController,
              icon: Icons.check_circle,
              isPassword:  true,
              obscureText:  _obscureConfirmPassword,
              onToggleVisibility: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),

            const SizedBox(height: 32),

            // Submit button
            _buildSubmitButton(),

            const SizedBox(height:  24),

            // Divider
            _buildDivider(),

            const SizedBox(height:  24),

            // Social login
            _buildSocialLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String placeholder,
    required TextEditingController controller,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    TextInputType?  keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF181411),
            ),
          ),
        ),
        Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color:  Colors.black.withOpacity(0.04),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon container (left side in RTL)
              Container(
                width: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFf8f7f5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft:  Radius.circular(16),
                  ),
                  border:  Border.all(
                    color: const Color(0xFFe6e0db),
                  ),
                ),
                child:  Icon(
                  icon,
                  color: const Color(0xFF8a7560),
                  size: 24,
                ),
              ),
              // Input field (right side in RTL)
              Expanded(
                child: TextFormField(
                  controller:  controller,
                  obscureText: isPassword && obscureText,
                  keyboardType: keyboardType,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF181411),
                  ),
                  decoration: InputDecoration(
                    hintText:  placeholder,
                    hintStyle: TextStyle(
                      color: const Color(0xFF8a7560).withOpacity(0.7),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFf8f7f5),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.only(
                        topRight:  Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      borderSide: const BorderSide(
                        color:  Color(0xFFe6e0db),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:  const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      borderSide: const BorderSide(
                        color: Color(0xFFe6e0db),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius. circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      borderSide: const BorderSide(
                        color: Color(0xFFf48c25),
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical:  16,
                    ),
                    suffixIcon: isPassword
                        ? IconButton(
                            icon: Icon(
                              obscureText
                                  ? Icons.visibility_off
                                  : Icons. visibility,
                              color: const Color(0xFF8a7560),
                            ),
                            onPressed: onToggleVisibility,
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color:  const Color(0xFFf48c25).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed:  () {
          if (_formKey.currentState!.validate()) {
            // Handle sign up
            print('Sign up pressed');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFf48c25),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: const Text(
          'إنشاء حساب',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight. bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child:  Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'أو التسجيل عبر',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade400,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          onTap: () {
            print('Google login');
          },
          child: Image.network(
            'https://www.google.com/favicon.ico',
            width: 24,
            height:  24,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons. g_mobiledata, size: 32);
            },
          ),
        ),
        const SizedBox(width: 16),
        _buildSocialButton(
          onTap: () {
            print('Apple login');
          },
          child: const Icon(
            Icons.apple,
            size: 28,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required VoidCallback onTap,
    required Widget child,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        width: 56,
        height:  56,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to login
              print('Navigate to login');
            },
            child: const Text(
              'تسجيل الدخول',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFf48c25),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 4),
          const Text(
            'لديك حساب بالفعل؟',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF8a7560),
            ),
          ),
        ],
      ),
    );
  }
}