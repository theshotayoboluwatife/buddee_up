import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w100,
    this.textAlign = TextAlign.start,
  });
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: 1),
    );
  }
}
