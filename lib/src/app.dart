import 'package:flutter/material.dart';
import 'package:stream_auth_exp/private/fake_firebase_auth.dart';
import 'package:stream_auth_exp/src/feature/authentication/presentation/login_screen.dart';
import 'package:stream_auth_exp/src/feature/profile/presentation/profile_screen.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: StreamBuilder(
          stream: FakeFirebaseAuth.instance.authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              // FALL 1: Stream hat Daten!
              final user = snapshot.data;
              if (user == null) {
                // aktuell ist niemand eingeloggt
                return const LoginScreen();
              } else {
                // aktuell ist jemand eingeloggt und user ist nicht null
                return ProfileScreen(user: user);
              }
            } else if (snapshot.connectionState != ConnectionState.done) {
              // FALL 2: Sind noch im Ladezustand
              return const CircularProgressIndicator();
            } else {
              // FALL 3: Es gab nen Fehler
              return const Icon(Icons.error);
            }
          },
        ));
  }
}
