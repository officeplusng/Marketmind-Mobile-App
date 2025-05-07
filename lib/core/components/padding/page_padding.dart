
import 'package:marketmind/core/export/export.core.dart';
import 'package:flutter/cupertino.dart';

class PagePadding extends StatelessWidget {
  const PagePadding(
      {super.key,
      required this.child,
      this.horizontalPadding = Dimens.pagePadding,
      this.verticalPadding = 0});

  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: child,
    );
  }
}
