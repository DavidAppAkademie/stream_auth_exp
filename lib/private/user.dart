/// A user account.
class User {
  final String _displayName;
  final String _email;
  final bool _isEmailVerified;
  final String _photoURL;
  final String _uid;
  final String _password;

  User(this._displayName, this._email, this._isEmailVerified, this._photoURL,
      this._uid, this._password);

  /// The users display name.
  ///
  /// Will be `null` if signing in anonymously or via password authentication.
  String? get displayName {
    return _displayName;
  }

  /// The users email address.
  ///
  /// Will be `null` if signing in anonymously.
  String? get email {
    return _email;
  }

  /// Returns whether the users email address has been verified.
  ///
  /// To send a verification email, see [sendEmailVerification].
  ///
  /// Once verified, call [reload] to ensure the latest user information is
  /// retrieved from Firebase.
  bool get emailVerified {
    return _isEmailVerified;
  }

  /// Returns a photo URL for the user.
  ///
  /// This property will be populated if the user has signed in or been linked
  /// with a 3rd party OAuth provider (such as Google).
  String? get photoURL {
    return _photoURL;
  }

  /// The user's unique ID.
  String get uid {
    return _uid;
  }

  /// The user's password.
  String get password {
    return _password;
  }
}
