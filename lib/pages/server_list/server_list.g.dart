// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$distroIconHash() => r'f6f75aac42dde459ef436b5a8722a1bb594b8b2d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [distroIcon].
@ProviderFor(distroIcon)
const distroIconProvider = DistroIconFamily();

/// See also [distroIcon].
class DistroIconFamily extends Family<AsyncValue<IconData>> {
  /// See also [distroIcon].
  const DistroIconFamily();

  /// See also [distroIcon].
  DistroIconProvider call(
    ServerDetails details,
  ) {
    return DistroIconProvider(
      details,
    );
  }

  @override
  DistroIconProvider getProviderOverride(
    covariant DistroIconProvider provider,
  ) {
    return call(
      provider.details,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'distroIconProvider';
}

/// See also [distroIcon].
class DistroIconProvider extends AutoDisposeFutureProvider<IconData> {
  /// See also [distroIcon].
  DistroIconProvider(
    ServerDetails details,
  ) : this._internal(
          (ref) => distroIcon(
            ref as DistroIconRef,
            details,
          ),
          from: distroIconProvider,
          name: r'distroIconProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$distroIconHash,
          dependencies: DistroIconFamily._dependencies,
          allTransitiveDependencies:
              DistroIconFamily._allTransitiveDependencies,
          details: details,
        );

  DistroIconProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.details,
  }) : super.internal();

  final ServerDetails details;

  @override
  Override overrideWith(
    FutureOr<IconData> Function(DistroIconRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DistroIconProvider._internal(
        (ref) => create(ref as DistroIconRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        details: details,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<IconData> createElement() {
    return _DistroIconProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DistroIconProvider && other.details == details;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, details.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DistroIconRef on AutoDisposeFutureProviderRef<IconData> {
  /// The parameter `details` of this provider.
  ServerDetails get details;
}

class _DistroIconProviderElement
    extends AutoDisposeFutureProviderElement<IconData> with DistroIconRef {
  _DistroIconProviderElement(super.provider);

  @override
  ServerDetails get details => (origin as DistroIconProvider).details;
}

String _$keypairHash() => r'c91e3732e9b646a4533ec0d04da0697aad12f27b';

/// See also [keypair].
@ProviderFor(keypair)
final keypairProvider = AutoDisposeFutureProvider<Keypair>.internal(
  keypair,
  name: r'keypairProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$keypairHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KeypairRef = AutoDisposeFutureProviderRef<Keypair>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
