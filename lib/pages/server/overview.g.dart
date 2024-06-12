// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commandsHash() => r'4c9698fbdbb25ba38196d5afbd7fe89581a97585';

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

/// See also [commands].
@ProviderFor(commands)
const commandsProvider = CommandsFamily();

/// See also [commands].
class CommandsFamily extends Family<AsyncValue<List<Command>>> {
  /// See also [commands].
  const CommandsFamily();

  /// See also [commands].
  CommandsProvider call(
    ServerDetails details,
  ) {
    return CommandsProvider(
      details,
    );
  }

  @override
  CommandsProvider getProviderOverride(
    covariant CommandsProvider provider,
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
  String? get name => r'commandsProvider';
}

/// See also [commands].
class CommandsProvider extends AutoDisposeFutureProvider<List<Command>> {
  /// See also [commands].
  CommandsProvider(
    ServerDetails details,
  ) : this._internal(
          (ref) => commands(
            ref as CommandsRef,
            details,
          ),
          from: commandsProvider,
          name: r'commandsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commandsHash,
          dependencies: CommandsFamily._dependencies,
          allTransitiveDependencies: CommandsFamily._allTransitiveDependencies,
          details: details,
        );

  CommandsProvider._internal(
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
    FutureOr<List<Command>> Function(CommandsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommandsProvider._internal(
        (ref) => create(ref as CommandsRef),
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
  AutoDisposeFutureProviderElement<List<Command>> createElement() {
    return _CommandsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommandsProvider && other.details == details;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, details.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommandsRef on AutoDisposeFutureProviderRef<List<Command>> {
  /// The parameter `details` of this provider.
  ServerDetails get details;
}

class _CommandsProviderElement
    extends AutoDisposeFutureProviderElement<List<Command>> with CommandsRef {
  _CommandsProviderElement(super.provider);

  @override
  ServerDetails get details => (origin as CommandsProvider).details;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
