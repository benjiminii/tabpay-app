import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

typedef LoginRouteCallback = void Function(bool);

@RoutePage()
class LoginRouteWrapper extends StatelessWidget {
  const LoginRouteWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
