import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends ChangeNotifier {
  
  bool _isAuthenticated = false;
  bool _isVerified = false;  
  String _uid = '';
  String? name = '';
  String? _email = '';

  bool _moodAdded = false;

  bool get isAuthenticated {
    return _isAuthenticated;
  }

  set isAuthenticated(bool newStatus) {
    _isAuthenticated = newStatus;
    notifyListeners();
  }

  bool get isVerified {
    return _isVerified;
  }

  set isVerified(bool newStatus) {
    _isVerified = newStatus;
    notifyListeners();
  }    

  String get userId {
    return _uid;
  }

  set userId(String userId) {
    _uid = userId;
    notifyListeners();
  }

  String? get userEmail {
    return _email;
  }

  set userEmail(String? email) {
    _email = email;
    notifyListeners();
  }

  String? get userName {
    return name;
  }

  set userName(String? userNameInput) {
    name = userNameInput;
    notifyListeners();
  }

  logout() {    
    _isAuthenticated = false;
    notifyListeners();
  }

  bool get moodAdded {
    return _moodAdded;
  }

  set moodAdded(bool val) {
    _moodAdded = val;
    notifyListeners();
  }

}