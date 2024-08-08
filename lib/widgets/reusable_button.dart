import 'package:apktest/utils/hexautil.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String colorHex; // Hexadecimal color code
  final String textColorHex; // Hexadecimal color code for text
  final double? widthFraction; // Menambahkan parameter untuk fraksi lebar

  ReusableButton({
    required this.title,
    required this.onPressed,
    this.colorHex = '#2B637B', // Default color (blue)
    this.textColorHex = '#FFFFFF', // Default text color (white)
    this.widthFraction = 1, // Lebar sebagai fraksi dari lebar layar, default 100%
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFraction ?? 1, // Mengatur lebar tombol sebagai fraksi dari lebar induk
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: hexToColor(textColorHex), // Text color
          backgroundColor: hexToColor(colorHex), // Background color
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
