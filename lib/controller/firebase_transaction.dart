import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tabpay_app/controller/firebase_invoice.dart';

Future<String> createUserTransaction(Map<String, dynamic> invoice) async {
  print("invoice");
  print(invoice);
  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> transaction = {
    'userId': user?.uid,
    'invoice': invoice,
    'date': DateTime.now(),
    'type': invoice["type"],
  };
  DocumentReference transactionRef = await FirebaseFirestore.instance
      .collection('transaction')
      .add(transaction);

  await setUserInvoiceComplete(invoice['uid']);
  return transactionRef.id;
}

Future<List<Map<String, dynamic>>> getUserTransaction() async {
  User? user = FirebaseAuth.instance.currentUser;
  List<Map<String, dynamic>> dataList = [];

  CollectionReference<Map<String, dynamic>> transactionCollection =
      FirebaseFirestore.instance.collection('transaction');

  QuerySnapshot<Map<String, dynamic>> snapshot =
      await transactionCollection.where('userId', isEqualTo: user?.uid).get();

  dataList = snapshot.docs.map((doc) => doc.data()).toList();

  return dataList;
}
