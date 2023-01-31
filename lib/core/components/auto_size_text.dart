// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomAutoSizeText extends StatelessWidget {
  const CustomAutoSizeText({
    Key? key,
    required this.value,
    this.textStyle,
    this.alignment,
  }) : super(key: key);

  final String value;
  final TextStyle? textStyle;
  final TextAlign? alignment;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(value, style: textStyle, textAlign: alignment);
  }
}
