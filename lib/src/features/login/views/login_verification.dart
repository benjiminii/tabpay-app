import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:pinput/pinput.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/src/features/login/cubit/login_cubit.dart';

import 'package:tabpay_app/tabpay_core/tabpay_core.dart';

@RoutePage()
class LoginVerificationPage extends StatefulWidget {
  const LoginVerificationPage({Key? key, required this.phoneNumber})
      : super(key: key);
  final String phoneNumber;
  @override
  LoginVerificationPageState createState() => LoginVerificationPageState();
}

class LoginVerificationPageState extends State<LoginVerificationPage> {
  final TextEditingController _pinController = TextEditingController();
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 29;
  late bool timerEnd = false;
  late bool inputDone = false;
  late CountdownTimerController _controller;

  @override
  void initState() {
    _controller = CountdownTimerController(endTime: endTime);
    _pinController.addListener(() {
      if (_pinController.length == 6) {
        setState(() {
          inputDone = true;
        });
      } else {
        setState(() {
          inputDone = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pinController.dispose();
    super.dispose();
  }

  void onResend() {
    _pinController.text = "";
    setState(() {
      endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 29;
      timerEnd = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                Image.asset(
                  Assets.images.login.login.path,
                  height: 130,
                  width: 130,
                  // color: Colors.bl
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 50),
                textLabel(value: "OTP Verification", fontSize: 23),
                const SizedBox(height: 9),
                textLabel(
                    value: "Enter the OTP sent to ${widget.phoneNumber}",
                    fontSize: 12,
                    color: Colors.grey),
                const SizedBox(height: 35),
                Pinput(
                  key: const Key("validation_otp_pinput"),
                  length: 6,
                  controller: _pinController,
                  // autofocus: false,
                  // Auto focus here ^
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
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  obscureText: false,
                  onCompleted: (pin) {
                    _pinController.text = pin;
                    context.read<LoginCubit>().verifyOtp(
                        context: context, otpCode: _pinController.text);
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textLabel(value: "Didn’t receive OTP?"),
                    const SizedBox(width: 10),
                    timerEnd
                        ? GestureDetector(
                            onTap: () {
                              onResend();
                            },
                            child:
                                textLabel(value: "Resend", color: Colors.red))
                        : CountdownTimer(
                            widgetBuilder: (context, time) {
                              if (time == null) {
                                return GestureDetector(
                                  onTap: () {
                                    onResend();
                                  },
                                  child: textLabel(
                                    value: "Resend",
                                    color: Colors.red,
                                  ),
                                );
                              }
                              return textLabel(
                                value: '00:${time.sec}',
                              );
                            },
                            endTime: endTime,
                            onEnd: () {
                              // setState(() {
                              timerEnd = true;
                              // });
                            }),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          KeyboardVisibilityBuilder(builder: (context, visible) {
        return !visible
            ? Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                  width: 200,
                  child: defaultButton(
                      isEnabled: inputDone,
                      fillColor: HexColor("#04715E"),
                      buttonBorderColor: HexColor("#04715E"),
                      buttonTextColor: Colors.white,
                      buttonLabel: "Continue",
                      onTap: () {
                        context.read<LoginCubit>().verifyOtp(
                            context: context, otpCode: _pinController.text);
                      }),
                ),
                const SizedBox(height: 13),
                SizedBox(
                  width: 200,
                  child: defaultButton(
                    buttonLabel: "Back",
                    buttonBorderColor: Colors.white,
                    onTap: () {
                      context.router.pop();
                    },
                  ),
                )
              ])
            : const SizedBox.shrink();
      }),
    );
  }
}
