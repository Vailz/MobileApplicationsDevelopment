import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum ApplicationLoginSate {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
}

class ApplicationSate with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
  User? _user;
  FirebaseAuth _auth = FirebaseAuth.instance;
  ApplicationLoginSate _loginState =
      ApplicationLoginSate.loggedOut;

  ApplicationLoginSate get loginState => _loginState;

  User? get user => _user;

  set loginState(ApplicationLoginSate value) {
    _loginState = value;
    notifyListeners();
  }

  Future<void> checkLoginState() async {
    _user = _auth.currentUser;
    if (_user == null) {
      loginState = ApplicationLoginSate.loggedOut;
    } else {
      // Проверяем, зарегистрирован ли пользователь
      final userExists = await _auth.userChanges().first;
      if (userExists != null) {
        loginState = ApplicationLoginSate.loggedIn;
      } else {
        loginState = ApplicationLoginSate.loggedOut;
      }
    }
  }


  Future<void> signIn(String email, String password,
      Function(FirebaseAuthException) errorCallback) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
    notifyListeners();
  }

  Future<void> signUp(String email, String password,
      Function(FirebaseAuthException) errorCallback) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    loginState = ApplicationLoginSate.loggedOut;
    notifyListeners();
  }
}
