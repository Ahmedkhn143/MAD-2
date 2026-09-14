import 'package:flutter/material.dart';

void main() => runApp(const AmazonApp());

class AmazonApp extends StatelessWidget {
  const AmazonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Sign In',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffffa41c),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xfff7f8fa),
        fontFamily: 'Arial',
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
  bool _showPassword = false;
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _continue() {
    if (_formKey.currentState!.validate()) {
      setState(() => _showPassword = true);
    }
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signing in...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 34, 24, 28),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 62,
                maxWidth: 440,
              ),
              child: Column(
                children: [
                  const _AmazonMark(),
                  const SizedBox(height: 26),
                  _loginCard(),
                  const SizedBox(height: 28),
                  _newToAmazon(),
                  const SizedBox(height: 26),
                  const Divider(color: Color(0xffd5d9d9)),
                  const SizedBox(height: 18),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 24,
                    runSpacing: 10,
                    children: [
                      _footerLink('Conditions of Use'),
                      _footerLink('Privacy Notice'),
                      _footerLink('Help'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '© 1996–2026, Amazon.com, Inc. or its affiliates',
                    style: TextStyle(color: Color(0xff5f6b75), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(26, 24, 26, 28),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffd5d9d9)),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0d000000),
            blurRadius: 14,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign in',
              style: TextStyle(
                color: Color(0xff18212a),
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Email or mobile phone number',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
            const SizedBox(height: 7),
            TextFormField(
              controller: _emailController,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: _inputDecoration('Enter your email'),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Enter your email or mobile phone number'
                  : null,
            ),
            if (_showPassword) ...[
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                  ),
                  _textLink('Forgot password?'),
                ],
              ),
              const SizedBox(height: 7),
              TextFormField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                textInputAction: TextInputAction.done,
                decoration: _inputDecoration('Enter your password').copyWith(
                  suffixIcon: IconButton(
                    tooltip: _passwordVisible ? 'Hide password' : 'Show password',
                    onPressed: () => setState(
                      () => _passwordVisible = !_passwordVisible,
                    ),
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20,
                    ),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter your password'
                    : null,
                onFieldSubmitted: (_) => _signIn(),
              ),
            ],
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: _showPassword ? _signIn : _continue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffc534),
                  foregroundColor: const Color(0xff111820),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: Text(_showPassword ? 'Sign in' : 'Continue'),
              ),
            ),
            const SizedBox(height: 19),
            const Text.rich(
              TextSpan(
                text: "By continuing, you agree to Amazon's ",
                children: [
                  TextSpan(
                    text: 'Conditions of Use',
                    style: TextStyle(color: Color(0xff1769aa)),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Notice',
                    style: TextStyle(color: Color(0xff1769aa)),
                  ),
                  TextSpan(text: '.'),
                ],
                style: TextStyle(
                  color: Color(0xff39434d),
                  fontSize: 12,
                  height: 1.45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _newToAmazon() {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider(color: Color(0xffd5d9d9))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'New to Amazon?',
                style: TextStyle(color: Color(0xff66717a), fontSize: 12),
              ),
            ),
            Expanded(child: Divider(color: Color(0xffd5d9d9))),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: OutlinedButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account creation coming soon')),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xff1b2733),
              side: const BorderSide(color: Color(0xffaeb7bd)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            child: const Text('Create your Amazon account'),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xff8a949c), fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff9aa6ad)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffe77600), width: 2),
        ),
      );

  Widget _textLink(String text) => GestureDetector(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password recovery coming soon')),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Color(0xff1769aa), fontSize: 12),
        ),
      );

  Widget _footerLink(String text) => GestureDetector(
        onTap: () {},
        child: Text(
          text,
          style: const TextStyle(color: Color(0xff1769aa), fontSize: 12),
        ),
      );
}

class _AmazonMark extends StatelessWidget {
  const _AmazonMark();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'amazon',
            style: TextStyle(
              color: Color(0xff18212a),
              fontSize: 31,
              fontWeight: FontWeight.w700,
              letterSpacing: -1.5,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 52,
            right: 1,
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xffffa41c),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}