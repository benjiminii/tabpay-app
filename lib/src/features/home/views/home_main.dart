import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/src/features/home/views/widgets/card_widget.dart';
import 'package:tabpay_app/src/features/home/views/widgets/statement_widget.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';

@RoutePage()
class HomeMainPage extends StatefulWidget {
  const HomeMainPage({Key? key}) : super(key: key);

  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
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
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: Container(
                  color: HexColor("#4CAA9C"),
                )),
                Expanded(
                    child: Container(
                  color: Colors.white,
                ))
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Assets.images.home.moreGridIcon.path,
                        height: 40,
                        width: 40,
                      ),
                      textLabel(value: "Virtual Card", fontSize: 23),
                      Image.asset(
                        Assets.images.home.profileAvatarIcon.path,
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: VirtualCardWidget(),
                ),
                const TransactionsWidget(),
                Container(
                  color: Colors.white,
                  // width: ,
                  // width: size.width,
                  child: Container(
                    child: ClipOval(
                      // borderRadius: BorderRadius.circular(100),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: HexColor("#4CAA9C"),
                        child: Image.asset(
                          Assets.images.home.nfcIcon.path,
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        // child: Expanded(child: Container()),
      ),
    );
  }
}
