// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:tabpay_app/src/features/home/views/home_main.dart' as _i2;
import 'package:tabpay_app/src/features/intro/views/intro_main.dart' as _i3;
import 'package:tabpay_app/src/features/login/views/login_main.dart' as _i4;
import 'package:tabpay_app/src/features/login/views/login_route_wrapper.dart'
    as _i5;
import 'package:tabpay_app/src/features/login/views/login_verification.dart'
    as _i6;
import 'package:tabpay_app/tabpay_core/common/pages/otp.dart' as _i1;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.OtpPage(
          key: args.key,
          title: args.title,
          subtitle: args.subtitle,
          pin: args.pin,
          onTap: args.onTap,
        ),
      );
    },
    HomeMainRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeMainPage(),
      );
    },
    InstructionRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.InstructionPage(),
      );
    },
    LoginMainRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginMainPage(),
      );
    },
    LoginRouteWrapper.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginRouteWrapper(),
      );
    },
    LoginVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<LoginVerificationRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LoginVerificationPage(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.OtpPage]
class OtpRoute extends _i7.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i8.Key? key,
    required String title,
    required String subtitle,
    required String pin,
    required dynamic Function() onTap,
    List<_i7.PageRouteInfo>? children,
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

  static const _i7.PageInfo<OtpRouteArgs> page =
      _i7.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.title,
    required this.subtitle,
    required this.pin,
    required this.onTap,
  });

  final _i8.Key? key;

  final String title;

  final String subtitle;

  final String pin;

  final dynamic Function() onTap;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, title: $title, subtitle: $subtitle, pin: $pin, onTap: $onTap}';
  }
}

/// generated route for
/// [_i2.HomeMainPage]
class HomeMainRoute extends _i7.PageRouteInfo<void> {
  const HomeMainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeMainRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.InstructionPage]
class InstructionRoute extends _i7.PageRouteInfo<void> {
  const InstructionRoute({List<_i7.PageRouteInfo>? children})
      : super(
          InstructionRoute.name,
          initialChildren: children,
        );

  static const String name = 'InstructionRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginMainPage]
class LoginMainRoute extends _i7.PageRouteInfo<void> {
  const LoginMainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginMainRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginRouteWrapper]
class LoginRouteWrapper extends _i7.PageRouteInfo<void> {
  const LoginRouteWrapper({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRouteWrapper.name,
          initialChildren: children,
        );

  static const String name = 'LoginRouteWrapper';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginVerificationPage]
class LoginVerificationRoute
    extends _i7.PageRouteInfo<LoginVerificationRouteArgs> {
  LoginVerificationRoute({
    _i8.Key? key,
    required String phoneNumber,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LoginVerificationRoute.name,
          args: LoginVerificationRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginVerificationRoute';

  static const _i7.PageInfo<LoginVerificationRouteArgs> page =
      _i7.PageInfo<LoginVerificationRouteArgs>(name);
}

class LoginVerificationRouteArgs {
  const LoginVerificationRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i8.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'LoginVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}
