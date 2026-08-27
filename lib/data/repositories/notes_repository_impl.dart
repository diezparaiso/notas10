import 'package:drift/drift.dart' show Value;

import '../../domain/entities/note.dart';
import '../../domain/repositories/notes_repository.dart';
import '../local/daos/notes_dao.dart';
import '../local/database.dart';

/// Implementación real de NotesRepository, usando NotesDao.
///
/// Se encarga de mapear entre las filas de Drift (NotesTableData /
/// NotesTableCompanion) y la entidad de dominio Note, para que el
/// resto de capas (casos de uso, controllers) nunca vean tipos de
/// Drift directamente.
class NotesRepositoryImpl implements NotesRepository {
  NotesRepositoryImpl(this._notesDao);

  final NotesDao _notesDao;

  @override
  Stream<List<Note>> watchAllNotes() {
    return _notesDao.watchAll().map(
          (rows) => rows.map(_toEntity).toList(),
        );
  }

  @override
  Stream<Note?> watchNoteById(int id) {
    return _notesDao.watchById(id).map(
          (row) => row == null ? null : _toEntity(row),
        );
  }

  @override
  Future<int> createNote(Note note) {
    return _notesDao.insertNote(_toInsertCompanion(note));
  }

  @override
  Future<bool> updateNote(Note note) {
    return _notesDao.updateNote(_toCompanion(note));
  }

  @override
  Future<void> deleteNote(int id) {
    return _notesDao.deleteNote(id);
  }

  Note _toEntity(NotesTableData row) {
    return Note(
      id: row.id,
      title: row.title,
      body: row.body,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      isPinned: row.isPinned,
      isArchived: row.isArchived,
      colorTag: row.colorTag,
    );
  }

  /// Companion para creación: se omite id (autoincrement).
  NotesTableCompanion _toInsertCompanion(Note note) {
    return NotesTableCompanion(
      title: Value(note.title),
      body: Value(note.body),
      createdAt: Value(note.createdAt),
      updatedAt: Value(note.updatedAt),
      isPinned: Value(note.isPinned),
      isArchived: Value(note.isArchived),
      colorTag: Value(note.colorTag),
    );
  }

  /// Companion completo (incluye id), usado para update/replace.
  NotesTableCompanion _toCompanion(Note note) {
    return NotesTableCompanion(
      id: Value(note.id),
      title: Value(note.title),
      body: Value(note.body),
      createdAt: Value(note.createdAt),
      updatedAt: Value(note.updatedAt),
      isPinned: Value(note.isPinned),
      isArchived: Value(note.isArchived),
      colorTag: Value(note.colorTag),
    );
  }
}