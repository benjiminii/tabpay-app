// import 'auth_guard.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tabpay_app/src/routes/app_router.gr.dart';

// import 'package:monpayapp/src/features/_common/common_pages.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    // AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: InstructionRoute.page, initial: true),
    AutoRoute(page: OtpRoute.page, path: '/otp'),
    AutoRoute(path: "/login", page: LoginRouteWrapper.page, children: [
      AutoRoute(
        page: LoginMainRoute.page,
        path: 'main',
      ),
      AutoRoute(page: LoginVerificationRoute.page, path: 'verification'),
      redirectToInitialRoute
    ]),
    AutoRoute(page: HomeMainRoute.page, path: '/home'),
    AutoRoute(page: NumpadRoute.page, path: '/numpad'),
  ];
}

final redirectToInitialRoute = RedirectRoute(
  path: '*',
  redirectTo: '',
);
