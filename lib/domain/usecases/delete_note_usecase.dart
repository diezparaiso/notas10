import '../repositories/notes_repository.dart';

/// Caso de uso: eliminar una nota por su id.
class DeleteNoteUseCase {
  DeleteNoteUseCase(this._repository);

  final NotesRepository _repository;

  Future<void> call(int id) {
    return _repository.deleteNote(id);
  }
}