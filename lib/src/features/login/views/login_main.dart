import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/src/features/login/cubit/login_cubit.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

@RoutePage()
class LoginMainPage extends StatefulWidget {
  const LoginMainPage({Key? key}) : super(key: key);

  @override
  _LoginMainPageState createState() => _LoginMainPageState();
}

class _LoginMainPageState extends State<LoginMainPage> {
  bool showIcon = false;
  TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    _usernameController = TextEditingController();
    _usernameController.addListener(() {
      if (_usernameController.value.text.length == 8) {
        setState(() {
          showIcon = true;
        });
      } else {
        setState(() {
          showIcon = false;
        });
      }
    });
    showIcon = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              const SizedBox(height: 150),
              Image.asset(
                Assets.images.login.login.path,
                height: 130,
                width: 130,
                // color: Colors.bl
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 50),
              textLabel(value: "Enter your Phone number", fontSize: 23),
              const SizedBox(height: 9),
              textLabel(
                  value: "We will send you the 4 digit verification code",
                  fontSize: 12,
                  color: Colors.grey),
              const SizedBox(height: 35),
              InputMultiIcon(
                controller: _usernameController,
                onChanged: (string) {},
                keyboardType: TextInputType.number,
                prefixIcon: SvgPicture.asset(
                  Assets.images.login.phoneNumberIcon.path,
                  height: 10,
                  width: 10,
                  color: Colors.black,
                  fit: BoxFit.scaleDown,
                ),
                suffixIcon: showIcon
                    ? const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.lightGreen,
                      )
                    : null,
                hintText: "Phone number",
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          KeyboardVisibilityBuilder(builder: (context, visible) {
        return !visible
            ? SizedBox(
                width: 200,
                child: defaultButton(
                    isEnabled: showIcon,
                    fillColor: HexColor("#04715E"),
                    buttonBorderColor: HexColor("#04715E"),
                    buttonTextColor: Colors.white,
                    buttonLabel: "Generate OTP",
                    onTap: () {
                      context.read<LoginCubit>().generateOtp(
                          context: context,
                          phoneNumber: _usernameController.text);
                    }),
              )
            : const SizedBox.shrink();
      }),
    );
  }
}
