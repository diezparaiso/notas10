import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/notes_repository_provider.dart';
import '../../domain/entities/note.dart';

part 'home_controller.g.dart';

/// Controller de HomeScreen: expone el stream de notas reales
/// desde NotesRepository, ordenadas por updatedAt descendente
/// (el propio NotesDao.watchAll ya aplica ese orden).
@riverpod
Stream<List<Note>> homeNotes(Ref ref) {
  final repository = ref.watch(notesRepositoryProvider);
  return repository.watchAllNotes();
}