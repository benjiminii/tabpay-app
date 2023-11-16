import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      // String smsCode = 'xxxxxx'; // Code input by the user
      // PhoneAuthCredential credential = PhoneAuthProvider.credential(
      //   verificationId: verificationId,
      //   smsCode: smsCode,
      // );
      // Sign the user in with the credential
      // await auth.signInWithCredential(credential);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    timeout: const Duration(seconds: 120),
  );
}

Future<void> createInvoice(String amount) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      Map<String, dynamic> myInvoice = {
        'userId': user.uid,
        'amount': 100.0,
        'date': DateTime.now()
      };
      await FirebaseFirestore.instance.collection('invoice').add(myInvoice);
    } catch (e) {
      print('Error inserting invoice into Firestore: $e');
    }
  } else {
    print('User is not logged in');
  }
}

Future<List<Map<String, dynamic>>> getInvoices() async {
  List<Map<String, dynamic>> dataList = [];
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('invoice').get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();
      dataList.add(data);
    }
  } catch (e) {
    print('Error inserting invoice into Firestore: $e');
  }

  return dataList;
}

Future<List<Map<String, dynamic>>> getUserInvoices() async {
  User? user = FirebaseAuth.instance.currentUser;
  List<Map<String, dynamic>> dataList = [];
  if (user != null) {
    print(user.uid);
    try {
      CollectionReference<Map<String, dynamic>> invoicesCollection =
          FirebaseFirestore.instance.collection('invoices');

      QuerySnapshot<Map<String, dynamic>> snapshot =
          await invoicesCollection.where('userId', isEqualTo: user.uid).get();

      dataList = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error retrieving user data from Firestore: $e');
    }
  } else {
    print('User is not logged in');
  }

  return dataList;
}

// Future<void> verifyOTP(
//     String verificationId, String otpCode, BuildContext context) async {

//       try{
//   PhoneAuthCredential credential = PhoneAuthProvider.credential(
//     verificationId: verificationId,
//     smsCode: otpCode,
//   );
//   await auth.signInWithCredential(credential);
//   checkTransactionPin(context: context);

//       }
//       catch(err){
// return err
//       }
// }
