import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_strings.dart';
import '../../core/router/app_router.dart';
import '../../core/theme/app_durations.dart';
import '../shared/widgets/empty_state_view.dart';
import 'home_controller.dart';
import 'widgets/note_card.dart';
import 'widgets/note_fab.dart';

/// Pantalla principal, conectada a NotesRepository a través de
/// HomeController (Día 8L) y con navegación real al editor (Día 9L).
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(homeNotesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
      ),
      body: SafeArea(
        child: notesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text('Error al cargar las notas: $error'),
          ),
          data: (notes) {
            return AnimatedSwitcher(
              duration: AppDurations.medium,
              switchInCurve: AppDurations.defaultCurve,
              switchOutCurve: AppDurations.defaultCurve,
              child: notes.isEmpty
                  ? const EmptyStateView(key: ValueKey('empty'))
                  : LayoutBuilder(
                      key: const ValueKey('grid'),
                      builder: (context, constraints) {
                        final isTablet = constraints.maxWidth >= 600;
                        return GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: isTablet ? 280 : 400,
                            mainAxisExtent: 160,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            final note = notes[index];
                            return NoteCard(
                              note: note,
                              onTap: () {
                                context.pushNamed(
                                  AppRoutes.noteEditor,
                                  extra: note.id,
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
            );
          },
        ),
      ),
      floatingActionButton: NoteFab(
        onCreateTextNote: () {
          context.pushNamed(AppRoutes.noteEditor);
        },
      ),
    );
  }
}