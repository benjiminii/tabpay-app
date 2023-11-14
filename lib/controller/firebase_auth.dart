import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> verifyPhoneNumber(String phoneNumber) async {
  await auth.verifyPhoneNumber(
    phoneNumber: '+976$phoneNumber',
    verificationCompleted: (PhoneAuthCredential credential) async {
      print("sda verificationCompleted");
      await auth.signInWithCredential(credential);
    },
    verificationFailed: (FirebaseAuthException e) {
      // Verification failed
      print("sda verificationFailed");
    },
    codeSent: (String verificationId, int? resendToken) async {
      print("sda codeSent");
      String smsCode = 'xxxxxx'; // Code input by the user
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      // Sign the user in with the credential
      await auth.signInWithCredential(credential);
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      print("sda codeAutoRetrievalTimeout");
    },
    timeout: const Duration(seconds: 60),
  );
}
