import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qurinom_chat_app/screens/home/view/home_screen.dart';

import 'package:qurinom_chat_app/screens/login/view/login_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<Widget> _checkLoginStatus() async {
    String? userId = await storage.read(key: 'user_id');
    if (userId != null && userId.isNotEmpty) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          return snapshot.data!;
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
