import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> verifyPhoneNumber(String phoneNumber) async {
  await auth.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (PhoneAuthCredential credential) async {
      // Auto-retrieve verification code
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      // Verification failed
    },
    codeSent: (String verificationId, int? resendToken) async {
      // Save the verification ID for future use
      String smsCode = 'xxxxxx'; // Code input by the user
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      // Sign the user in with the credential
      await auth.signInWithCredential(credential);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    timeout: const Duration(seconds: 60),
  );
}
