import 'package:flutter/material.dart';
import 'package:saegim/core/constants/app_colors.dart';
import 'package:saegim/core/constants/app_radius.dart';
import 'package:saegim/core/constants/app_spacing.dart';
import 'package:saegim/shared/widgets/app_card.dart';
import 'package:saegim/shared/widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _people = ['엄마', '친구', '나 자신'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return AppScaffold(
      title: '새김',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.screenHorizontal),
              children: [
                Text('안녕하세요.', style: theme.headlineMedium),
                const SizedBox(height: AppSpacing.titleSubtitleGap),
                Text(
                  '오늘은 누구에게 마음을 남길까요?',
                  style: theme.bodyLarge?.copyWith(color: AppColors.subtitle),
                ),
                const SizedBox(height: AppSpacing.sectionGap),
                for (final name in _people) ...[
                  _PersonCard(name: name),
                  const SizedBox(height: AppSpacing.titleSubtitleGap),
                ],
                const _NewConnectionCard(),
              ],
            ),
          ),
          const _CompanionArea(),
        ],
      ),
    );
  }
}

class _PersonCard extends StatelessWidget {
  const _PersonCard({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () {},
      child: Row(
        children: [
          Container(
            width: AppSpacing.companionHeight,
            height: AppSpacing.companionHeight,
            decoration: BoxDecoration(
              color: AppColors.subtitle.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: const Icon(
              Icons.person_outline,
              color: AppColors.subtitle,
            ),
          ),
          const SizedBox(width: AppSpacing.titleSubtitleGap),
          Text(name, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}

class _NewConnectionCard extends StatelessWidget {
  const _NewConnectionCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add, color: AppColors.subtitle),
          const SizedBox(width: AppSpacing.labelFieldGap),
          Text(
            '새 인연 만들기',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _CompanionArea extends StatelessWidget {
  const _CompanionArea();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.screenHorizontal),
      child: Align(
        alignment: Alignment.centerRight,
        child: AppCard(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.titleSubtitleGap,
            vertical: AppSpacing.labelFieldGap,
          ),
          child: SizedBox(
            height: AppSpacing.companionHeight,
            width: AppSpacing.companionHeight,
            child: const Icon(
              Icons.pets_outlined,
              color: AppColors.subtitle,
            ),
          ),
        ),
      ),
    );
  }
}
