import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log in to X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F9FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1D9BF0),
          brightness: Brightness.light,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD5DCE0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFD5DCE0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF1D9BF0), width: 2),
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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isLoading = true);
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() => _isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Demo login submitted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _BrandMark(),
                    const SizedBox(height: 42),
                    Text(
                      'Sign in to X',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color(0xFF0F1419),
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.7,
                      ),
                    ),
                    const SizedBox(height: 28),
                    _SocialButton(
                      icon: Icons.g_mobiledata_rounded,
                      label: 'Continue with Google',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    _SocialButton(
                      icon: Icons.apple,
                      label: 'Continue with Apple',
                      onPressed: () {},
                    ),
                    const _DividerLabel(),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Phone, email, or username',
                      ),
                      validator: (value) => value == null || value.trim().isEmpty
                          ? 'Enter your phone, email, or username'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submit(),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          tooltip: _obscurePassword ? 'Show password' : 'Hide password',
                          onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Enter your password'
                          : null,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: _isLoading ? null : _submit,
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF0F1419),
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Log in',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                    ),
                    const SizedBox(height: 18),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot password?'),
                    ),
                    const SizedBox(height: 42),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account? ',
                          style: TextStyle(color: Color(0xFF536471)),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'X',
        style: TextStyle(
          color: Color(0xFF0F1419),
          fontSize: 35,
          fontWeight: FontWeight.w900,
          height: 1,
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: const Color(0xFF0F1419), size: 22),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF0F1419),
        backgroundColor: Colors.white,
        minimumSize: const Size.fromHeight(48),
        side: const BorderSide(color: Color(0xFFD5DCE0)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _DividerLabel extends StatelessWidget {
  const _DividerLabel();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(child: Divider(color: Color(0xFFD5DCE0))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text('OR', style: TextStyle(color: Color(0xFF536471))),
          ),
          Expanded(child: Divider(color: Color(0xFFD5DCE0))),
        ],
      ),
    );
  }
}