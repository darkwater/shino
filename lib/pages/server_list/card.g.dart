// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadHash() => r'f189e702e0bff5751d8e77820866a5eb1eb84f5b';

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

/// See also [_load].
@ProviderFor(_load)
const _loadProvider = _LoadFamily();

/// See also [_load].
class _LoadFamily extends Family<AsyncValue<double>> {
  /// See also [_load].
  const _LoadFamily();

  /// See also [_load].
  _LoadProvider call(
    ServerDetails details,
  ) {
    return _LoadProvider(
      details,
    );
  }

  @override
  _LoadProvider getProviderOverride(
    covariant _LoadProvider provider,
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
  String? get name => r'_loadProvider';
}

/// See also [_load].
class _LoadProvider extends AutoDisposeFutureProvider<double> {
  /// See also [_load].
  _LoadProvider(
    ServerDetails details,
  ) : this._internal(
          (ref) => _load(
            ref as _LoadRef,
            details,
          ),
          from: _loadProvider,
          name: r'_loadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$loadHash,
          dependencies: _LoadFamily._dependencies,
          allTransitiveDependencies: _LoadFamily._allTransitiveDependencies,
          details: details,
        );

  _LoadProvider._internal(
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
    FutureOr<double> Function(_LoadRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _LoadProvider._internal(
        (ref) => create(ref as _LoadRef),
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
  AutoDisposeFutureProviderElement<double> createElement() {
    return _LoadProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _LoadProvider && other.details == details;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, details.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _LoadRef on AutoDisposeFutureProviderRef<double> {
  /// The parameter `details` of this provider.
  ServerDetails get details;
}

class _LoadProviderElement extends AutoDisposeFutureProviderElement<double>
    with _LoadRef {
  _LoadProviderElement(super.provider);

  @override
  ServerDetails get details => (origin as _LoadProvider).details;
}

String _$memoryHash() => r'c128f284b9c82fa849cc3aea436dcdaff85a6014';

/// See also [_memory].
@ProviderFor(_memory)
const _memoryProvider = _MemoryFamily();

/// See also [_memory].
class _MemoryFamily extends Family<AsyncValue<double>> {
  /// See also [_memory].
  const _MemoryFamily();

  /// See also [_memory].
  _MemoryProvider call(
    ServerDetails details,
  ) {
    return _MemoryProvider(
      details,
    );
  }

  @override
  _MemoryProvider getProviderOverride(
    covariant _MemoryProvider provider,
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
  String? get name => r'_memoryProvider';
}

/// See also [_memory].
class _MemoryProvider extends AutoDisposeFutureProvider<double> {
  /// See also [_memory].
  _MemoryProvider(
    ServerDetails details,
  ) : this._internal(
          (ref) => _memory(
            ref as _MemoryRef,
            details,
          ),
          from: _memoryProvider,
          name: r'_memoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$memoryHash,
          dependencies: _MemoryFamily._dependencies,
          allTransitiveDependencies: _MemoryFamily._allTransitiveDependencies,
          details: details,
        );

  _MemoryProvider._internal(
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
    FutureOr<double> Function(_MemoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: _MemoryProvider._internal(
        (ref) => create(ref as _MemoryRef),
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
  AutoDisposeFutureProviderElement<double> createElement() {
    return _MemoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is _MemoryProvider && other.details == details;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, details.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin _MemoryRef on AutoDisposeFutureProviderRef<double> {
  /// The parameter `details` of this provider.
  ServerDetails get details;
}

class _MemoryProviderElement extends AutoDisposeFutureProviderElement<double>
    with _MemoryRef {
  _MemoryProviderElement(super.provider);

  @override
  ServerDetails get details => (origin as _MemoryProvider).details;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
