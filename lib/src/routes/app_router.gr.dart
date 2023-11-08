// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:tabpay_app/src/features/home/views/home_main.dart' as _i1;
import 'package:tabpay_app/src/features/intro/views/intro_main.dart' as _i2;
import 'package:tabpay_app/src/features/login/views/login_main.dart' as _i3;
import 'package:tabpay_app/src/features/login/views/login_route_wrapper.dart'
    as _i4;
import 'package:tabpay_app/src/features/login/views/login_verification.dart'
    as _i5;
import 'package:tabpay_app/tabpay_core/common/pages/numpad_page.dart' as _i6;
import 'package:tabpay_app/tabpay_core/common/pages/pin_creation_page.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HomeMainRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeMainPage(),
      );
    },
    InstructionRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.InstructionPage(),
      );
    },
    LoginMainRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginMainPage(),
      );
    },
    LoginRouteWrapper.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginRouteWrapper(),
      );
    },
    LoginVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<LoginVerificationRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginVerificationPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    NumpadRoute.name: (routeData) {
      final args = routeData.argsAs<NumpadRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.NumpadPage(
          key: args.key,
          onTap: args.onTap,
          onTap2: args.onTap2,
          topButtonTitle: args.topButtonTitle,
          bottomButtonTitle: args.bottomButtonTitle,
          pageTitle: args.pageTitle,
        ),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.OtpPage(
          key: args.key,
          title: args.title,
          subtitle: args.subtitle,
          pin: args.pin,
          onTap: args.onTap,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeMainPage]
class HomeMainRoute extends _i8.PageRouteInfo<void> {
  const HomeMainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeMainRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InstructionPage]
class InstructionRoute extends _i8.PageRouteInfo<void> {
  const InstructionRoute({List<_i8.PageRouteInfo>? children})
      : super(
          InstructionRoute.name,
          initialChildren: children,
        );

  static const String name = 'InstructionRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginMainPage]
class LoginMainRoute extends _i8.PageRouteInfo<void> {
  const LoginMainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginMainRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginRouteWrapper]
class LoginRouteWrapper extends _i8.PageRouteInfo<void> {
  const LoginRouteWrapper({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'LoginRouteWrapper';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginVerificationPage]
class LoginVerificationRoute
    extends _i8.PageRouteInfo<LoginVerificationRouteArgs> {
  LoginVerificationRoute({
    _i9.Key? key,
    required String phoneNumber,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          LoginVerificationRoute.name,
          args: LoginVerificationRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginVerificationRoute';

  static const _i8.PageInfo<LoginVerificationRouteArgs> page =
      _i8.PageInfo<LoginVerificationRouteArgs>(name);
}

class LoginVerificationRouteArgs {
  const LoginVerificationRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i9.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'LoginVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i6.NumpadPage]
class NumpadRoute extends _i8.PageRouteInfo<NumpadRouteArgs> {
  NumpadRoute({
    _i9.Key? key,
    required dynamic Function(int) onTap,
    required dynamic Function(int) onTap2,
    required String topButtonTitle,
    required String bottomButtonTitle,
    required String pageTitle,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          NumpadRoute.name,
          args: NumpadRouteArgs(
            key: key,
            onTap: onTap,
            onTap2: onTap2,
            topButtonTitle: topButtonTitle,
            bottomButtonTitle: bottomButtonTitle,
            pageTitle: pageTitle,
          ),
          initialChildren: children,
        );

  static const String name = 'NumpadRoute';

  static const _i8.PageInfo<NumpadRouteArgs> page =
      _i8.PageInfo<NumpadRouteArgs>(name);
}

class NumpadRouteArgs {
  const NumpadRouteArgs({
    this.key,
    required this.onTap,
    required this.onTap2,
    required this.topButtonTitle,
    required this.bottomButtonTitle,
    required this.pageTitle,
  });

  final _i9.Key? key;

  final dynamic Function(int) onTap;

  final dynamic Function(int) onTap2;

  final String topButtonTitle;

  final String bottomButtonTitle;

  final String pageTitle;

  @override
  String toString() {
    return 'NumpadRouteArgs{key: $key, onTap: $onTap, onTap2: $onTap2, topButtonTitle: $topButtonTitle, bottomButtonTitle: $bottomButtonTitle, pageTitle: $pageTitle}';
  }
}

/// generated route for
/// [_i7.OtpPage]
class OtpRoute extends _i8.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i9.Key? key,
    required String title,
    required String subtitle,
    required String pin,
    required dynamic Function() onTap,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            title: title,
            subtitle: subtitle,
            pin: pin,
            onTap: onTap,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i8.PageInfo<OtpRouteArgs> page =
      _i8.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.title,
    required this.subtitle,
    required this.pin,
    required this.onTap,
  });

  final _i9.Key? key;

  final String title;

  final String subtitle;

  final String pin;

  final dynamic Function() onTap;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, title: $title, subtitle: $subtitle, pin: $pin, onTap: $onTap}';
  }
}
