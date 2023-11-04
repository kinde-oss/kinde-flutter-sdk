class KindeError implements Exception {
  final String message;

  KindeError(this.message);

  @override
  String toString() {
    return 'KindeError: $message';
  }
}
