import 'package:flutter/material.dart';

Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 7 || hexString.length == 9) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
