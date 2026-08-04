import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saegim/core/constants/app_theme.dart';
import 'package:saegim/features/character/presentation/character_selection_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '새김',
      theme: AppTheme.lightTheme,
      home: const CharacterSelectionScreen(),
    );
  }
}
