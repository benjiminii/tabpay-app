import 'package:flutter/material.dart';
import 'package:tabpay_app/gen/fonts.gen.dart';

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
      fontFamily: FontFamily.codeNextSemiBold,
      fontSize: fontSize.toDouble(),
      color: color ?? Colors.black,
      overflow: TextOverflow.ellipsis,
    ),
    maxLines: maxLine,
    textAlign: align,
    key: key,
  );
}
