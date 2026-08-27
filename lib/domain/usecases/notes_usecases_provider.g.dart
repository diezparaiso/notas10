// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_usecases_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(createNoteUseCase)
final createNoteUseCaseProvider = CreateNoteUseCaseProvider._();

final class CreateNoteUseCaseProvider
    extends
        $FunctionalProvider<
          CreateNoteUseCase,
          CreateNoteUseCase,
          CreateNoteUseCase
        >
    with $Provider<CreateNoteUseCase> {
  CreateNoteUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createNoteUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createNoteUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateNoteUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateNoteUseCase create(Ref ref) {
    return createNoteUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateNoteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateNoteUseCase>(value),
    );
  }
}

String _$createNoteUseCaseHash() => r'f60d49be9aff8c6996e68311321b50f751caa156';

@ProviderFor(updateNoteUseCase)
final updateNoteUseCaseProvider = UpdateNoteUseCaseProvider._();

final class UpdateNoteUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateNoteUseCase,
          UpdateNoteUseCase,
          UpdateNoteUseCase
        >
    with $Provider<UpdateNoteUseCase> {
  UpdateNoteUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateNoteUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateNoteUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateNoteUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateNoteUseCase create(Ref ref) {
    return updateNoteUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateNoteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateNoteUseCase>(value),
    );
  }
}

String _$updateNoteUseCaseHash() => r'7de73448074e59d68f805535367bcbcd2a7df1c4';

@ProviderFor(deleteNoteUseCase)
final deleteNoteUseCaseProvider = DeleteNoteUseCaseProvider._();

final class DeleteNoteUseCaseProvider
    extends
        $FunctionalProvider<
          DeleteNoteUseCase,
          DeleteNoteUseCase,
          DeleteNoteUseCase
        >
    with $Provider<DeleteNoteUseCase> {
  DeleteNoteUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteNoteUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteNoteUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteNoteUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeleteNoteUseCase create(Ref ref) {
    return deleteNoteUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteNoteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteNoteUseCase>(value),
    );
  }
}

String _$deleteNoteUseCaseHash() => r'bf271c8d7f8653299d3b1ab07bf1578ac0c3999b';
