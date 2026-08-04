import 'package:flutter/material.dart';
import 'package:saegim/core/constants/app_colors.dart';
import 'package:saegim/core/constants/app_radius.dart';
import 'package:saegim/core/constants/app_spacing.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(AppRadius.card);
    final content = Padding(
      padding: padding ?? const EdgeInsets.all(AppSpacing.cardPadding),
      child: child,
    );

    Widget card = Material(
      color: backgroundColor ?? AppColors.background,
      borderRadius: radius,
      child: onTap != null
          ? InkWell(
              onTap: onTap,
              borderRadius: radius,
              child: content,
            )
          : content,
    );

    if (margin != null) {
      card = Padding(padding: margin!, child: card);
    }

    return card;
  }
}
