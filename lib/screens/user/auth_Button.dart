import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.logout,
        color: Colors.white,
      ),
      style: IconButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 150, 0, 0),
        padding: EdgeInsets.symmetric(horizontal: 30),
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  final VoidCallback onTap;

  const GoogleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.g_mobiledata,
        size: 30,
        color: Colors.white,
      ),
      style: IconButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 150, 0, 0),
        padding: EdgeInsets.symmetric(horizontal: 30),
      ),
    );
  }
}
