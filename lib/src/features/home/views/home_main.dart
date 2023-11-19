import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/src/features/home/cubit/home_cubit.dart';
import 'package:tabpay_app/src/features/home/views/widgets/card_widget.dart';
import 'package:tabpay_app/src/features/home/views/widgets/statement_widget.dart';
import 'package:tabpay_app/src/routes/app_router.gr.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';

@RoutePage()
class HomeMainPage extends StatefulWidget {
  const HomeMainPage({Key? key}) : super(key: key);

  @override
  HomeMainPageState createState() => HomeMainPageState();
}

class HomeMainPageState extends State<HomeMainPage> {
  @override
  void initState() {
    context.read<HomeCubit>().getNfcRelatedInfo();
    context.read<HomeCubit>().initUser(context: context);
    context.read<HomeCubit>().initTransactions(context: context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SizedBox(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      child: VirtualCardWidget(user: state.userLogged),
                    ),
                    if (state.currentState == BottomSectionState.isDefault)
                      const TransactionsWidget(),
                    if (state.currentState == BottomSectionState.isSuccessful)
                      const SuccessfulWidget(),
                    if (state.currentState == BottomSectionState.isFailed)
                      const FailedWidget(),
                    if (state.currentState == BottomSectionState.isScanning)
                      const ScanningWidget(),
                    if (state.currentState == BottomSectionState.isDefault)
                      SizedBox(
                        child: InkWell(
                          onTap: () {
                            context.router.push(NumpadRoute(
                                onTap: (amount) {
                                  context.read<HomeCubit>().createInvoice(
                                      context: context,
                                      amount: amount,
                                      isInvoice: false);
                                },
                                onTap2: (amount) {
                                  context.read<HomeCubit>().createInvoice(
                                      context: context,
                                      amount: amount,
                                      isInvoice: true);
                                },
                                topButtonTitle: "Send",
                                bottomButtonTitle: "Invoice",
                                pageTitle: "Transfer"));
                          },
                          child: ClipOval(
                            // borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: 80,
                              width: 80,
                              padding: const EdgeInsets.all(10),
                              color: HexColor("#4CAA9C"),
                              child: Image.asset(
                                Assets.images.home.nfcIcon.path,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            // child: Expanded(child: Container()),
          );
        },
      ),
    );
  }
}
