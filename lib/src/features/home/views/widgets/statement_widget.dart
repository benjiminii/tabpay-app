import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/src/features/home/cubit/home_cubit.dart';
import 'package:tabpay_app/tabpay_core/models/home_repository/_responses.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';

class TransactionsWidget extends StatefulWidget {
  const TransactionsWidget({Key? key}) : super(key: key);

  @override
  TransactionsWidgetState createState() => TransactionsWidgetState();
}

class TransactionsWidgetState extends State<TransactionsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Expanded(
          child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14)),
                // border: Border.all(color: HexColor("#4DAA9C"), width: 1),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 20, 28, 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          textLabel(value: "Transactions", fontSize: 20),
                          const Spacer(),
                          textLabel(value: "Sort by"),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                  color: HexColor("#4DAA9C"), width: 1),
                              color: HexColor("#4DAA9C"),
                            ),
                            child: textLabel(value: "Recent", fontSize: 11),
                          )
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    ...state.transactionList.map((transactionItem) {
                      return statementItem(
                          isIncome: transactionItem.isIncome,
                          item: transactionItem);
                    }),
                  ],
                ),
              )),
        );
      },
    );
  }
}

Widget statementItem({required bool isIncome, required TransactionModel item}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: textLabel(value: item.createdDate),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isIncome
                ? Image.asset(
                    Assets.images.home.transactionIncoming.path,
                    height: 40,
                    width: 40,
                  )
                : Image.asset(
                    Assets.images.home.transactionOutgoing.path,
                    height: 40,
                    width: 40,
                  ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textLabel(value: item.description),
                textLabel(value: "Balance: ${item.remainingBalance.toMoney()}"),
              ],
            ),
            const Spacer(),
            textLabel(
                value: isIncome
                    ? item.transactionAmount.toMoney()
                    : "-${item.transactionAmount.toMoney()}",
                fontSize: 20,
                maxLine: 1,
                color: isIncome ? Colors.green : Colors.red),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const Divider(color: Colors.grey),
    ],
  );
}

class SuccessfulWidget extends StatelessWidget {
  const SuccessfulWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: size.width,
          padding: const EdgeInsets.fromLTRB(28, 45, 28, 45),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14), topRight: Radius.circular(14)),
            border: Border.all(color: HexColor("#4DAA9C"), width: 1),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textLabel(value: "Successful", fontSize: 20),
              Image.asset(
                Assets.images.home.successIcon.path,
                height: 200,
                width: 200,
              ),
              SizedBox(
                width: 200,
                child: defaultButton(
                    isEnabled: true,
                    fillColor: HexColor("#04715E"),
                    buttonBorderColor: HexColor("#04715E"),
                    buttonTextColor: Colors.white,
                    buttonLabel: "End",
                    onTap: () {
                      context.read<HomeCubit>().finishTransaction(context);
                    }),
              ),
            ],
          )),
    );
  }
}

class FailedWidget extends StatelessWidget {
  const FailedWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: size.width,
          padding: const EdgeInsets.fromLTRB(28, 45, 28, 45),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14), topRight: Radius.circular(14)),
            border: Border.all(color: HexColor("#4DAA9C"), width: 1),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textLabel(value: "Failed", fontSize: 20),
              Image.asset(
                Assets.images.home.failedIcon.path,
                height: 200,
                width: 200,
              ),
              SizedBox(
                width: 200,
                child: defaultButton(
                    isEnabled: true,
                    fillColor: HexColor("#04715E"),
                    buttonBorderColor: HexColor("#04715E"),
                    buttonTextColor: Colors.white,
                    buttonLabel: "End",
                    onTap: () {
                      context.read<HomeCubit>().finishTransaction(context);
                    }),
              ),
            ],
          )),
    );
  }
}

class ScanningWidget extends StatelessWidget {
  const ScanningWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: size.width,
          padding: const EdgeInsets.fromLTRB(28, 45, 28, 45),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14), topRight: Radius.circular(14)),
            border: Border.all(color: HexColor("#4DAA9C"), width: 1),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textLabel(value: "Ready to Scan", fontSize: 20),
              Image.asset(
                Assets.images.home.nfcScan.path,
                height: 200,
                width: 200,
              ),
              SizedBox(
                width: 200,
                child: defaultButton(
                    isEnabled: true,
                    fillColor: Colors.grey,
                    buttonBorderColor: Colors.grey,
                    buttonTextColor: Colors.black,
                    buttonLabel: "Cancel",
                    onTap: () {
                      context.read<HomeCubit>().finishTransaction(context);
                    }),
              ),
            ],
          )),
    );
  }
}
