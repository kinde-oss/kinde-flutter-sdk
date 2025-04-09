abstract class KindeSecureStorageInterface {
  Future<List<int>?> getSecureKey();
  Future<void> saveSecureKey(List<int> secureKey);

  Future<String?> getAuthRequestState();
  Future<void> saveAuthRequestState(String state);
  Future<void> removeAuthRequestState();
}
