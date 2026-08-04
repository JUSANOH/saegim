import 'package:flutter/material.dart';
import 'package:saegim/core/constants/app_colors.dart';
import 'package:saegim/core/constants/app_radius.dart';
import 'package:saegim/core/constants/app_spacing.dart';
import 'package:saegim/shared/widgets/app_button.dart';
import 'package:saegim/shared/widgets/app_card.dart';
import 'package:saegim/shared/widgets/app_scaffold.dart';
import 'package:saegim/shared/widgets/app_text_field.dart';

class PersonCreationScreen extends StatelessWidget {
  const PersonCreationScreen({super.key});

  static const _relationshipOptions = ['가족', '친구', '연인', '동료', '기타'];

  static const _appearanceOptions = [
    'Hair',
    'Eyes',
    'Skin',
    'Top',
    'Accessories',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return AppScaffold(
      title: '기억을 닮게 꾸며보기',
      showBackButton: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.screenHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '완벽하게 닮지 않아도 괜찮아요.',
              style: theme.bodyLarge?.copyWith(color: AppColors.subtitle),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            const AppTextField(
              label: '이름',
              hint: '이름을 입력해 주세요',
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            const _SectionTitle(label: '관계'),
            const SizedBox(height: AppSpacing.labelFieldGap),
            Wrap(
              spacing: AppSpacing.labelFieldGap,
              runSpacing: AppSpacing.labelFieldGap,
              children: [
                for (final option in _relationshipOptions)
                  _RelationshipOption(label: option),
              ],
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            const _SectionTitle(label: '외모'),
            const SizedBox(height: AppSpacing.labelFieldGap),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: AppSpacing.labelFieldGap,
              crossAxisSpacing: AppSpacing.labelFieldGap,
              childAspectRatio: 1.1,
              children: [
                for (final option in _appearanceOptions)
                  _AppearancePlaceholder(label: option),
              ],
            ),
            const SizedBox(height: AppSpacing.sectionGap),
            const _SectionTitle(label: '미리보기'),
            const SizedBox(height: AppSpacing.labelFieldGap),
            const _CharacterPreview(),
            const SizedBox(height: AppSpacing.sectionGap),
            AppButton(
              label: '다음',
              onPressed: () {},
            ),
            const SizedBox(height: AppSpacing.screenHorizontal),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

class _RelationshipOption extends StatelessWidget {
  const _RelationshipOption({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: label,
      variant: AppButtonVariant.secondary,
      onPressed: () {},
    );
  }
}

class _AppearancePlaceholder extends StatelessWidget {
  const _AppearancePlaceholder({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.labelFieldGap),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.palette_outlined,
            color: AppColors.subtitle,
          ),
          const SizedBox(height: AppSpacing.labelFieldGap),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _CharacterPreview extends StatelessWidget {
  const _CharacterPreview();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Container(
        height: AppSpacing.previewHeight,
        decoration: BoxDecoration(
          color: AppColors.subtitle.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: const Center(
          child: Icon(
            Icons.person_outline,
            size: 64,
            color: AppColors.subtitle,
          ),
        ),
      ),
    );
  }
}
