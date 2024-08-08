import 'package:flutter/material.dart';

class PalindromeProvider with ChangeNotifier {
  String _name = '';
  String _sentence = '';
  String _selectedUserName = '';

  String get name => _name;
  String get sentence => _sentence;
  String get selectedUserName => _selectedUserName;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setSentence(String sentence) {
    _sentence = sentence;
    notifyListeners();
  }

  void setSelectedUserName(String userName) {
    _selectedUserName = userName;
    notifyListeners();
  }
  bool isPalindrome(String text) {
    String cleaned = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversed = cleaned.split('').reversed.join('');
    return cleaned == reversed;
  }

  String getPalindromeMessage() {
    if (isPalindrome(_sentence)) {
      return "isPalindrome";
    } else {
      return "not palindrome";
    }
  }
}
