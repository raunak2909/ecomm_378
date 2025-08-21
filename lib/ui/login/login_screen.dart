import 'package:flutter/material.dart';

import '../../domain/constants/app_routes.dart';
import '../app_widgets/authfield.dart';
import '../app_widgets/divder.dart';
import '../app_widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool remember = true;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text('Welcome Back 👋',
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text('Sign in to continue shopping',
                    style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 24),
                AuthField(
                    hint: 'Email',
                    keyboard: TextInputType.emailAddress,
                    controller: email),
                const SizedBox(height: 14),
                AuthField(hint: 'Password', controller: pass, isPassword: true),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: remember,
                      activeColor: cs.primary,
                      onChanged: (v) => setState(() => remember = v ?? true),
                    ),
                    const Text('Remember me'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                PrimaryButton(
                  label: 'Login',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
                  },
                ),
                const SizedBox(height: 18),
                const OrDivider(),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _social('Google', Icons.g_mobiledata),
                    const SizedBox(width: 12),
                    _social('Facebook', Icons.facebook),
                    const SizedBox(width: 12),
                    _social('Apple', Icons.apple),
                  ],
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.signup),
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: cs.primary, fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _social(String label, IconData icon) {
    return Expanded(
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon), const SizedBox(width: 6), Text(label)],
          ),
        ),
      ),
    );
  }
}
