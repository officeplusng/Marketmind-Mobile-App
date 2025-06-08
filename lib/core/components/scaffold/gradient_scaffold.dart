import 'package:flutter/material.dart';

import '../../export/export.core.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold(
      {super.key,
      required this.child,
      this.horizontalPadding = Dimens.pagePadding,
      this.verticalPadding,
      this.appBar,
      this.bottomWidget,
      required this.backgroundAsset,
      this.backgroundColor});

  final Widget child;
  final Color? backgroundColor;
  final double horizontalPadding;
  final AppBar? appBar;
  final Widget? bottomWidget;
  final double? verticalPadding;

  final String backgroundAsset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor ?? AppColors.white,
        appBar: appBar,
        bottomNavigationBar: bottomWidget,
        body: Stack(
          children: [
            Image.asset(
              backgroundAsset,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            SafeArea(
                child: PagePadding(
              verticalPadding: verticalPadding ?? 0,
              horizontalPadding: horizontalPadding,
              child: child,
            )),
          ],
        ));
  }
}
