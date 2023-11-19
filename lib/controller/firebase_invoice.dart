import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
