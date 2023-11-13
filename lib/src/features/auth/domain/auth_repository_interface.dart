abstract class AuthRepoistoryInterface {
  Future<void> getCurrentAccount();
  Future<void> signup({
    required String email,
    required String password,
    required String name,
  });
  Future<void> login(String email, String password);
  Future<void> logout();
}
