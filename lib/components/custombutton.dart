import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveladminapp/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color backgroundColor;
  final double width;
  final double fontSize;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.backgroundColor,
    required this.width,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50.0,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shadowColor: MaterialStateProperty.all(kPrimaryColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.lato(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
