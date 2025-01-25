import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauthtest/screens/shared/loading_screen.dart';
import 'package:oauthtest/screens/user/auth_Button.dart';
import 'package:oauthtest/screens/user/user_controller.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  void onGoogleLogin() {
    ref.watch(userControllerProvider.notifier).createGoogleSession();
  }

  void onDiscordLogin() {
    ref.watch(userControllerProvider.notifier).createGoogleSession();
  }

  void onLogout() {
    ref.watch(userControllerProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = ref.watch(userControllerProvider);
    final user = ref.watch(currentUserProvider).value;
    return MaterialApp(
      home: isLoading
          ? LoadingScreen()
          : Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    user != null
                        ? Text("Hello ${user.name}")
                        : Text('Hello World!'),
                    SizedBox(
                      height: 10,
                    ),
                    user != null
                        ? LogoutButton(onTap: onLogout)
                        : GoogleButton(onTap: onGoogleLogin),
                    if (user == null) DiscordButton(onTap: onDiscordLogin)
                  ],
                ),
              ),
            ),
    );
  }
}
