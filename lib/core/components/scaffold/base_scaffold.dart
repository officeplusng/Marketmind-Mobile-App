import 'package:marketmind/core/export/export.core.dart';
import 'package:flutter/material.dart';
import 'package:marketmind/features/_shared/presentation/loading_overlay.dart';

import '../../dimen/dimens.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold(
      {super.key,
      required this.child,
      this.horizontalPadding = Dimens.pagePadding,
      this.verticalPadding,
      this.appBar,
      this.bottomWidget,
      this.isLoading = false,
      this.backgroundColor});

  final Widget child;
  final Color? backgroundColor;
  final double horizontalPadding;
  final bool isLoading;
  final AppBar? appBar;
  final Widget? bottomWidget;
  final double? verticalPadding;

  factory BaseScaffold.dark(
          {required Widget child,
          double horizontalPadding = Dimens.pagePadding,
          bool isLoading = false,
          double? verticalPadding}) =>
      BaseScaffold(
        verticalPadding: verticalPadding,
        isLoading: isLoading,
        backgroundColor: AppColors.black,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      appBar: appBar,
      bottomNavigationBar: bottomWidget,
      body: LoadingOverlay(
          color: AppColors.black,
          opacity: .2,
          progressIndicator: const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              color: AppColors.white,
            ),
          ),
          isLoading: isLoading,
          child: PagePadding(
            verticalPadding: verticalPadding ?? 0,
            horizontalPadding: horizontalPadding,
            child: child,
          )),
    );
  }
}
