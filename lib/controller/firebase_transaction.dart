import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Future<String> createInvoice(String invoiceId) async {
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     try {
//       Map<String, dynamic> myInvoice = {
//         'userId': user.uid,
//         'amount': amount,
//         'date': DateTime.now(),
//         'type': "give",
//         'isComplete': false,
//       };
//       DocumentReference invoiceRef =
//           await FirebaseFirestore.instance.collection('invoice').add(myInvoice);
//       return invoiceRef.id;
//     } catch (e) {
//       print('Error inserting invoice into Firestore: $e');
//       return '';
//     }
//   } else {
//     print('User is not logged in');
//     return '';
//   }
// }

Future<Map<String, dynamic>?> getInvoiceById(String invoiceId) async {
  // List<Map<String, dynamic>> dataList = [];
  try {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('invoice')
            .doc(invoiceId)
            .get();

    if (documentSnapshot.exists) {
      return documentSnapshot.data();
    } else {
      print('Invoice document does not exist');
      return null;
    }
  } catch (e) {
    print('Error inserting invoice into Firestore: $e');
  }
  return null;
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
