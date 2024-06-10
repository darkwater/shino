// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sshClientHash() => r'aae5a4f32167f1519420e73ed9bf2b0df091f097';

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

/// See also [sshClient].
@ProviderFor(sshClient)
const sshClientProvider = SshClientFamily();

/// See also [sshClient].
class SshClientFamily extends Family<AsyncValue<SSHClient>> {
  /// See also [sshClient].
  const SshClientFamily();

  /// See also [sshClient].
  SshClientProvider call(
    ServerDetails details,
  ) {
    return SshClientProvider(
      details,
    );
  }

  @override
  SshClientProvider getProviderOverride(
    covariant SshClientProvider provider,
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
  String? get name => r'sshClientProvider';
}

/// See also [sshClient].
class SshClientProvider extends AutoDisposeFutureProvider<SSHClient> {
  /// See also [sshClient].
  SshClientProvider(
    ServerDetails details,
  ) : this._internal(
          (ref) => sshClient(
            ref as SshClientRef,
            details,
          ),
          from: sshClientProvider,
          name: r'sshClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sshClientHash,
          dependencies: SshClientFamily._dependencies,
          allTransitiveDependencies: SshClientFamily._allTransitiveDependencies,
          details: details,
        );

  SshClientProvider._internal(
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
    FutureOr<SSHClient> Function(SshClientRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SshClientProvider._internal(
        (ref) => create(ref as SshClientRef),
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
  AutoDisposeFutureProviderElement<SSHClient> createElement() {
    return _SshClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SshClientProvider && other.details == details;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, details.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SshClientRef on AutoDisposeFutureProviderRef<SSHClient> {
  /// The parameter `details` of this provider.
  ServerDetails get details;
}

class _SshClientProviderElement
    extends AutoDisposeFutureProviderElement<SSHClient> with SshClientRef {
  _SshClientProviderElement(super.provider);

  @override
  ServerDetails get details => (origin as SshClientProvider).details;
}

String _$distroIconHash() => r'433be3353fc06d519063fcfd684b43ed208500a9';

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
