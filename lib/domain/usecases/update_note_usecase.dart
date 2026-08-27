import '../entities/note.dart';
import '../repositories/notes_repository.dart';

/// Caso de uso: actualizar una nota existente.
class UpdateNoteUseCase {
  UpdateNoteUseCase(this._repository);

  final NotesRepository _repository;

  Future<bool> call(Note note) {
    return _repository.updateNote(note);
  }
}