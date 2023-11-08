import 'package:flutter/material.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/tabpay_core/models/home_repository/_responses.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';

class VirtualCardWidget extends StatelessWidget {
  final UserModel user;
  const VirtualCardWidget({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: HexColor("#04715E")),
          color: HexColor("#04715E")),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textLabel(
                    value: user.accountNo,
                    fontSize: 20,
                    maxLine: 1,
                    color: Colors.white),
                Image.asset(
                  Assets.images.home.visaLogo.path,
                  // height: 60,
                  fit: BoxFit.contain,
                )
              ],
            ),
            const Spacer(),
            textLabel(
              align: TextAlign.left,
              fontSize: 18,
              value: "Balance",
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            textLabel(
              align: TextAlign.left,
              fontSize: 18,
              value: user.remainingBalance.toMoney(),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
