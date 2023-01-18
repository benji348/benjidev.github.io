// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ScreenHelper extends StatelessWidget {
  const ScreenHelper({Key? key, this.mobile, this.desktop, this.tablet})
      : super(key: key);

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  static bool isMobile(
    BuildContext context,
  ) =>
      MediaQuery.of(context).size.width < 800.0;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800.0 &&
      MediaQuery.of(context).size.width < 1200.0;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        if (boxConstraints.maxWidth >= 1200.0) {
          return desktop!;
        } else if (boxConstraints.maxWidth >= 800.0 &&
            boxConstraints.maxWidth < 1200.0) {
          return tablet!;
        } else {
          return mobile!;
        }
      },
    );
  }
}
