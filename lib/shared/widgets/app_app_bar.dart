import 'package:flutter/material.dart';
import 'package:saegim/core/constants/app_colors.dart';
import 'package:saegim/core/constants/app_spacing.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: AppColors.background,
      foregroundColor: theme.colorScheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: AppSpacing.appBarHorizontal,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed ?? () => Navigator.of(context).maybePop(),
            )
          : null,
      automaticallyImplyLeading: false,
      title: Text(title, style: theme.textTheme.titleLarge),
      actions: actions,
    );
  }
}
