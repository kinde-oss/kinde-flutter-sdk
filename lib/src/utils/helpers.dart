bool isSafeWebUrl(String input) {
  final uri = Uri.tryParse(input);
  if (uri == null || !uri.isAbsolute) {
    return false;
  }
  final scheme = uri.scheme.toLowerCase();
  return scheme == 'http' || scheme == 'https';
}
