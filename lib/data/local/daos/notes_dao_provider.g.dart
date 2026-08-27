// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_dao_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notesDao)
final notesDaoProvider = NotesDaoProvider._();

final class NotesDaoProvider
    extends $FunctionalProvider<NotesDao, NotesDao, NotesDao>
    with $Provider<NotesDao> {
  NotesDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notesDaoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notesDaoHash();

  @$internal
  @override
  $ProviderElement<NotesDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NotesDao create(Ref ref) {
    return notesDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotesDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotesDao>(value),
    );
  }
}

String _$notesDaoHash() => r'5769201799972780297d9f61b9a2bdb1612f0931';
