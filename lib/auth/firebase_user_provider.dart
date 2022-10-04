import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class MinuteMathFirebaseUser {
  MinuteMathFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MinuteMathFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MinuteMathFirebaseUser> minuteMathFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MinuteMathFirebaseUser>(
      (user) {
        currentUser = MinuteMathFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
