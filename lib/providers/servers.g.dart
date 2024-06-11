// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$serverDetailsHash() => r'297d2eb323e48cdf06410905b1111122248ae174';

/// See also [serverDetails].
@ProviderFor(serverDetails)
final serverDetailsProvider = AutoDisposeProvider<List<ServerDetails>>.internal(
  serverDetails,
  name: r'serverDetailsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$serverDetailsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ServerDetailsRef = AutoDisposeProviderRef<List<ServerDetails>>;
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

String _$serverModelHash() => r'b78988f66d7c0dab02de87ee76bb65ac03105874';

/// See also [serverModel].
@ProviderFor(serverModel)
const serverModelProvider = ServerModelFamily();

/// See also [serverModel].
class ServerModelFamily extends Family<AsyncValue<GenericServer>> {
  /// See also [serverModel].
  const ServerModelFamily();

  /// See also [serverModel].
  ServerModelProvider call(
    ServerDetails details,
  ) {
    return ServerModelProvider(
      details,
    );
  }

  @override
  ServerModelProvider getProviderOverride(
    covariant ServerModelProvider provider,
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
  String? get name => r'serverModelProvider';
}

/// See also [serverModel].
class ServerModelProvider extends AutoDisposeFutureProvider<GenericServer> {
  /// See also [serverModel].
  ServerModelProvider(
    ServerDetails details,
  ) : this._internal(
          (ref) => serverModel(
            ref as ServerModelRef,
            details,
          ),
          from: serverModelProvider,
          name: r'serverModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$serverModelHash,
          dependencies: ServerModelFamily._dependencies,
          allTransitiveDependencies:
              ServerModelFamily._allTransitiveDependencies,
          details: details,
        );

  ServerModelProvider._internal(
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
    FutureOr<GenericServer> Function(ServerModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ServerModelProvider._internal(
        (ref) => create(ref as ServerModelRef),
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
  AutoDisposeFutureProviderElement<GenericServer> createElement() {
    return _ServerModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ServerModelProvider && other.details == details;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, details.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ServerModelRef on AutoDisposeFutureProviderRef<GenericServer> {
  /// The parameter `details` of this provider.
  ServerDetails get details;
}

class _ServerModelProviderElement
    extends AutoDisposeFutureProviderElement<GenericServer>
    with ServerModelRef {
  _ServerModelProviderElement(super.provider);

  @override
  ServerDetails get details => (origin as ServerModelProvider).details;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
