import 'package:flutter/material.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';

class TransactionsWidget extends StatefulWidget {
  const TransactionsWidget({Key? key}) : super(key: key);

  @override
  _TransactionsWidgetState createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<TransactionsWidget> {
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
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14), topRight: Radius.circular(14)),
            border: Border.all(color: Colors.black, width: 1),
            color: Colors.white,
          ),
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
                        border:
                            Border.all(color: HexColor("#4DAA9C"), width: 1),
                        color: HexColor("#4DAA9C"),
                      ),
                      child: textLabel(value: "Recent", fontSize: 11),
                    )
                  ],
                ),
              ),
              const Divider(color: Colors.grey),
              statementItem(),
            ],
          )),
    );
  }
}

Widget statementItem() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: textLabel(value: "2023.10.28"),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Assets.images.home.transactionOutgoing.path,
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textLabel(value: "Гүйлгээний хураамж"),
                textLabel(value: "Үлд: 200,000.00"),
              ],
            ),
            const Spacer(),
            textLabel(value: "-50", fontSize: 20, maxLine: 1),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const Divider(color: Colors.grey),
    ],
  );
}
