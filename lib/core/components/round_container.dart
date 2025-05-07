
import 'package:marketmind/core/export/export.core.dart';
import 'package:flutter/material.dart';

class WrapperContainer extends StatelessWidget {
  const WrapperContainer(
      {super.key,
      this.width,
      this.height,
      this.backgroundColor,
      this.borderColor,
      required this.child,
      this.padding,
      this.shape,
      this.onClick,
      this.circle = true,
      this.bordered = true});

  final double? width;
  final double? height;
  final bool circle;
  final Widget child;
  final bool bordered;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onClick;
  final EdgeInsets? padding;
  final ShapeBorder? shape;

  factory WrapperContainer.rectangular(
      {EdgeInsets? padding,
      VoidCallback? onClick,
      Color? backgroundColor,
      bool bordered = true,
      Color? borderColor,
      double? height,
      double? width,
      required Widget child}) {
    var side = bordered
        ? BorderSide(color: borderColor ?? AppColors.borderColor, width: 1)
        : BorderSide.none;
    return WrapperContainer(
      padding: padding,
      onClick: onClick,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      bordered: bordered,
      height: height,
      width: width,
      shape: RoundedRectangleBorder(
          side: side,
          borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var side = bordered
        ? BorderSide(color: borderColor ?? AppColors.borderColor, width: 1)
        : BorderSide.none;
    return InkWell(
      onTap: onClick,
      customBorder: shape ?? const CircleBorder(),
      child: Container(
        width: width ?? 120,
        height: height ?? 120,
        alignment: Alignment.center,
        padding: padding,
        decoration: ShapeDecoration(
            color: backgroundColor, shape: shape ?? CircleBorder(side: side)),
        child: Align(
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
