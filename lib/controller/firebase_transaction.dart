import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
