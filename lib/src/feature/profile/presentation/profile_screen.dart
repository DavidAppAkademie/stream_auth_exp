import 'package:flutter/material.dart';
import 'package:stream_auth_exp/private/fake_firebase_auth.dart';
import 'package:stream_auth_exp/private/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Profil: ${user.displayName}"),
        actions: [
          IconButton(
            onPressed: () {
              FakeFirebaseAuth.instance.logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(user.photoURL!),
            Text("Email: ${user.email}"),
            Text("Name: ${user.displayName}")
          ],
        ),
      ),
    );
  }
}
