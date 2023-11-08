import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';

Future<Object?> dialogAlertFailed({
  required BuildContext context,
  String desc = "",
  String title = "",
  Function()? onTap,
  String btnText = "",
}) async {
  return await showDialog(
    builder: (context) {
      return BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IgnorePointer(
              ignoring: false,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 30.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      Assets.images.home.failedIcon.path,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 17),
                    textLabel(
                      value: title.isNotEmpty ? title : "Failed",
                      align: TextAlign.center,
                      fontSize: 15,
                    ),
                    SizedBox(height: getVerticalSize(17)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Container(
                        constraints:
                            BoxConstraints(maxHeight: size.height * .4),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          clipBehavior: Clip.hardEdge,
                          child: textLabel(
                              value: desc,
                              align: TextAlign.center,
                              color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalSize(17),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      width: 100,
                      child: defaultButton(
                          buttonLabel:
                              btnText.isNotEmpty ? btnText : "Try again",
                          buttonTextColor: Colors.white,
                          fillColor: HexColor("#AA0000"),
                          onTap: () {
                            Navigator.of(context).pop();
                            if (onTap != null) {
                              onTap();
                            }
                          }),
                    ),
                    SizedBox(height: getVerticalSize(50)),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.1),
  );
}
