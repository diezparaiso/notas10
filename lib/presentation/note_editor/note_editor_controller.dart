import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/notes_repository_provider.dart';
import '../../domain/entities/note.dart';
import '../../domain/usecases/notes_usecases_provider.dart';

part 'note_editor_controller.g.dart';

/// Controller del editor de notas. Gestiona la carga de una nota
/// existente (o el estado de nota nueva) y el guardado automático
/// con debounce de 500ms.
@riverpod
class NoteEditorController extends _$NoteEditorController {
  Timer? _debounce;
  int? _noteId;

  @override
  Future<Note?> build(int? noteId) async {
    _noteId = noteId;
    ref.onDispose(() => _debounce?.cancel());

    if (noteId == null) return null;

    final repository = ref.watch(notesRepositoryProvider);
    return repository.watchNoteById(noteId).first;
  }

  /// Se llama en cada cambio de texto del título o el cuerpo.
  /// Espera 500ms sin más cambios antes de guardar de verdad.
  void onFieldsChanged({required String? title, required String body}) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _save(title: title, body: body);
    });
  }

  Future<void> _save({required String? title, required String body}) async {
    final now = DateTime.now();
    final trimmedTitle = title?.trim();
    final normalizedTitle =
        (trimmedTitle == null || trimmedTitle.isEmpty) ? null : trimmedTitle;

    if (_noteId == null) {
      // Nota nueva: solo se crea si hay contenido real que guardar.
      if (normalizedTitle == null && body.trim().isEmpty) return;

      final createNote = ref.read(createNoteUseCaseProvider);
      final newId = await createNote(
        Note(
          id: 0, // autoincrement, se ignora en el insert
          title: normalizedTitle,
          body: body,
          createdAt: now,
          updatedAt: now,
        ),
      );
      _noteId = newId;
      state = AsyncData(
        Note(
          id: newId,
          title: normalizedTitle,
          body: body,
          createdAt: now,
          updatedAt: now,
        ),
      );
    } else {
      final current = state.value;
      final updateNote = ref.read(updateNoteUseCaseProvider);
      final updated = Note(
        id: _noteId!,
        title: normalizedTitle,
        body: body,
        createdAt: current?.createdAt ?? now,
        updatedAt: now,
      );
      await updateNote(updated);
      state = AsyncData(updated);
    }
  }

  /// Elimina la nota actual, si existe.
  Future<void> deleteNote() async {
    if (_noteId == null) return;
    final deleteNote = ref.read(deleteNoteUseCaseProvider);
    await deleteNote(_noteId!);
  }
}