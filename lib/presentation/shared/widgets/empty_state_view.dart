import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';

/// Estado vacío reutilizable (Home, y más adelante Search/Trash).
class EmptyStateView extends StatelessWidget {
  const EmptyStateView({
    super.key,
    this.title = AppStrings.homeEmptyStateTitle,
    this.subtitle = AppStrings.homeEmptyStateSubtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.note_alt_outlined,
              size: 72,
              color: theme.colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.outline,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}