
import 'package:marketmind/core/export/export.core.dart';
import 'package:flutter/material.dart';

import '../../dimen/dimens.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold(
      {super.key,
      required this.child,
      this.horizontalPadding = Dimens.pagePadding,
      this.verticalPadding,
        this.appBar,
        this.bottomWidget,
      this.backgroundColor});

  final Widget child;
  final Color? backgroundColor;
  final double horizontalPadding;
  final AppBar? appBar;
  final Widget? bottomWidget;
  final double? verticalPadding;

  factory BaseScaffold.dark(
          {required Widget child,
          double horizontalPadding = Dimens.pagePadding,
          double? verticalPadding}) =>
      BaseScaffold(
        verticalPadding: verticalPadding,
        backgroundColor: AppColors.black,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor??AppColors.white,
      appBar: appBar,
      bottomNavigationBar: bottomWidget,
      body: PagePadding(
        verticalPadding: verticalPadding ?? 0,
        horizontalPadding: horizontalPadding,
        child: child,
      ),
    );
  }
}
