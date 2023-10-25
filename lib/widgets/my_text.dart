import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final String? family;
  final int? maxLines;
  final TextOverflow? overFlow;
  const MyText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.family,
    this.maxLines,
    this.overFlow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamily: family,
        overflow: overFlow
      ),
    );
  }
}
