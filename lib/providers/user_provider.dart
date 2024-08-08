import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  List<dynamic> _users = [];
  bool _isLoading = false;

  List<dynamic> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=1&per_page=10'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _users = data['data'];
    } else {
      // Handle error
      _users = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshUsers() async {
    await fetchUsers();
  }
}
