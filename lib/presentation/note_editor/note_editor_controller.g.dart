// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_editor_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Controller del editor de notas. Gestiona la carga de una nota
/// existente (o el estado de nota nueva) y el guardado automático
/// con debounce de 500ms.

@ProviderFor(NoteEditorController)
final noteEditorControllerProvider = NoteEditorControllerFamily._();

/// Controller del editor de notas. Gestiona la carga de una nota
/// existente (o el estado de nota nueva) y el guardado automático
/// con debounce de 500ms.
final class NoteEditorControllerProvider
    extends $AsyncNotifierProvider<NoteEditorController, Note?> {
  /// Controller del editor de notas. Gestiona la carga de una nota
  /// existente (o el estado de nota nueva) y el guardado automático
  /// con debounce de 500ms.
  NoteEditorControllerProvider._({
    required NoteEditorControllerFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'noteEditorControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$noteEditorControllerHash();

  @override
  String toString() {
    return r'noteEditorControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NoteEditorController create() => NoteEditorController();

  @override
  bool operator ==(Object other) {
    return other is NoteEditorControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noteEditorControllerHash() =>
    r'b9fde8d030e07019808601e212b6758eab457790';

/// Controller del editor de notas. Gestiona la carga de una nota
/// existente (o el estado de nota nueva) y el guardado automático
/// con debounce de 500ms.

final class NoteEditorControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          NoteEditorController,
          AsyncValue<Note?>,
          Note?,
          FutureOr<Note?>,
          int?
        > {
  NoteEditorControllerFamily._()
    : super(
        retry: null,
        name: r'noteEditorControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Controller del editor de notas. Gestiona la carga de una nota
  /// existente (o el estado de nota nueva) y el guardado automático
  /// con debounce de 500ms.

  NoteEditorControllerProvider call(int? noteId) =>
      NoteEditorControllerProvider._(argument: noteId, from: this);

  @override
  String toString() => r'noteEditorControllerProvider';
}

/// Controller del editor de notas. Gestiona la carga de una nota
/// existente (o el estado de nota nueva) y el guardado automático
/// con debounce de 500ms.

abstract class _$NoteEditorController extends $AsyncNotifier<Note?> {
  late final _$args = ref.$arg as int?;
  int? get noteId => _$args;

  FutureOr<Note?> build(int? noteId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Note?>, Note?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Note?>, Note?>,
              AsyncValue<Note?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
