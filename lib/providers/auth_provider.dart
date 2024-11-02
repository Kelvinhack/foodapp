import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    // Mock authentication
    if (email == 'test@example.com' && password == 'password') {
      _user = User(
        id: '1',
        email: email,
        name: 'Test User',
        phone: '+1234567890',
        addresses: ['123 Test St, Test City'],
      );
      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _user = null;
    notifyListeners();
  }
}