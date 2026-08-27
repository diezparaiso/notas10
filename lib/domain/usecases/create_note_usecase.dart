import '../entities/note.dart';
import '../repositories/notes_repository.dart';

/// Caso de uso: crear una nota nueva.
class CreateNoteUseCase {
  CreateNoteUseCase(this._repository);

  final NotesRepository _repository;

  Future<int> call(Note note) {
    return _repository.createNote(note);
  }
}