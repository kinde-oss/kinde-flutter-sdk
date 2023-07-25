class KindeError extends Error {
  final String message;

  KindeError(this.message);

  @override
  String toString() {
    return 'KindeError: $message';
  }
}
