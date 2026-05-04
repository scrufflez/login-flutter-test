import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

void main() {
  runApp(const LoginApp());
}

// ─── Asgard 1.4 Color Palette ───────────────────────────────────────────────

class AsgardColors {
  static const Color backgroundDeep = Color(0xFF0F1113);
  static const Color background = Color(0xFF151819);
  static const Color topBar = Color(0xFF0B0D0E);
  static const Color surface = Color(0xFF1A1F23);
  static const Color surfaceRaised = Color(0xFF20262B);
  static const Color border = Color(0xFF2A3036);
  static const Color borderStrong = Color(0xFF374151);

  static const Color primaryBlue = Color(0xFF5DB7F6);
  static const Color primaryBlueHover = Color(0xFF3B9FE8);
  static const Color primaryBlueMuted = Color(0xFF2F80C7);
  static const Color focusBlue = Color(0xFF60A5FA);

  static const Color textPrimary = Color(0xFFE5E7EB);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color textMuted = Color(0xFF3F444A);
  static const Color textBrand = Color(0xFF5DB7F6);
  static const Color textDisabled = Color(0xFF5F6670);

  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static const Color info = Color(0xFF0EA5E9);
}

// ─── App ─────────────────────────────────────────────────────────────────────

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panago',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AsgardColors.background,
        primaryColor: AsgardColors.primaryBlue,
        colorScheme: const ColorScheme.dark(
          primary: AsgardColors.primaryBlue,
          surface: AsgardColors.surface,
          background: AsgardColors.background,
          error: AsgardColors.danger,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AsgardColors.topBar,
          elevation: 0,
          centerTitle: false,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: const LoginScreen(),
    );
  }
}

// ─── AsgardTopNav ─────────────────────────────────────────────────────────────

class AsgardTopNav extends StatelessWidget {
  const AsgardTopNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      color: AsgardColors.topBar,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF202426), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // PANAGO brand
          Text(
            'PANAGO',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AsgardColors.textBrand,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          // Search icon
          const Icon(LucideIcons.search, color: Color(0xFF6B7280), size: 18),
          const SizedBox(width: 14),
          // Menu circle
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF222427),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(LucideIcons.menu, color: Color(0xFF9CA3AF), size: 16),
          ),
          const SizedBox(width: 12),
          // LOG IN outlined button
          SizedBox(
            height: 34,
            child: OutlinedButton(
              onPressed: null,
              style: OutlinedButton.styleFrom(
                primary: AsgardColors.primaryBlue,
                side: const BorderSide(color: AsgardColors.border, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
              ),
              child: Text(
                'LOG IN',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AsgardColors.primaryBlue,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // SIGN UP solid button
          SizedBox(
            height: 34,
            child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                primary: AsgardColors.primaryBlue,
                onPrimary: const Color(0xFF071014),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
              ),
              child: Text(
                'SIGN UP',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF071014),
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Cart icon
          const Icon(LucideIcons.shoppingCart, color: Color(0xFF6B7280), size: 18),
        ],
      ),
    );
  }
}

// ─── AsgardTextField ─────────────────────────────────────────────────────────

class AsgardTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final VoidCallback? onSubmitted;

  const AsgardTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.obscureText = false,
    this.textInputAction,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted != null ? (_) => onSubmitted!() : null,
      style: GoogleFonts.inter(
        fontSize: 15,
        color: AsgardColors.textPrimary,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.inter(
          fontSize: 14,
          color: const Color(0xFF6B7280),
        ),
        prefixIcon: Icon(prefixIcon, size: 18, color: const Color(0xFF6B7280)),
        filled: true,
        fillColor: AsgardColors.surface,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AsgardColors.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AsgardColors.focusBlue, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}

// ─── AsgardPrimaryButton ─────────────────────────────────────────────────────

class AsgardPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AsgardPrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 34,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: AsgardColors.primaryBlue,
          onPrimary: const Color(0xFF071014),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF071014),
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }
}

// ─── AsgardLoginButton (outlined) ────────────────────────────────────────────

class AsgardLoginButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;

  const AsgardLoginButton({
    Key? key,
    required this.label,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: AsgardColors.primaryBlue),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AsgardColors.primaryBlue,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          )
        : Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AsgardColors.primaryBlue,
              letterSpacing: 1.1,
            ),
          );

    return SizedBox(
      height: 34,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          primary: AsgardColors.primaryBlue,
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: AsgardColors.border, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: content,
      ),
    );
  }
}

// ─── AsgardErrorBadge ────────────────────────────────────────────────────────

class AsgardErrorBadge extends StatelessWidget {
  final String message;

  const AsgardErrorBadge({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AsgardColors.danger.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AsgardColors.danger.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(LucideIcons.alertCircle, size: 16, color: AsgardColors.danger),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AsgardColors.danger,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Login Screen ─────────────────────────────────────────────────────────────

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (password == 'pa55w0rd') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen(username: username.isEmpty ? 'User' : username),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Invalid credentials.';
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AsgardColors.background,
      body: Column(
        children: [
          const AsgardTopNav(),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Container(
                    padding: const EdgeInsets.all(36),
                    decoration: BoxDecoration(
                      color: AsgardColors.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AsgardColors.border, width: 1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Sign In',
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AsgardColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Access your workspace',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: AsgardColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 28),
                        AsgardTextField(
                          controller: _usernameController,
                          label: 'Username',
                          prefixIcon: LucideIcons.user,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 14),
                        AsgardTextField(
                          controller: _passwordController,
                          label: 'Password',
                          prefixIcon: LucideIcons.lock,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          onSubmitted: _login,
                        ),
                        if (_errorMessage != null) ...[
                          const SizedBox(height: 16),
                          AsgardErrorBadge(message: _errorMessage!),
                        ],
                        const SizedBox(height: 20),
                        AsgardPrimaryButton(label: 'SIGN IN', onPressed: _login),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Home Screen ──────────────────────────────────────────────────────────────

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AsgardColors.background,
      body: Column(
        children: [
          const AsgardTopNav(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Home Page',
                    style: GoogleFonts.inter(
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                      color: AsgardColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 32),
                  AsgardLoginButton(
                    label: 'Sign out',
                    icon: LucideIcons.logOut,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
