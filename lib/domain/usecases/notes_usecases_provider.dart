import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/notes_repository_provider.dart';
import 'create_note_usecase.dart';
import 'delete_note_usecase.dart';
import 'update_note_usecase.dart';

part 'notes_usecases_provider.g.dart';

@riverpod
CreateNoteUseCase createNoteUseCase(Ref ref) {
  return CreateNoteUseCase(ref.watch(notesRepositoryProvider));
}

@riverpod
UpdateNoteUseCase updateNoteUseCase(Ref ref) {
  return UpdateNoteUseCase(ref.watch(notesRepositoryProvider));
}

@riverpod
DeleteNoteUseCase deleteNoteUseCase(Ref ref) {
  return DeleteNoteUseCase(ref.watch(notesRepositoryProvider));
}