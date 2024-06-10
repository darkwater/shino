import 'dart:convert';

import 'package:pinenacl/ed25519.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keypair.g.dart';

@riverpod
Future<Keypair> keypair(KeypairRef ref) async {
  return await Keypair.get();
}

class Keypair {
  SigningKey privateKey;

  Keypair(this.privateKey);

  factory Keypair.generate() {
    print("!!! GENERATING NEW KEYPAIR !!!");

    final keypair = Keypair(SigningKey.generate());
    keypair.save();
    return keypair;
  }

  AsymmetricPublicKey get publicKey => privateKey.publicKey;

  String get publicKeyOpenSSH {
    const type = "ssh-ed25519";
    final data = ByteData(4 + type.length + 4 + publicKey.length);
    data.setUint32(0, type.length);
    data.buffer.asUint8List().setAll(4, type.codeUnits);
    data.setUint32(4 + type.length, publicKey.length);
    data.buffer
        .asUint8List()
        .setAll(4 + type.length + 4, publicKey.toUint8List());

    final b64 = base64Encode(data.buffer.asUint8List());

    return "$type $b64";
  }

  static const String _storageKey = "_key0";

  Future<void> save() async {
    await const FlutterSecureStorage().write(
      key: _storageKey,
      value: base64Encode(privateKey.toUint8List()),
    );
  }

  static Future<Keypair?> load() async {
    final b64 = await const FlutterSecureStorage().read(key: _storageKey);
    if (b64 == null) return null;

    final bytes = base64Decode(b64);

    return Keypair(SigningKey.fromValidBytes(bytes));
  }

  static Future<Keypair> get() async {
    return (await load()) ?? Keypair.generate();
  }
}
