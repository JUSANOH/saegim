import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '회원가입',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
