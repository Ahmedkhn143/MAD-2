import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign in to eBay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff3665f3),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xfff7f8fa),
        fontFamily: 'Arial',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Color(0xff8c8c8c)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Color(0xff8c8c8c)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: const BorderSide(color: Color(0xff3665f3), width: 2),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  bool _showPassword = false;
  bool _isPasswordStep = false;
  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _continue() {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      setState(() => _emailError = 'Enter a valid email address or username.');
      _emailFocusNode.requestFocus();
      return;
    }
    setState(() {
      _emailError = null;
      _isPasswordStep = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 56),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 430),
                    child: _buildLoginContent(context),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoginContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        const _EbayLogo(),
        const SizedBox(height: 34),
        Text(
          _isPasswordStep ? 'Enter your password' : 'Sign in',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Color(0xff191919)),
        ),
        const SizedBox(height: 10),
        Text(
          _isPasswordStep
              ? 'Welcome back. Enter your password to continue.'
              : 'Sign in to buy, sell, and discover more.',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, color: Color(0xff5c5c5c)),
        ),
        const SizedBox(height: 28),
        if (_isPasswordStep) ...[
          _AccountChip(
            email: _emailController.text.trim(),
            onChange: () => setState(() => _isPasswordStep = false),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _passwordController,
            obscureText: !_showPassword,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                tooltip: _showPassword ? 'Hide password' : 'Show password',
                onPressed: () => setState(() => _showPassword = !_showPassword),
                icon: Icon(_showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: () {}, child: const Text('Forgot password?')),
          ),
          const SizedBox(height: 4),
          _primaryButton('Sign in', () {}),
        ] else ...[
          TextField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => _continue(),
            decoration: InputDecoration(labelText: 'Email or username', errorText: _emailError),
          ),
          const SizedBox(height: 16),
          _primaryButton('Continue', _continue),
        ],
        const SizedBox(height: 18),
        Row(
          children: [
            const Expanded(child: Divider(color: Color(0xffd6d9dc))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text('or', style: TextStyle(color: Colors.grey.shade600)),
            ),
            const Expanded(child: Divider(color: Color(0xffd6d9dc))),
          ],
        ),
        const SizedBox(height: 18),
        _socialButton(icon: const _GoogleIcon(), label: 'Continue with Google', onPressed: () {}),
        const SizedBox(height: 12),
        _socialButton(
          icon: const Icon(Icons.facebook, color: Color(0xff1877f2), size: 22),
          label: 'Continue with Facebook',
          onPressed: () {},
        ),
        const SizedBox(height: 25),
        Text.rich(
          TextSpan(
            text: 'By continuing, you agree to eBay\'s ',
            style: const TextStyle(fontSize: 12, color: Color(0xff5c5c5c)),
            children: [
              _linkSpan('User Agreement'),
              const TextSpan(text: ' and '),
              _linkSpan('Privacy Policy'),
              const TextSpan(text: '.'),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 28),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text('New to eBay? ', style: TextStyle(color: Color(0xff5c5c5c))),
            TextButton(onPressed: () {}, child: const Text('Create an account')),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Copyright 1995-2026 eBay Inc. All Rights Reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: Color(0xff767676)),
        ),
      ],
    );
  }

  Widget _primaryButton(String label, VoidCallback onPressed) {
    return SizedBox(
      height: 50,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xff3665f3),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _socialButton({required Widget icon, required String label, required VoidCallback onPressed}) {
    return SizedBox(
      height: 48,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xff191919),
          side: const BorderSide(color: Color(0xff8c8c8c)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  TextSpan _linkSpan(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(color: Color(0xff3665f3), decoration: TextDecoration.underline),
    );
  }
}

class _AccountChip extends StatelessWidget {
  const _AccountChip({required this.email, required this.onChange});

  final String email;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: const Color(0xfff3f5f7), borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          const Icon(Icons.account_circle_outlined, color: Color(0xff5c5c5c)),
          const SizedBox(width: 10),
          Expanded(child: Text(email, overflow: TextOverflow.ellipsis)),
          TextButton(onPressed: onChange, child: const Text('Change')),
        ],
      ),
    );
  }
}

class _EbayLogo extends StatelessWidget {
  const _EbayLogo();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          _logoLetter('e', const Color(0xffe53238)),
          _logoLetter('b', const Color(0xff0064d2)),
          _logoLetter('a', const Color(0xfff5af02)),
          _logoLetter('y', const Color(0xff86b817)),
        ],
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w800, height: 1),
    );
  }

  TextSpan _logoLetter(String letter, Color color) {
    return TextSpan(text: letter, style: TextStyle(color: color));
  }
}

class _GoogleIcon extends StatelessWidget {
  const _GoogleIcon();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'G',
      style: TextStyle(color: Color(0xff4285f4), fontSize: 20, fontWeight: FontWeight.w800),
    );
  }
}
