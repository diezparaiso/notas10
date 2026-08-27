import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../database_provider.dart';
import 'notes_dao.dart';

part 'notes_dao_provider.g.dart';

@Riverpod(keepAlive: true)
NotesDao notesDao(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.notesDao;
}