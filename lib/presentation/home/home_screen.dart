import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_durations.dart';
import '../../domain/entities/note.dart';
import '../shared/widgets/empty_state_view.dart';
import 'widgets/note_card.dart';
import 'widgets/note_fab.dart';

/// Pantalla principal. Layout estático con datos de prueba —
/// se conecta a NotesRepository en el Día 8L.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Datos de prueba temporales, se sustituyen en el Día 8L.
  static final List<Note> _sampleNotes = [
    Note(
      id: 1,
      title: 'Lista de la compra',
      body: 'Leche, huevos, pan, café, fruta de temporada.',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    Note(
      id: 2,
      title: 'Ideas para el proyecto',
      body:
          'Revisar la arquitectura de carpetas antes del Día 8L. '
          'Pensar en el flujo de guardado automático.',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Note(
      id: 3,
      title: null,
      body: 'Nota rápida sin título, solo para probar el layout.',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      updatedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final notes = _sampleNotes;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
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
                            // Navegación real al editor: Día 9L.
                          },
                        );
                      },
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: NoteFab(
        onCreateTextNote: () {
          // Navegación real al editor: Día 9L.
        },
      ),
    );
  }
}