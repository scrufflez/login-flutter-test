import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

void main() {
  runApp(const LoginApp());
}

// === Asgard Design System ===

class AsgardColors {
  // Light mode
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color primaryLight = Color(0xFF1E40AF);
  static const Color primaryHoverLight = Color(0xFF1E3A8A);
  static const Color primaryAccentLight = Color(0xFF3B82F6);
  static const Color successLight = Color(0xFF10B981);
  static const Color dangerLight = Color(0xFFEF4444);
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF64748B);

  // Dark mode
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E2937);
  static const Color primaryDark = Color(0xFF3B82F6);
  static const Color primaryHoverDark = Color(0xFF2563EB);
  static const Color successDark = Color(0xFF10B981);
  static const Color dangerDark = Color(0xFFEF4444);
  static const Color borderDark = Color(0xFF334155);
  static const Color textPrimaryDark = Color(0xFFF1F5F9);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
}

class AsgardTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AsgardColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AsgardColors.primaryLight,
        surface: AsgardColors.surfaceLight,
        error: AsgardColors.dangerLight,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AsgardColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AsgardColors.primaryDark,
        surface: AsgardColors.surfaceDark,
        error: AsgardColors.dangerDark,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    );
  }
}

// === App ===

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asgard',
      debugShowCheckedModeBanner: false,
      theme: AsgardTheme.light(),
      darkTheme: AsgardTheme.dark(),
      themeMode: ThemeMode.system,
      home: const LoginScreen(),
    );
  }
}

// === Asgard Components ===

class _AsgardBranding extends StatelessWidget {
  const _AsgardBranding();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? AsgardColors.primaryDark : AsgardColors.primaryLight;
    final textPrimary = isDark ? AsgardColors.textPrimaryDark : AsgardColors.textPrimaryLight;

    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(LucideIcons.zap, size: 18, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Text(
          'Asgard',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: textPrimary,
          ),
        ),
      ],
    );
  }
}

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? AsgardColors.borderDark : AsgardColors.borderLight;
    final textColor = isDark ? AsgardColors.textPrimaryDark : AsgardColors.textPrimaryLight;
    final labelColor = isDark ? AsgardColors.textSecondaryDark : AsgardColors.textSecondaryLight;
    final fillColor = isDark ? AsgardColors.surfaceDark : AsgardColors.surfaceLight;
    final focusColor = isDark ? AsgardColors.primaryDark : AsgardColors.primaryLight;

    return TextField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted != null ? (_) => onSubmitted!() : null,
      style: GoogleFonts.inter(fontSize: 16, color: textColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.inter(fontSize: 14, color: labelColor),
        prefixIcon: Icon(prefixIcon, size: 18, color: labelColor),
        filled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: focusColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AsgardColors.primaryDark : AsgardColors.primaryLight;
    final hoverColor = isDark ? AsgardColors.primaryHoverDark : AsgardColors.primaryHoverLight;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: bgColor,
          onPrimary: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AsgardErrorBadge extends StatelessWidget {
  final String message;

  const AsgardErrorBadge({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AsgardColors.dangerLight.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AsgardColors.dangerLight.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(LucideIcons.alertCircle, size: 16, color: AsgardColors.dangerLight),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AsgardColors.dangerLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration _cardDecoration(bool isDark) {
  return BoxDecoration(
    color: isDark ? AsgardColors.surfaceDark : AsgardColors.surfaceLight,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: isDark ? AsgardColors.borderDark : AsgardColors.borderLight,
      width: 1,
    ),
    boxShadow: isDark
        ? []
        : [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 32,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
  );
}

// === Login Screen ===

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
          builder: (_) => WelcomeScreen(username: username.isEmpty ? 'User' : username),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Login failed. Invalid credentials.';
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AsgardColors.backgroundDark : AsgardColors.backgroundLight;
    final textPrimary = isDark ? AsgardColors.textPrimaryDark : AsgardColors.textPrimaryLight;
    final textSecondary = isDark ? AsgardColors.textSecondaryDark : AsgardColors.textSecondaryLight;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: const _AsgardBranding(),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: _cardDecoration(isDark),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Sign In',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: textPrimary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Access your Asgard workspace',
                            style: GoogleFonts.inter(fontSize: 14, color: textSecondary),
                          ),
                          const SizedBox(height: 32),
                          AsgardTextField(
                            controller: _usernameController,
                            label: 'Username',
                            prefixIcon: LucideIcons.user,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 16),
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
                          const SizedBox(height: 24),
                          AsgardPrimaryButton(label: 'Sign In', onPressed: _login),
                        ],
                      ),
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
}

// === Welcome Screen ===

class WelcomeScreen extends StatelessWidget {
  final String username;

  const WelcomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AsgardColors.backgroundDark : AsgardColors.backgroundLight;
    final textPrimary = isDark ? AsgardColors.textPrimaryDark : AsgardColors.textPrimaryLight;
    final textSecondary = isDark ? AsgardColors.textSecondaryDark : AsgardColors.textSecondaryLight;
    final borderColor = isDark ? AsgardColors.borderDark : AsgardColors.borderLight;
    final success = isDark ? AsgardColors.successDark : AsgardColors.successLight;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: const _AsgardBranding(),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: _cardDecoration(isDark),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: success.withOpacity(0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(LucideIcons.checkCircle, size: 32, color: success),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Welcome, $username!',
                            style: GoogleFonts.inter(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: textPrimary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "You're now signed in to your Asgard workspace.",
                            style: GoogleFonts.inter(fontSize: 14, color: textSecondary),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                                );
                              },
                              icon: Icon(LucideIcons.logOut, size: 16),
                              label: Text(
                                'Sign out',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                side: BorderSide(color: borderColor, width: 1.5),
                                primary: textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
