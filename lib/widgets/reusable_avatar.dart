import 'package:flutter/material.dart';

class ReusableCircleAvatar extends StatelessWidget {
  final String imagePath;
  final double radius; 
  final Color borderColor; 
  final double borderWidth; 

  ReusableCircleAvatar({
    required this.imagePath,
    this.radius = 30.0,
    this.borderColor = Colors.blue,
    this.borderWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
