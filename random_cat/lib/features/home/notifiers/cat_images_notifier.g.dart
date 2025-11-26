// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_images_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CatImagesNotifier)
const catImagesProvider = CatImagesNotifierFamily._();

final class CatImagesNotifierProvider
    extends $AsyncNotifierProvider<CatImagesNotifier, List<CatImageInfo>> {
  const CatImagesNotifierProvider._({
    required CatImagesNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'catImagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$catImagesNotifierHash();

  @override
  String toString() {
    return r'catImagesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CatImagesNotifier create() => CatImagesNotifier();

  @override
  bool operator ==(Object other) {
    return other is CatImagesNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$catImagesNotifierHash() => r'6bb9206bad6c2f11901f7ae58496b7e7e1013c3e';

final class CatImagesNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CatImagesNotifier,
          AsyncValue<List<CatImageInfo>>,
          List<CatImageInfo>,
          FutureOr<List<CatImageInfo>>,
          int
        > {
  const CatImagesNotifierFamily._()
    : super(
        retry: null,
        name: r'catImagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CatImagesNotifierProvider call(int size) =>
      CatImagesNotifierProvider._(argument: size, from: this);

  @override
  String toString() => r'catImagesProvider';
}

abstract class _$CatImagesNotifier extends $AsyncNotifier<List<CatImageInfo>> {
  late final _$args = ref.$arg as int;
  int get size => _$args;

  FutureOr<List<CatImageInfo>> build(int size);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<CatImageInfo>>, List<CatImageInfo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CatImageInfo>>, List<CatImageInfo>>,
              AsyncValue<List<CatImageInfo>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
