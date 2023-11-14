import 'package:auto_route/auto_route.dart';
// import 'package:monpayapp/src/tabpay_core/monpay_sdk/monpay_sdk.dart';

// import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // if (!SharedPrefs().isAuth) {
    //   // router.push(AuthRouteWrapper(onAuthResult: resolver.next));
    //   router.push(AuthRouteWrapper(
    //       children: const [SignInRoute()], onAuthResult: resolver.next));
    // } else {
    resolver.next(true);
    // }
  }
}
