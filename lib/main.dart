import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tabpay_app/src/features/home/home.dart';
import 'package:tabpay_app/src/features/home/views/widgets/card_widget.dart';
import 'package:tabpay_app/src/features/home/views/widgets/statement_widget.dart';
import 'package:tabpay_app/src/routes/app_router.dart';
// import 'package:tabpay_app/src/features/login/views.dart';
// import 'package:tabpay_app/tabpay_core/common/pages/loan_numpad.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tabpay_app/src/routes/app_router.gr.dart';

void main() {
  runApp(MyApp());
}

class CustomRouteObserver extends AutoRouterObserver {
  BuildContext context;
  CustomRouteObserver(this.context);

  // only override to observer tab routes

  @override
  void didPop(Route route, Route? previousRoute) {
    // if (previousRoute?.settings.name == 'HomeRoute' &&
    //     route.settings.name != null) {
    //   context.read<AppCubit>().homeReload(context: context);
    // } else if (previousRoute?.settings.name == 'HomeRoute' &&
    //     route.settings.name == null) {
    //   if (SharedParameter.isHomeReload) {
    //     context.read<AppCubit>().homeReload(context: context);
    //   }
    // }
    super.didPop(route, previousRoute);
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          key: AppService.navigationKey,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: AutoRouterDelegate(
            _appRouter,
            // this should always return new instances

            navigatorObservers: () =>
                [AutoRouteObserver(), CustomRouteObserver(context)],
          ),
          // theme: appThemeData[states.theme]!.themeData,
          builder: (context, child) {
            return child!;
          },
        );
        // MaterialApp(
        //   title: 'Flutter Demo',
        //   theme: ThemeData(
        //     // This is the theme of your application.
        //     //
        //     // TRY THIS: Try running your application with "flutter run". You'll see
        //     // the application has a blue toolbar. Then, without quitting the app,
        //     // try changing the seedColor in the colorScheme below to Colors.green
        //     // and then invoke "hot reload" (save your changes or press the "hot
        //     // reload" button in a Flutter-supported IDE, or press "r" if you used
        //     // the command line to start the app).
        //     //
        //     // Notice that the counter didn't reset back to zero; the application
        //     // state is not lost during the reload. To reset the state, use hot
        //     // restart instead.
        //     //
        //     // This works for code too, not just values: Most code changes can be
        //     // tested with just a hot reload.
        //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //     useMaterial3: true,
        //   ),
        //   home: const MyHomePage(
        //     title: "HELLO",
        //   ),
        //   // OtpPage(
        //   //     title: "Create transaction PIN",
        //   //     subtitle: "",
        //   //     pin: "",
        //   //     onTap: () {})
        //   // const LoginVerificationPage(
        //   //   phoneNumber: "99775136",
        //   // ),
        //   // NumpadPage(
        //   //     onTap: (hello) {},
        //   //     topButtonTitle: "topButtonTitle",
        //   //     bottomButtonTitle: "bottomButtonTitle",
        //   //     pageTitle: "pageTitle")
        //   // const MyHomePage(title: 'Flutter Demo Home Page'),
        // );
      },
    );
  }
}
