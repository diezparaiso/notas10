import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repositories/notes_repository.dart';
import '../local/daos/notes_dao_provider.dart';
import 'notes_repository_impl.dart';

part 'notes_repository_provider.g.dart';

@Riverpod(keepAlive: true)
NotesRepository notesRepository(Ref ref) {
  final dao = ref.watch(notesDaoProvider);
  return NotesRepositoryImpl(dao);
}