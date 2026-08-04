import 'package:flutter/material.dart';
import 'package:saegim/core/constants/app_colors.dart';
import 'package:saegim/shared/widgets/app_app_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions,
    required this.body,
  });

  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: title != null
          ? AppAppBar(
              title: title!,
              showBackButton: showBackButton,
              onBackPressed: onBackPressed,
              actions: actions,
            )
          : null,
      body: body,
    );
  }
}
