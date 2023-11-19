import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tabpay_app/controller/firebase_account.dart';
import 'package:tabpay_app/controller/firebase_auth.dart';
import 'package:tabpay_app/src/routes/app_router.gr.dart';
import 'package:tabpay_app/tabpay_core/common/widgets/dialog_failed.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Freezed part files
part 'login_cubit.freezed.dart';
part 'login_cubit.g.dart';
// My part files
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  // OTP avah huudasruu usreh
  Future<void> navToOtpPage({required BuildContext context}) async {
    context.router.push(LoginRouteWrapper(
        children: [LoginVerificationRoute(phoneNumber: state.phoneNumber)]));
  }

  // Pin code uusgeh huudasruu usreh
  Future<void> navToCreatePinPage({required BuildContext context}) async {
    context.router.push(OtpRoute(
        title: "Create transaction PIN", subtitle: "", pin: "", onTap: () {}));
  }

  // Pin code uusgeh huudasruu usreh
  Future<void> navToConfirmPinPage(
      {required BuildContext context, required String pin}) async {
    context.router.push(OtpRoute(
        title: "Create transaction PIN",
        subtitle: "Please re-enter your 4 digit PIN",
        pin: pin,
        onTap: () {}));
  }

  // Main huudasruu usreh
  Future<void> navToMainPage({required BuildContext context}) async {
    context.router.push(const HomeMainRoute());
  }

  // Guilgeenii huudasruu usreh
  Future<void> navToTransactionPage({required BuildContext context}) async {}

  // OTP uusgeh logic
  Future<void> generateOtp(
      {required BuildContext context, required String phoneNumber}) async {
    await verifyPhoneNumber(phoneNumber, (verificationId) {
      emit(state.copyWith(
          phoneNumber: phoneNumber, verificationId: verificationId));

      navToOtpPage(context: context);
    });
  }

  // OTP-g shalgah logic
  Future<void> verifyOtp(
      {required BuildContext context, required String otpCode}) async {
    try {
      await authOTP(state.verificationId, otpCode, context);

      checkTransactionPin(context: context);
    } catch (err) {
      dialogAlertFailed(
          context: context,
          title: "Unsuccessful",
          desc: "Wrong OTP code",
          btnText: "Close");
    }
  }

  // OTP-g shalgah logic
  Future<void> checkTransactionPin({required BuildContext context}) async {
    // TODO: API (transaction pin code uusgesen baival)
    Map<String, dynamic>? account = await getAccount();
    print('account');
    print(account);
    // if (account?.pinCode != null) {
    //   navToMainPage(context: context);
    // } else {
    //   navToCreatePinPage(context: context);
    // }
  }

  // Pin uusgeh huudasnii logic
  void pinCompleted(
      {required BuildContext context,
      required String pin,
      required String confirmPin}) {
    if (pin == "") {
      navToConfirmPinPage(context: context, pin: confirmPin);
    } else {
      if (pin == confirmPin) {
        createPinCode(context: context, pinCode: confirmPin);
      } else {
        dialogAlertFailed(
            context: context,
            title: "Unsuccessful",
            desc: "Sorry, Your Pin code mismatch.",
            btnText: "Close");
      }
    }
  }

  // Pin code uusgeh logic
  Future<void> createPinCode(
      {required BuildContext context, required String pinCode}) async {
    // TODO: API (Pin code uusgeh) amjilttai bolson bol
    if (true) {
      navToMainPage(context: context);
    }
  }
}
