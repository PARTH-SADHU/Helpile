import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double borderRadius;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomMaterialButton({
    required this.onPressed,
    required this.text,
    this.color = Colors.greenAccent,
    this.borderRadius = 50.0,
    this.height = 60.0,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w600,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 3, left: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.black),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: height,
        onPressed: onPressed,
        color: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
