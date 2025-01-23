import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauthtest/providers/appwrite_providers.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(accountProvider);
  return AuthAPI(account: account);
});

class AuthAPI {
  final Account _account;

  AuthAPI({required Account account}) : _account = account;

  Future<User?> getUserAccount() async {
    try {
      return await _account.get();
    } catch (e) {
      print("Failed to get account: ${e.toString()}");
      return null;
    }
  }

  Future<void> createDiscordSession() async {
    try {
      await _account.createOAuth2Session(provider: OAuthProvider.discord);
    } catch (e) {
      print("Failed to create Session: ${e.toString()}");
    }
  }
}
