import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauthtest/api/auth_api.dart';

final userControllerProvider =
    StateNotifierProvider<UserController, bool>((ref) {
  return UserController(authAPI: ref.watch(authAPIProvider));
});

final currentUserProvider = FutureProvider((ref) async {
  final userController = ref.watch(userControllerProvider.notifier);
  return userController.currentUser();
});

class UserController extends StateNotifier<bool> {
  final AuthAPI _authAPI;

  UserController({required AuthAPI authAPI})
      : _authAPI = authAPI,
        super(false);

  Future<void> createGoogleSession() async {
    state = true;
    print(state);
    await _authAPI.createGoogleSession();
    state = false;
    print(state);
  }

  Future<void> logout() async {
    state = true;
    await _authAPI.logout();
    state = false;
  }

  Future<User?> currentUser() => _authAPI.getUserAccount();
}
