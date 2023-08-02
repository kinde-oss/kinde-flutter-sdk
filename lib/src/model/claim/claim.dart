class Claim {
  final String name;
  final dynamic value;

  Claim(this.name, this.value);

  @override
  String toString() {
    return 'Claim{name: $name, value: $value}';
  }
}
