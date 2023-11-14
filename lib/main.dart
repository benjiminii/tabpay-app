import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tabpay_app/src/features/home/cubit/home_cubit.dart';
import 'package:tabpay_app/src/features/login/cubit/login_cubit.dart';
import 'package:tabpay_app/src/routes/app_router.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';
import 'package:auto_route/auto_route.dart';

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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => HomeCubit()),
            BlocProvider(create: (_) => LoginCubit()),
          ],
          child: MaterialApp.router(
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
              return Scaffold(body: child!);
            },
          ),
        );
      },
    );
  }
}
