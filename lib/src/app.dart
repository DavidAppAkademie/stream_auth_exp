import 'package:flutter/material.dart';
import 'package:stream_auth_exp/src/feature/authentication/presentation/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const LoginScreen(),
    );
  }
}
