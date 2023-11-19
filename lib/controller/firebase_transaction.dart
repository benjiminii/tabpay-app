import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tabpay_app/controller/firebase_account.dart';
import 'package:tabpay_app/controller/firebase_invoice.dart';

Future<String> createUserTransaction(Map<String, dynamic> invoice) async {
  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic>? account = await getAccount();
  Map<String, dynamic>? invoicerAccount =
      await getAccountById(invoice["userId"]);

  var addedAcc = invoice["type"] == "take" ? invoicerAccount : account;
  var minusAcc = invoice["type"] == "take" ? account! : invoicerAccount;

  await FirebaseFirestore.instance
      .collection('account')
      .doc(addedAcc!['userId'])
      .update({'balance': addedAcc['balance'] + invoice["amount"]});

  await FirebaseFirestore.instance
      .collection('account')
      .doc(minusAcc!['userId'])
      .update({'balance': minusAcc['balance'] - invoice["amount"]});

  Map<String, dynamic> transaction = {
    'userId': user?.uid,
    'amount': invoice["amount"],
    'invoicerId': invoice["userId"],
    'invoiceId': invoice["id"],
    'date': DateTime.now(),
    'type': invoice["type"],
    "remainingBalance": invoice["type"] == "take"
        ? addedAcc['balance'] + invoice["amount"]
        : minusAcc['balance'] - invoice["amount"],
    "invoiceRemainingBalance": invoice["type"] == "give"
        ? addedAcc['balance'] + invoice["amount"]
        : minusAcc['balance'] - invoice["amount"]
  };

  DocumentReference transactionRef = await FirebaseFirestore.instance
      .collection('transaction')
      .add(transaction);

  await setUserInvoiceComplete(invoice['id']);
  return transactionRef.id;
}

Future<List<Map<String, dynamic>>> getUserTransactions() async {
  User? user = FirebaseAuth.instance.currentUser;
  List<Map<String, dynamic>> dataList = [];

  CollectionReference<Map<String, dynamic>> transactionCollection =
      FirebaseFirestore.instance.collection('transaction');

  QuerySnapshot<Map<String, dynamic>> snapshot = await transactionCollection
      .where(Filter.or(
        Filter("userId", isEqualTo: user?.uid),
        Filter("invoicerId", isEqualTo: user?.uid),
      ))
      .orderBy('date', descending: true)
      .get();

  dataList = snapshot.docs.map((doc) => doc.data()).toList();

  return dataList;
}

Future<bool> checkIfTransactionIsPossible(
    String type, int amount, String userId) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (type == "take") {
    Map<String, dynamic>? account = await getAccount();
    if (account?['balance'] >= amount) {
      return true;
    } else {
      return false;
    }
  } else {
    Map<String, dynamic>? invoicerAccount = await getAccountById(userId);
    if (invoicerAccount?['balance'] >= amount) {
      return true;
    } else {
      return false;
    }
  }
}
