import 'package:flutter/foundation.dart';
import '../data/users.dart';

class AuthService extends ChangeNotifier {
  String? _email;
  Map<String, String>? _user;

  bool get isLoggedIn => _user != null;
  String? get email => _email;
  Map<String, String>? get user => _user;

  bool login(String email, String password) {
    final normalizedEmail = email.trim().toLowerCase();
    final candidate = demoUsers[normalizedEmail];
    if (candidate == null || candidate['password'] != password) {
      return false;
    }
    _email = normalizedEmail;
    _user = Map.unmodifiable(candidate);
    notifyListeners();
    return true;
  }

  void logout() {
    _email = null;
    _user = null;
    notifyListeners();
  }
}
