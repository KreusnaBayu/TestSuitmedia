import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController? controller;

  ReusableTextField({
    required this.hintText,
    required this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true, // Mengaktifkan pengisian latar belakang
        fillColor: Colors.white, // Mengatur warna latar belakang
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0), // Mengatur radius ujung
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0), // Mengatur radius ujung
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1.0), // Warna dan ketebalan border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0), // Mengatur radius ujung
          borderSide: BorderSide(color: Colors.grey, width: 1.5), // Warna dan ketebalan border saat fokus
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
      ),
    );
  }
}
