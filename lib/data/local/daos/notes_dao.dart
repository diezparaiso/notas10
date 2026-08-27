import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/notes_table.dart';

part 'notes_dao.g.dart';

@DriftAccessor(tables: [NotesTable])
class NotesDao extends DatabaseAccessor<AppDatabase> with _$NotesDaoMixin {
  NotesDao(super.db);

  Future<int> insertNote(NotesTableCompanion note) {
    return into(notesTable).insert(note);
  }

  Future<bool> updateNote(NotesTableCompanion note) {
    return update(notesTable).replace(note);
  }

  Future<int> deleteNote(int id) {
    return (delete(notesTable)..where((t) => t.id.equals(id))).go();
  }

  Stream<List<NotesTableData>> watchAll() {
    return (select(notesTable)
          ..orderBy([
            (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  Stream<NotesTableData?> watchById(int id) {
    return (select(notesTable)..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }
}