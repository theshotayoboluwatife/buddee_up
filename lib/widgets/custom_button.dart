import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onpress,
    this.buttonColor = Colors.white,
    this.height = 50,
    this.width = double.infinity,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.hasBorder = false,
  });

  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final double height;
  final double width;
  final double fontSize;
  final VoidCallback onpress;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height, //height of button
        width: width,
        //width of button
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              side: hasBorder
                  ? const BorderSide(width: 1, color: Colors.white)
                  : null,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            onPressed: onpress,
            child: CustomText(
              text: text,
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            )));
  }
}
