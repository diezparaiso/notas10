// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controller de HomeScreen: expone el stream de notas reales
/// desde NotesRepository, ordenadas por updatedAt descendente
/// (el propio NotesDao.watchAll ya aplica ese orden).

@ProviderFor(homeNotes)
final homeNotesProvider = HomeNotesProvider._();

/// Controller de HomeScreen: expone el stream de notas reales
/// desde NotesRepository, ordenadas por updatedAt descendente
/// (el propio NotesDao.watchAll ya aplica ese orden).

final class HomeNotesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Note>>,
          List<Note>,
          Stream<List<Note>>
        >
    with $FutureModifier<List<Note>>, $StreamProvider<List<Note>> {
  /// Controller de HomeScreen: expone el stream de notas reales
  /// desde NotesRepository, ordenadas por updatedAt descendente
  /// (el propio NotesDao.watchAll ya aplica ese orden).
  HomeNotesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeNotesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeNotesHash();

  @$internal
  @override
  $StreamProviderElement<List<Note>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Note>> create(Ref ref) {
    return homeNotes(ref);
  }
}

String _$homeNotesHash() => r'425f97fb67099c65480ca0361a73401c32f5a297';
