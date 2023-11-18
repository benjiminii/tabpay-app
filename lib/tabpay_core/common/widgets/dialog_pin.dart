import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';
import 'package:tabpay_app/tabpay_core/utils/fingerprint_helper.dart';
import 'package:tabpay_app/tabpay_core/utils/shared_prefs.dart';
import 'package:auto_route/auto_route.dart';

Future<String?> dialogConfirmPin(BuildContext context, String amount,
    String name, String cardID, Function(String) onClick) async {
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
              child: Container(color: Colors.white),
            ),
            SafeArea(
              child: Container(
                // width: size.width / 3 * (index + 1),
                height: size.height / 1.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  image: DecorationImage(
                      alignment: const Alignment(0, -0.5),
                      image:
                          AssetImage(Assets.images.introduction.introBg2.path),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
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
                                value: "Review transaction",
                                fontSize: 23,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(22)),
                            child: textLabel(
                                value: amount.toMoney(),
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
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: getVerticalSize(20)),
                            Image.asset(
                              Assets.images.home.profileAvatarIcon.path,
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(
                              width: size.width,
                              child: textLabel(
                                  value: name,
                                  fontSize: 23,
                                  align: TextAlign.center),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getHorizontalSize(22)),
                              child: textLabel(
                                  value: cardID, align: TextAlign.center),
                            ),
                            SizedBox(height: getVerticalSize(28)),
                            Pinput(
                              key: const Key("dialog_pinput"),
                              controller: TextEditingController(text: ""),
                              autofocus: !SharedPrefs().biometricPin.isNotEmpty,
                              // ^Focus here false,

                              cursor: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: 10,
                                  height: 1,
                                  color: Colors.black),
                              defaultPinTheme: PinTheme(
                                width: 62.86,
                                height: 63,
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              focusedPinTheme: PinTheme(
                                width: 62.86,
                                height: 63,
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.transparent,
                                ),
                              ),
                              submittedPinTheme: PinTheme(
                                width: 62.86,
                                height: 63,
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.transparent,
                                ),
                              ),
                              pinputAutovalidateMode:
                                  PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              obscureText: true,
                              onCompleted: (pin) {
                                Navigator.of(context).pop();
                                onClick(pin);
                              },
                            ),
                            SizedBox(height: getVerticalSize(20)),
                          ],
                        )),
                    // Flexible(child: Container()),
                    Align(
                      alignment: Alignment.center,
                      child: defaultButton(
                        widthSize: 200,
                        buttonLabel: "Cancel",
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
