import 'package:flutter/material.dart';

class CharacterSelectionScreen extends StatelessWidget {
  const CharacterSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '캐릭터 선택',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
