import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

Future<Map<String, dynamic>?> getAccount() async {
  User? user = FirebaseAuth.instance.currentUser;
  print('userId: ${user?.uid}');
  if (user != null) {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection('account')
              .doc(user.uid)
              .get();
      print("account: ${documentSnapshot.data()!}");
      if (documentSnapshot.exists) {
        return documentSnapshot.data();
      } else {
        await createAccount();
        return getAccount();
      }
    } catch (err) {
      print('Error getting account info from Firestore: $err');
    }
  } else {
    return null;
  }
  return null;
}

Future<void> createAccount() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Map<String, dynamic> userInfo = {
        'userId': user.uid,
        'pinCode': null,
        'date': DateTime.now(),
        'balance': 100000,
      };
      await FirebaseFirestore.instance
          .collection('account')
          .doc(user.uid)
          .set(userInfo);
    }
  } catch (err) {
    // Handle the error
    print('Error inserting user info into Firestore: $err');
  }
}

Future<bool> setPinCode(String pinCode) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Insert user info to Firestore using the auth UUID
      await FirebaseFirestore.instance
          .collection('account')
          .doc(user.uid)
          .update({'pinCode': pinCode});
    }
    print('Ping created: $pinCode');
    return true;
  } catch (err) {
    // Handle the error
    print('Error setting pin code in Firestore: $err');
    return false;
  }
}

Future<Map<String, dynamic>?> getAccountById(String userId) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('account')
            .doc(userId)
            .get();
    print("account: ${documentSnapshot.data()!}");
    if (documentSnapshot.exists) {
      return documentSnapshot.data();
    } else {
      await createAccount();
      return getAccount();
    }
  } catch (err) {
    print('Error getting account info from Firestore: $err');
  }
  return null;
}
