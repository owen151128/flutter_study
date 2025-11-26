// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_image_favorites_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CatImageFavoritesNotifier)
const catImageFavoritesProvider = CatImageFavoritesNotifierProvider._();

final class CatImageFavoritesNotifierProvider
    extends $NotifierProvider<CatImageFavoritesNotifier, List<CatImageInfo>> {
  const CatImageFavoritesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catImageFavoritesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catImageFavoritesNotifierHash();

  @$internal
  @override
  CatImageFavoritesNotifier create() => CatImageFavoritesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CatImageInfo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CatImageInfo>>(value),
    );
  }
}

String _$catImageFavoritesNotifierHash() =>
    r'172489e72976f6c47e423bb54ca5373f0a4a932b';

abstract class _$CatImageFavoritesNotifier
    extends $Notifier<List<CatImageInfo>> {
  List<CatImageInfo> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<CatImageInfo>, List<CatImageInfo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CatImageInfo>, List<CatImageInfo>>,
              List<CatImageInfo>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
