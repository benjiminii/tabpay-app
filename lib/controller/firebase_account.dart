import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class Account {
  double? balance;
  String userId;
  Timestamp date;
  int? pinCode;

  Account({
    required this.balance,
    required this.userId,
    required this.date,
    required this.pinCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'userId': userId,
      'date': date.toDate(),
      'pinCode': pinCode,
    };
  }
}

Future<Account?> getAccount() async {
  Account? account;
  Map<String, dynamic> data = {};
  try {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('account')
            .doc(user?.uid)
            .get();
    account = Account(
      balance: documentSnapshot.data()!['balance'],
      userId: documentSnapshot.data()!['userId'],
      date: documentSnapshot.data()!['date'],
      pinCode: documentSnapshot.data()!['pinCode'],
    );
  } catch (err) {
    print('Error getting account info from Firestore: $err');
  }
  print("account: $account");
  if (account == null) {
    await createAccount();
    return getAccount();
  } else {
    return account;
  }
}

Future<void> createAccount() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Map<String, dynamic> userInfo = {
        'userId': user.uid,
        'pinCode': null,
        'date': DateTime.now(),
        'balanace': 100000
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
