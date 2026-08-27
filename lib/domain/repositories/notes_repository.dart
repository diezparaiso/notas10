import '../entities/note.dart';

/// Interfaz abstracta del repositorio de notas.
///
/// El dominio no conoce Drift ni Flutter, solo esta interfaz.
/// La implementación real (NotesRepositoryImpl) se genera en el
/// Día 4L, conectando esto con NotesDao.
abstract class NotesRepository {
  /// Emite la lista completa de notas cada vez que cambian,
  /// ordenadas por updatedAt descendente.
  Stream<List<Note>> watchAllNotes();

  /// Emite una nota concreta cada vez que cambia, o null si no existe.
  Stream<Note?> watchNoteById(int id);

  /// Crea una nota nueva y devuelve el id asignado.
  Future<int> createNote(Note note);

  /// Actualiza una nota existente. Devuelve true si se actualizó.
  Future<bool> updateNote(Note note);

  /// Elimina una nota por su id.
  Future<void> deleteNote(int id);
}