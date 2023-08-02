class Keys {
  final List<Key> keys;

  const Keys({
    required this.keys,
  });

  Map<String, dynamic> toJson() {
    return {
      'keys': keys,
    };
  }

  factory Keys.fromJson(Map<String, dynamic> map) {
    return Keys(
      keys: (map['keys'] as List<dynamic>?)
              ?.map((e) => Key.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Key>[],
    );
  }
}

class Key {
  final String exponent;
  final String modulus;
  final String signingAlgorithm;
  final String keyId;
  final String keyType;

  const Key({
    required this.exponent,
    required this.modulus,
    required this.signingAlgorithm,
    required this.keyId,
    required this.keyType,
  });

  Map<String, dynamic> toJson() {
    return {
      'e': exponent,
      'n': modulus,
      'alg': signingAlgorithm,
      'kid': keyId,
      'kty': keyType,
    };
  }

  factory Key.fromJson(Map<String, dynamic> map) {
    return Key(
      exponent: map['e'] as String,
      modulus: map['n'] as String,
      signingAlgorithm: map['alg'] as String,
      keyId: map['kid'] as String,
      keyType: map['kty'] as String,
    );
  }
}
