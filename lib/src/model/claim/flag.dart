enum FlagType { string, integer, bool }

class Flag {
  final String code;
  final FlagType? type;
  final dynamic value;
  final bool isDefault;

  Flag(this.code, this.type, this.value, this.isDefault);

  @override
  String toString() {
    return 'Flag{code: $code, type: $type, value: $value, isDefault: $isDefault}';
  }
}

extension FlagTypeExt on FlagType {
  String get character {
    switch(this) {
      case FlagType.string:
        return 's';
      case FlagType.integer:
        return 'i';
      case FlagType.bool:
        return 'b';
    }
  }
}
