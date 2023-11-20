import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tabpay_app/controller/firebase_account.dart';
import 'package:tabpay_app/tabpay_core/common/widgets/dialog_failed.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> verifyPhoneNumber(String phoneNumber, BuildContext context,
    Function(String verificationId) onCodeSent) async {
  await auth.verifyPhoneNumber(
    phoneNumber: '+976$phoneNumber',
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      dialogAlertFailed(
          context: context,
          title: "Please use test phone number",
          desc: "99775136, 94441890, 99897475",
          btnText: "Close");
    },
    codeSent: (String verificationId, int? resendToken) async {
      await onCodeSent(verificationId);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    timeout: const Duration(seconds: 120),
  );
}

Future<bool> authOTP(
    String verificationId, String otpCode, BuildContext context) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );
    await auth.signInWithCredential(credential);
    return true;
  } catch (err) {
    print('Error signing in with OTP: $err');
    return false;
  }
}
