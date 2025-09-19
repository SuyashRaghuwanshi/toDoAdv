import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/authProvider.dart';
import '../state/auth_state.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      log("1st: Login button pressed");
      final notifier = ref.read(authProvider.notifier);
      log("Notifier instance: $notifier");
      final isSuccess = await notifier.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      if (isSuccess) {
        Navigator.pushReplacementNamed(context, "/home");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    ref.listen<AuthState>(authProvider, (previous, next) {
      log("AuthState changed: $next");

      // Successful login -> navigate
      if (next.loginResponse?.user != null && next.error == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, "/home");
        });
      }

      // Show error if login failed
      if (next.error != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.error!)));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (val) => val!.isEmpty ? "Please enter email" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (val) =>
                    val!.isEmpty ? "Please enter password" : null,
              ),
              const SizedBox(height: 20),
              authState.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,

                      child: const Text("Login"),
                    ),
              const SizedBox(height: 12),
              if (authState.error != null)
                Text(
                  authState.error!,
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
