import 'package:flutter/material.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';
// import 'package:tabpay_app/src/monpay_core/monpay_sdk/monpay_sdk.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    Key? key,
    required this.isCheck,
    required this.title,
    required this.onResult,
    this.checkColor,
    this.fillColor,
    this.borderColor,
    this.textColor,
  }) : super(key: key);
  final String title;
  final bool isCheck;
  final Color? checkColor;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;

  final Function(bool) onResult;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onResult(!isCheck);
      },
      child: Row(
        children: [
          AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: getSize(15)),
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
              width: getSize(24),
              height: getSize(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: isCheck
                    ? null
                    : Border.all(
                        color: borderColor == null
                            ? HexColor("#04715E")
                            : borderColor!,
                      ),
                color: isCheck ? fillColor : null,
              ),
              child: isCheck
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: getSize(14),
                    )
                  : null),
          textLabel(value: title, color: textColor)
        ],
      ),
    );
  }
}
