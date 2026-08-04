import 'package:flutter/material.dart';
import 'package:saegim/core/constants/app_colors.dart';
import 'package:saegim/core/constants/app_radius.dart';
import 'package:saegim/core/constants/app_spacing.dart';
import 'package:saegim/shared/widgets/app_button.dart';
import 'package:saegim/shared/widgets/app_card.dart';
import 'package:saegim/shared/widgets/app_scaffold.dart';

class CharacterSelectionScreen extends StatelessWidget {
  const CharacterSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '캐릭터 선택',
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.screenHorizontal),
        children: const [
          _CharacterOptionCard(
            name: '뽀송끼끼',
            description: '포근하고 따뜻하게 마음을 전해요',
          ),
          SizedBox(height: AppSpacing.titleSubtitleGap),
          _CharacterOptionCard(
            name: '용감토끼',
            description: '당당하고 용기 있게 진심을 표현해요',
          ),
        ],
      ),
    );
  }
}

class _CharacterOptionCard extends StatelessWidget {
  const _CharacterOptionCard({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: AppSpacing.characterImageHeight,
            decoration: BoxDecoration(
              color: AppColors.subtitle.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: const Center(
              child: Icon(
                Icons.image_outlined,
                size: 48,
                color: AppColors.subtitle,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.titleSubtitleGap),
          Text(name, style: theme.headlineSmall),
          const SizedBox(height: AppSpacing.labelFieldGap),
          Text(
            description,
            style: theme.bodyLarge?.copyWith(color: AppColors.subtitle),
          ),
          const SizedBox(height: AppSpacing.titleSubtitleGap),
          AppButton(
            label: '선택',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
