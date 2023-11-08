// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';

class AppbarContainer extends StatelessWidget {
  Widget child;
  String title;
  Function? onTap;
  List<Widget>? actions;
  bool? isFixedBtn = false;
  double line;
  bool? isMiniApp = false;
  bool? isWhite = false;
  AppbarContainer(
      {Key? key,
      required this.child,
      required this.title,
      this.onTap,
      this.actions,
      this.isFixedBtn,
      this.line = 1.0,
      this.isMiniApp,
      this.isWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onTap != null) {
          onTap!();
        }
        if (isMiniApp == false) {
          context.router.pop();
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: isFixedBtn,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70,
          primary: true,
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.white,
          foregroundColor: Colors.white,
          actions: actions,
          leading: InkWell(
            key: const Key("app_bar_back_button"),
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
              if (isMiniApp == false || isMiniApp == null) {
                context.router.pop();
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SvgPicture.asset(
                Assets.images.numpad.arrowLeft.path,
                // fit: BoxFit.fill,
                color: Colors.black,
                fit: BoxFit.scaleDown,
                // width: 10,
                // height: 10,
              ),
            ),
          ),
          title: textLabel(value: title, color: Colors.black),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey,
              width: size.width,
              height: line,
            ),
          ),
        ),
        body: Container(color: Colors.black, child: child),
      ),
    );
  }
}
