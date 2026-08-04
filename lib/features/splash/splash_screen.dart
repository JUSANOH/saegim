import 'package:flutter/material.dart';
import 'package:saegim/core/constants/app_spacing.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '새김',
              style: theme.headlineLarge,
            ),
            SizedBox(height: AppSpacing.titleSubtitleGap),
            Text(
              '당신에게 하지 못한 말을 남기는 공간',
              style: theme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
