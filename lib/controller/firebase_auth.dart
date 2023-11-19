import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tabpay_app/controller/firebase_account.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> verifyPhoneNumber(
    String phoneNumber, Function(String verificationId) onCodeSent) async {
  await auth.verifyPhoneNumber(
    phoneNumber: '+976$phoneNumber',
    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      // Verification failed\
    },
    codeSent: (String verificationId, int? resendToken) async {
      await onCodeSent(verificationId);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    timeout: const Duration(seconds: 120),
  );
}

Future<void> authOTP(
    String verificationId, String otpCode, BuildContext context) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );
    await auth.signInWithCredential(credential);
  } catch (err) {
    print('Error signing in with OTP: $err');
  }
}
