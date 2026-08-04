import 'package:flutter/material.dart';
import 'package:saegim/core/constants/app_colors.dart';
import 'package:saegim/core/constants/app_radius.dart';
import 'package:saegim/core/constants/app_spacing.dart';
import 'package:saegim/shared/widgets/app_card.dart';
import 'package:saegim/shared/widgets/app_scaffold.dart';

class CharacterSelectionScreen extends StatefulWidget {
  const CharacterSelectionScreen({super.key});

  @override
  State<CharacterSelectionScreen> createState() =>
      _CharacterSelectionScreenState();
}

class _CharacterSelectionScreenState extends State<CharacterSelectionScreen> {
  int? _selectedIndex;

  static const _characters = [
    (name: '뽀송끼끼', description: '나는 끝까지 네 편이야.'),
    (name: '용감토끼', description: '아앙? 하고 싶은 말 있으면 하라고.'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return AppScaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontal,
            vertical: AppSpacing.sectionGap,
          ),
          children: [
            Text(
              '함께할 친구를 골라주세요.',
              style: theme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.titleSubtitleGap),
            Text(
              '가입 후 일주일 안에는 무료로 바꿀 수 있어요.',
              style: theme.bodyLarge?.copyWith(color: AppColors.subtitle),
            ),
            const SizedBox(height: AppSpacing.headerSectionGap),
            for (var i = 0; i < _characters.length; i++) ...[
              _CharacterOptionCard(
                name: _characters[i].name,
                description: _characters[i].description,
                isSelected: _selectedIndex == i,
                onTap: () => setState(() => _selectedIndex = i),
              ),
              if (i < _characters.length - 1)
                const SizedBox(height: AppSpacing.characterCardGap),
            ],
            const SizedBox(height: AppSpacing.sectionGap),
          ],
        ),
      ),
    );
  }
}

class _CharacterOptionCard extends StatelessWidget {
  const _CharacterOptionCard({
    required this.name,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final radius = BorderRadius.circular(AppRadius.characterCard);
    final borderColor = isSelected
        ? theme.colorScheme.primary.withValues(alpha: 0.45)
        : AppColors.subtitle.withValues(alpha: 0.12);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: borderColor,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.12),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Stack(
        children: [
          AppCard(
            onTap: onTap,
            borderRadius: radius,
            padding: const EdgeInsets.all(AppSpacing.characterCardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: AppSpacing.characterArtworkHeight,
                  decoration: BoxDecoration(
                    color: AppColors.subtitle.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(AppRadius.card),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: AppColors.subtitle,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sectionGap),
                Text(
                  name,
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.labelFieldGap),
                Text(
                  description,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.subtitle,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              top: AppSpacing.labelFieldGap,
              right: AppSpacing.labelFieldGap,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
