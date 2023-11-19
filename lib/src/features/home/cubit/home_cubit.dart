import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tabpay_app/controller/firebase_invoice.dart';
import 'package:tabpay_app/tabpay_core/common/widgets/dialog_pin.dart';
import 'package:tabpay_app/tabpay_core/models/home_repository/_responses.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:flutter_nfc_hce/flutter_nfc_hce.dart';

// Freezed part files
part 'home_cubit.freezed.dart';
part 'home_cubit.g.dart';
// My part files
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  ValueNotifier<dynamic> result = ValueNotifier(null);
  final flutterNfcHcePlugin = FlutterNfcHce();

  Future<void> initTransactions({required BuildContext context}) async {
    List<TransactionModel> transasctions = [];
    TransactionModel transaction1 = const TransactionModel(
        id: 0,
        createdDate: "2023.10.28",
        transactionAmount: 150000,
        remainingBalance: 150000,
        description: "Income",
        isIncome: true);
    TransactionModel transaction2 = const TransactionModel(
        id: 1,
        createdDate: "2023.10.29",
        transactionAmount: 100000,
        remainingBalance: 250000,
        description: "Income",
        isIncome: true);
    TransactionModel transaction3 = const TransactionModel(
        id: 1,
        createdDate: "2023.10.29",
        transactionAmount: 50000,
        remainingBalance: 200000,
        description: "Outcome",
        isIncome: false);
    transasctions.insert(0, transaction3);
    transasctions.insert(1, transaction2);
    transasctions.insert(2, transaction1);

    emit(state.copyWith(transactionList: transasctions));
  }

  Future<void> initUser({required BuildContext context}) async {
    UserModel user = const UserModel(
        id: 0,
        createdDate: "2023.10.25",
        remainingBalance: 200000,
        accountNo: "**** **** **** 1555");
    emit(state.copyWith(userLogged: user));
  }

  Future<void> sendInvoice({required int invoiceAmount}) async {
    UserModel temp = UserModel(
        id: state.userLogged.id,
        createdDate: state.userLogged.createdDate,
        remainingBalance: state.userLogged.remainingBalance + invoiceAmount,
        accountNo: state.userLogged.accountNo);
    TransactionModel transferTransaction = TransactionModel(
        id: 1,
        createdDate: "2023.11.09",
        transactionAmount: invoiceAmount,
        remainingBalance: temp.remainingBalance,
        description: "Income",
        isIncome: true);
    List<TransactionModel> transactions = [];
    transactions = [transferTransaction, ...state.transactionList];
    for (var item in state.transactionList) {
      transactions.add(item);
    }
    emit(state.copyWith(
        userLogged: temp,
        currentState: BottomSectionState.isSuccessful,
        transactionList: transactions));
  }

  Future<void> getTransfer({required int transferAmount}) async {
    if (state.userLogged.remainingBalance >= transferAmount) {
      UserModel temp = UserModel(
          id: state.userLogged.id,
          createdDate: state.userLogged.createdDate,
          remainingBalance: state.userLogged.remainingBalance - transferAmount,
          accountNo: state.userLogged.accountNo);
      TransactionModel transferTransaction = TransactionModel(
          id: 1,
          createdDate: "2023.11.09",
          transactionAmount: transferAmount,
          remainingBalance: temp.remainingBalance,
          description: "Outcome",
          isIncome: false);
      List<TransactionModel> transactions = [];
      transactions = [transferTransaction, ...state.transactionList];
      emit(state.copyWith(
          userLogged: temp,
          currentState: BottomSectionState.isSuccessful,
          transactionList: transactions));
    } else {
      emit(state.copyWith(currentState: BottomSectionState.isFailed));
    }
  }

  Future<void> waitForScan(
      {required int amount, required bool isInvoice}) async {
    if (isInvoice) {
      await sendInvoice(invoiceAmount: amount);
    } else {
      await getTransfer(transferAmount: amount);
    }
  }

  Future<void> finishTransaction() async {
    emit(state.copyWith(currentState: BottomSectionState.isDefault));
  }

  // Future<void> tagRead(
  //     {required BuildContext context,
  //     required int amount,
  //     required bool isInvoice}) async {
  // emit(state.copyWith(currentState: BottomSectionState.isScanning));

  //   await context.router.pop();
  //   await Future.delayed(const Duration(seconds: 2));
  //   await waitForScan(amount: amount, isInvoice: isInvoice);
  // }

  Future<void> checkInvoiceStatus() async {}

  Future<void> createInvoice(
      {required BuildContext context,
      required int amount,
      required bool isInvoice}) async {
    String invoiceId = await createUserInvoice(amount);
    print('invoiceId: $invoiceId');
    Map<String, dynamic>? sda = await getInvoiceById(invoiceId);
    print(sda);
    // emit(state.copyWith(currentState: BottomSectionState.isScanning));
    // await context.router.pop();
    // await Future.delayed(const Duration(seconds: 2));
    // await waitForScan(amount: amount, isInvoice: isInvoice);
    if (isInvoice) {
      //TODO: Creating invoice to Me
    } else {
      //TODO: Creating invoice from Me
    }
    createNfcWithInvoiceId(context: context, invoiceId: amount.toString());
  }

  Future<void> getInvoiceWithInvoiceId(
      {required BuildContext context, required String invoiceId}) async {
    //TODO: Get invoice with Invoice id
    dialogConfirmPin(context, "amount", "name", "cardID", (pinCode) {
      doTransaction(context: context);
    });
  }

  Future<void> doTransaction({required BuildContext context}) async {}

  void createNfcWithInvoiceId(
      {required BuildContext context, required String invoiceId}) async {
    // context.router.pop();
    emit(state.copyWith(currentState: BottomSectionState.isScanning));

    var content = invoiceId;
    var result = await flutterNfcHcePlugin.startNfcHce(content);
    // if (result != null) {
    //   emit(state.copyWith(currentState: BottomSectionState.isWaiting));
    // }
  }

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
        getInvoiceWithInvoiceId(context: context, invoiceId: invoiceId);
      }
    });
  }
}
