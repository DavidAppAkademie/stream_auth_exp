import 'dart:math';

import 'package:stream_auth_exp/private/in_memory_store.dart';
import 'package:stream_auth_exp/private/user.dart';

class FakeFirebaseAuth {
  // Singleton
  static final instance = FakeFirebaseAuth._();

  FakeFirebaseAuth._();

  final _authState = InMemoryStore<User?>(null);

  /// returns the current [user]
  /// if the user is not logged in, it returns `null`
  Stream<User?> get authStateChanges => _authState.stream;

  User? get currentUser => _authState.value;

  final List<User> _users = [];

  void dispose() => _authState.close();

  User _createNewUser(String email, String password) {
    Random random = Random();
    final uid = random.nextInt(1000000).toString();
    // create new user
    final user = User(email.substring(0, email.indexOf('@')), email, false,
        "https://xsgames.co/randomusers/avatar.php?g=male", uid, password);
    // register it
    _users.add(user);
    // update the auth state
    _authState.value = user;
    return user;
  }

  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    // check the given credentials agains each registered user
    for (final u in _users) {
      // matching email and password
      if (u.email == email && u.password == password) {
        _authState.value = u;
        return;
      }
      // same email, wrong password
      if (u.email == email && u.password != password) {
        throw Exception("Wrong password");
      }
    }
    throw Exception("User not found");
  }

  Future<void> logout() async {
    _authState.value = null;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    // do nothing
  }

  Future<void> sendVerificationEmail() async {
    await Future.delayed(const Duration(seconds: 1));
    // do nothing
  }

  Future<User> signUp(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    // check if the email is already in use
    for (final u in _users) {
      if (u.email == email) {
        throw Exception("Email already in use");
      }
    }
    // minimum password length requirement
    if (password.length < 8) {
      throw Exception("Password too short");
    }
    // create new user
    return _createNewUser(email, password);
  }
}
