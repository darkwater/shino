// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sshClientHash() => r'ed18a1882a4751340494c187c6ab0f4c18f00be3';

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

String _$unameHash() => r'33f30697f084e8ad4b7dfcd2432c2603296a0c33';

/// See also [uname].
@ProviderFor(uname)
const unameProvider = UnameFamily();

/// See also [uname].
class UnameFamily extends Family<AsyncValue<String>> {
  /// See also [uname].
  const UnameFamily();

  /// See also [uname].
  UnameProvider call(
    ServerDetails details,
  ) {
    return UnameProvider(
      details,
    );
  }

  @override
  UnameProvider getProviderOverride(
    covariant UnameProvider provider,
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
  String? get name => r'unameProvider';
}

/// See also [uname].
class UnameProvider extends AutoDisposeFutureProvider<String> {
  /// See also [uname].
  UnameProvider(
    ServerDetails details,
  ) : this._internal(
          (ref) => uname(
            ref as UnameRef,
            details,
          ),
          from: unameProvider,
          name: r'unameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$unameHash,
          dependencies: UnameFamily._dependencies,
          allTransitiveDependencies: UnameFamily._allTransitiveDependencies,
          details: details,
        );

  UnameProvider._internal(
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
    FutureOr<String> Function(UnameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UnameProvider._internal(
        (ref) => create(ref as UnameRef),
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
  AutoDisposeFutureProviderElement<String> createElement() {
    return _UnameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UnameProvider && other.details == details;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, details.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UnameRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `details` of this provider.
  ServerDetails get details;
}

class _UnameProviderElement extends AutoDisposeFutureProviderElement<String>
    with UnameRef {
  _UnameProviderElement(super.provider);

  @override
  ServerDetails get details => (origin as UnameProvider).details;
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
