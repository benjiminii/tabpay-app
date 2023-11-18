import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';
import 'package:tabpay_app/tabpay_core/utils/fingerprint_helper.dart';
import 'package:tabpay_app/tabpay_core/utils/shared_prefs.dart';
import 'package:auto_route/auto_route.dart';

Future<String?> dialogSuccess(BuildContext context, String amount, String nmae,
    Function(String) onClick) async {
  return await showGeneralDialog(
    pageBuilder: (context, animation, secondaryAnimation) {
      if (SharedPrefs().biometricPin.isNotEmpty) {
        FingerPrintHelper().authenticateWithBiometrics().then((value) {
          if (value) {
            context.router.pop();
            onClick(SharedPrefs().biometricPin);
            // Navigator.of(context).pop();
          }
        });
      }
      return BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Stack(
          children: [
            SizedBox.expand(
                child: Container(
              color: Colors.white,
            )),
            SafeArea(
              child: Transform.flip(
                flipX: true,
                child: Container(
                  margin: const EdgeInsets.only(top: 80),
                  alignment: Alignment.center,
                  // width: size.width / 3 * (index + 1),
                  height: size.height / 1.5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    image: DecorationImage(
                        alignment: const Alignment(0, -0.5),
                        image: AssetImage(
                            Assets.images.introduction.introBg2.path),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  SizedBox(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 80),
                          padding: EdgeInsets.symmetric(
                              horizontal: getHorizontalSize(22)),
                          child: textLabel(
                              value: "Successful",
                              fontSize: 23,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: getHorizontalSize(30),
                          vertical: getVerticalSize(20)),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.topLeft,
                      // margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.images.home.successIcon.path,
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(
                            width: size.width,
                            child: textLabel(
                                value: "Temuulen",
                                fontSize: 23,
                                align: TextAlign.center,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(22)),
                            child: textLabel(
                                value: "5115 284 130",
                                align: TextAlign.center,
                                color: Colors.white),
                          ),
                          SizedBox(height: getVerticalSize(20)),
                        ],
                      )),
                  // Flexible(child: Container()),
                  Align(
                    alignment: Alignment.center,
                    child: defaultButton(
                      widthSize: 200,
                      buttonLabel: "End",
                      fillColor: Colors.white,

                      // hMargin: 57,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.1),
    transitionDuration: const Duration(microseconds: 100),
  );
}
