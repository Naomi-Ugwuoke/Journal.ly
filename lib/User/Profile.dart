import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends ChangeNotifier {
  
  bool _isAuthenticated = false;
  bool _isVerified = false;  

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

  logout() {
    _isAuthenticated = false;
  }

}