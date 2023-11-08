import 'package:flutter/material.dart';
import 'package:tabpay_app/tabpay_core/common/widgets/text_label.dart';

Widget defaultButton(
    {required String buttonLabel,
    required Function() onTap,
    isEnabled = true,
    Color fillColor = Colors.transparent,
    bool withIcon = true,
    String iconWidget = "",
    Color? buttonIconColor,
    Color? buttonTextColor,
    Color? buttonBorderColor}) {
  return InkWell(
    onTap: () {
      if (isEnabled) {
        onTap();
      }
    },
    child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: isEnabled ? fillColor : Colors.grey,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isEnabled
                  ? buttonBorderColor ?? Colors.transparent
                  : Colors.grey,
              width: 1),
        ),
        child: withIcon
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    // SvgPicture.asset(
                    //   iconWidget == ""
                    //       ? Assets.images.cam.imgIconadd1.path
                    //       : iconWidget,
                    //   fit: BoxFit.contain,
                    //   height: 22,
                    //   color: buttonIconColor,
                    // ),
                    const SizedBox(width: 8),
                    textLabel(
                        value: buttonLabel,
                        color: !isEnabled
                            ? Colors.black
                            : buttonTextColor ?? Colors.black),
                  ])
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    textLabel(
                        value: buttonLabel,
                        color: !isEnabled
                            ? Colors.black
                            : buttonTextColor ?? Colors.black),
                  ])),
  );
}