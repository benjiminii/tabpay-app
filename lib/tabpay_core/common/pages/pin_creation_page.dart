import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:pinput/pinput.dart';
import 'package:tabpay_app/src/features/login/cubit/login_cubit.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';

@RoutePage()
class OtpPage extends StatefulWidget {
  const OtpPage(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.pin,
      required this.onTap});

  final String title;
  final String subtitle;
  final String pin;
  final Function() onTap;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _pinController = TextEditingController();
  late bool inputDone = false;
  @override
  void initState() {
    _pinController.addListener(() {
      if (_pinController.length == 4) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.white,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 300,
              ),
              textLabel(value: widget.title, fontSize: 23),
              const SizedBox(height: 9),
              if (widget.subtitle != "")
                textLabel(
                    value: widget.subtitle, fontSize: 12, color: Colors.grey),
              const SizedBox(height: 40),
              Pinput(
                key: const Key("validation_otp_pinput"),
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
                  context.read<LoginCubit>().pinCompleted(
                      context: context,
                      pin: widget.pin,
                      confirmPin: _pinController.text);
                },
              ),
            ],
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
                      buttonLabel: widget.pin != "" ? "Create pin" : "Continue",
                      onTap: () {
                        context.read<LoginCubit>().pinCompleted(
                            context: context,
                            pin: widget.pin,
                            confirmPin: _pinController.text);
                      }),
                ),
                const SizedBox(height: 13),
                defaultButton(
                  buttonLabel: "Back",
                  buttonBorderColor: Colors.white,
                  onTap: () {
                    context.router.pop();
                  },
                )
              ])
            : const SizedBox.shrink();
      }),
    );
  }
}
