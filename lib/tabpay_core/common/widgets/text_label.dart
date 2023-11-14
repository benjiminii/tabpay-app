import 'package:flutter/material.dart';

Text textLabel(
    {required String value,
    double fontSize = 13,
    TextAlign align = TextAlign.start,
    Color? color,
    int? maxLine,
    Key? key}) {
  return Text(
    value,
    style: TextStyle(
      fontSize: fontSize.toDouble(),
      color: color ?? Colors.black,
      overflow: TextOverflow.ellipsis,
    ),
    maxLines: maxLine,
    textAlign: align,
    key: key,
  );
}
