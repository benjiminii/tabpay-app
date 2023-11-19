import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tabpay_app/controller/firebase_account.dart';
import 'package:tabpay_app/controller/firebase_invoice.dart';
import 'package:tabpay_app/controller/firebase_transaction.dart';
import 'package:tabpay_app/tabpay_core/common/widgets/dialog_failed.dart';
import 'package:tabpay_app/tabpay_core/common/widgets/dialog_pin.dart';
import 'package:tabpay_app/tabpay_core/common/widgets/dialog_success.dart';
import 'package:tabpay_app/tabpay_core/models/home_repository/_responses.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:flutter_nfc_hce/flutter_nfc_hce.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

// Freezed part files
part 'home_cubit.freezed.dart';
part 'home_cubit.g.dart';
// My part files
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  ValueNotifier<dynamic> result = ValueNotifier(null);
  final flutterNfcHcePlugin = FlutterNfcHce();

  // Brute arga
  reoccuringBrute() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (state.currentState != BottomSectionState.isScanning) {
        debugPrint("Invoicer stopped checking status");
        timer.cancel();
      } else {
        debugPrint("Invoicer should check status");
        checkInvoiceStatus();
      }
    });
  }

  // Nfc unshih tolovt oruulna
  Future<void> finishTransaction(BuildContext context) async {
    debugPrint("Re-Enabling NFC polling");
    emit(state.copyWith(currentState: BottomSectionState.isDefault));
    getInvoiceIdFromNfc(context: context);
  }

  Future<void> initTransactions() async {
    List<Map<String, dynamic>> transactions = await getUserTransactions();
    User? user = FirebaseAuth.instance.currentUser;
    print("transactions");
    print(transactions);
    List<TransactionModel> transasctions = [];
    for (int i = 0; i < transactions.length; i++) {
      TransactionModel transaction = TransactionModel(
        id: i,
        createdDate: transactions[i]["date"].toDate(),
        transactionAmount: transactions[i]["amount"],
        remainingBalance: transactions[i]["type"] == "take"
            ? (user?.uid == transactions[i]["invoicerId"]
                ? transactions[i]["remainingBalance"]
                : transactions[i]["invoiceRemainingBalance"])
            : (user?.uid == transactions[i]["userId"]
                ? transactions[i]["invoiceRemainingBalance"]
                : transactions[i]["remainingBalance"]),
        description: transactions[i]["type"] == "take" ? "Income" : "Outcome",
        isIncome: transactions[i]["type"] == "take"
            ? (user?.uid == transactions[i]["invoicerId"] ? true : false)
            : (user?.uid == transactions[i]["userId"] ? true : false),
      );
      transasctions.insert(i, transaction);
    }
    emit(state.copyWith(transactionList: transasctions));
  }

  Future<void> initUser() async {
    Map<String, dynamic>? account = await getAccount();
    UserModel user = UserModel(
        id: 0,
        createdDate: "2023.10.25",
        remainingBalance: account?['balance'] ?? 0,
        accountNo: "**** **** **** 1555");
    emit(state.copyWith(userLogged: user));
  }

  // Tuhain invoice deer transaction uussen uguig shalgana
  Future<void> checkInvoiceStatus() async {
    Map<String, dynamic>? invoiceItem =
        await getInvoiceById(state.waitingInvoiceId);
    // debugPrint(invoiceItem?["Invoicer checking status"]);
    if (invoiceItem!["isComplete"]) {
      debugPrint(invoiceItem["Invoicer checking status: isComplete"]);
      emit(state.copyWith(currentState: BottomSectionState.isSuccessful));
    }
  }

  // Invoice uusgeed, HCE tsatsaj ehleh
  Future<void> createInvoiceAndHCE(
      {required BuildContext context,
      required int amount,
      required bool isInvoice}) async {
    if (isInvoice == false) {
      dialogConfirmPin(context, amount.toString(), "Bilguun", "5076 807 222",
          (pinCode) async {
        Map<String, dynamic>? account = await getAccount();
        if (account!['pinCode'] == pinCode) {
          bool isPossible = await checkIfTransactionIsPossible(
              "give", amount, account['userId']);
          if (isPossible) {
            String invoiceId = await createUserInvoice(amount, "give");
            NfcManager.instance.stopSession();
            createNfcWithInvoiceId(
                context: context, invoiceId: invoiceId, isInvoice: isInvoice);
          } else {
            dialogAlertFailed(
                context: context,
                title: "Unsuccessful",
                desc: "Insufficent balance",
                btnText: "Close");
          }
        } else {
          dialogAlertFailed(
              context: context,
              title: "Unsuccessful",
              desc: "Wrong Transaction Pin code",
              btnText: "Close");
        }
      });
    } else {
      String invoiceId = await createUserInvoice(amount, 'take');
      NfcManager.instance.stopSession();
      createNfcWithInvoiceId(
          context: context, invoiceId: invoiceId, isInvoice: isInvoice);
    }
  }

  // InvoiceId-gaar nfc tsatsaj ehlene
  void createNfcWithInvoiceId(
      {required BuildContext context,
      required String invoiceId,
      required isInvoice}) async {
    context.router.pop();

    var content = invoiceId;
    var result = await flutterNfcHcePlugin.startNfcHce(content);
    if (result.toString().toLowerCase() == "success") {
      debugPrint("Invoicer started HCE");
      emit(state.copyWith(
          currentState: BottomSectionState.isScanning,
          waitingInvoiceId: invoiceId));
      reoccuringBrute();
    }
  }

  // Utasnii nfc-tei holbootoi medeellwdiig avch hadgalana
  void getNfcRelatedInfo() async {
    String platformVersion =
        await flutterNfcHcePlugin.getPlatformVersion() ?? "";
    bool isNfcHceSupported = await flutterNfcHcePlugin.isNfcHceSupported();
    bool isSecureNfcEnabled = await flutterNfcHcePlugin.isSecureNfcEnabled();
    bool isNfcEnabled = await flutterNfcHcePlugin.isNfcEnabled();
    emit(state.copyWith(
        platformVersion: platformVersion,
        isNfcHceSupported: isNfcHceSupported,
        isSecureNfcEnabled: isSecureNfcEnabled,
        isNfcEnabled: isNfcEnabled));
  }

  // NFC unshih session ehlwleh ba, nfc oldvol ndef msg-s invoiceid-g avch terwgeer invoice detail avna
  void getInvoiceIdFromNfc({required BuildContext context}) {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      if (tag.data["ndef"] != null &&
          tag.data["ndef"]["cachedMessage"] != null &&
          tag.data["ndef"]["cachedMessage"]["records"][0] != null &&
          tag.data["ndef"]["cachedMessage"]["records"][0]["payload"] != null) {
        var payload =
            tag.data["ndef"]["cachedMessage"]["records"][0]["payload"];
        String invoiceId = String.fromCharCodes(payload).substring(3);
        getInvoiceAndPay(context: context, invoiceId: invoiceId);
      }
    });
  }

  // InvoiceId ashiglan delgerengui medeelliig avch, batalgaajuulah hesgiig haruulna
  Future<void> getInvoiceAndPay(
      {required BuildContext context, required String invoiceId}) async {
    Map<String, dynamic>? invoiceItem = await getInvoiceById(invoiceId);
    debugPrint("Reciever found HCE $invoiceId");
    if (invoiceItem!["type"] == "take") {
      dialogConfirmPin(
          context, invoiceItem["amount"].toString(), "Temuulen", "5076 888 210",
          (pinCode) async {
        Map<String, dynamic>? account = await getAccount();
        if (account!['pinCode'] == pinCode) {
          doTransaction(context, invoiceItem);
        } else {
          dialogAlertFailed(
              context: context,
              title: "Unsuccessful",
              desc: "Wrong Transaction Pin code",
              btnText: "Close");
        }
      });
    } else if (invoiceItem["isComplete"] == false) {
      doTransaction(context, invoiceItem);
    }
  }

  Future<void> doTransaction(
      BuildContext context, Map<String, dynamic> invoice) async {
    bool isPossible = await checkIfTransactionIsPossible(
        invoice["type"], invoice["amount"], invoice["userId"]);

    if (isPossible) {
      String transactionRef = await createUserTransaction(invoice);
      if (transactionRef.isNotEmpty) {
        debugPrint("Transaction created: $transactionRef");
        emit(state.copyWith(currentState: BottomSectionState.isDefault));
        dialogSuccess(
            context, invoice["amount"].toString(), "Temuulen", (p) {});
        initUser();
        initTransactions();
      }
    } else {
      dialogAlertFailed(
          context: context,
          title: "Unsuccessful",
          desc: "Insufficent balance",
          btnText: "Close");
    }
  }
}
