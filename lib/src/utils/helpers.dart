bool isSafeWebUrl(String input) {
  final uri = Uri.tryParse(input);
  if (uri == null || !uri.isAbsolute) return false;

  final scheme = uri.scheme.toLowerCase();
  if (scheme != 'http' && scheme != 'https') return false;

  if (uri.host.isEmpty) return false;

  return true;
}
