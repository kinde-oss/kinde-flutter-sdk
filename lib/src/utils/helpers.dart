bool isSafeWebUrl(String input) {
  final uri = Uri.tryParse(input);
  return uri != null &&
      (uri.isAbsolute) &&
      (uri.scheme == 'http' || uri.scheme == 'https');
}
