import 'package:marketmind/core/export/export.core.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      this.onPressed,
      this.text,
      this.textColor,
      this.child,
      this.removeBorder = false,
      this.width,
      this.height,
      this.textStyle,
      this.iconStart,
      this.iconEnd,
        this.enableFeedback=true,
      this.color});

  final VoidCallback? onPressed;
  final Widget? child;

  final Color? textColor;
  final String? text;
  final double? height;
  final double? width;
  final Widget? iconStart;
  final Widget? iconEnd;
  final bool enableFeedback;
  final bool removeBorder;
  final Color? color;
  final TextStyle? textStyle;

  factory PrimaryButton.state(
      {String? text,
      VoidCallback? onPressed,
      bool active = false,
      double? height}) {
    if (!active) {
      return PrimaryButton.outlined(
        text: text,
        height: height,
        onPressed: onPressed,
      );
    }
    return PrimaryButton.primary(
      text: text,
      onPressed: onPressed,
    );
  }

  factory PrimaryButton.back(BuildContext context) => PrimaryButton.outlined(
        text: 'Back',
        enableFeedback: false,
        iconStart: const Icon(
          Icons.keyboard_arrow_left,
        ),
        onPressed: context.pop,
      );

  factory PrimaryButton.outlined(
          {String? text,
          Widget? child,
          TextStyle? textStyle,
          Color? backgroundColor,
          Color? textColor,
            bool enableFeedback=false,
          Widget? iconStart,
          Widget? iconEnd,
          double? height,
          VoidCallback? onPressed}) =>
      PrimaryButton(
        color: backgroundColor ?? AppColors.transparent,
        textStyle: textStyle,
        iconEnd: iconEnd,
        enableFeedback: enableFeedback,
        iconStart: iconStart,
        height: height,
        textColor: textColor ?? AppColors.textBlack,
        onPressed: onPressed,
        text: text,
      );

  factory PrimaryButton.primary({
    String? text,
    Widget? icon,
    Widget? child,
    Widget? iconEnd,
    double? height,
    VoidCallback? onPressed,
    bool enabled=true,
  }) =>
      PrimaryButton(
        color: enabled?AppColors.blue:AppColors.disabledButtonColor,
        textColor: AppColors.white,
        height: height,
        iconStart: icon,
        removeBorder: true,
        onPressed: onPressed,
        iconEnd: iconEnd,
        text: text,
      );

  factory PrimaryButton.minDark({
    String? text,
    Widget? child,
    double? height,
    Widget? iconEnd,
    double? width,
    Widget? icon,
    VoidCallback? onPressed,
  }) =>
      PrimaryButton(
        color: AppColors.black,
        textColor: AppColors.white,
        height: height ?? Dimens.buttonHeightMin,
        removeBorder: true,
        iconEnd: iconEnd,
        width: width,
        iconStart: icon,
        onPressed: onPressed,
        text: text,
        child: child,
      );

  factory PrimaryButton.light({
    String? text,
    Widget? child,
    VoidCallback? onPressed,
    Widget? icon,
    Widget? iconEnd,
    double? height,
    double? width,
  }) =>
      PrimaryButton(
        color: AppColors.white,
        iconStart: icon,
        height: height,
        width: width,
        iconEnd: iconEnd,
        textColor: AppColors.black,
        onPressed: onPressed,
        text: text,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed?.call();
      },
      height: height ?? Dimens.buttonHeight,
      minWidth: width ?? double.infinity,
      disabledColor: color ?? AppColors.transparent,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      padding: const EdgeInsets.symmetric(vertical: Dimens.buttonPadding),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.buttonRadius),
          borderSide: removeBorder
              ? BorderSide.none
              : BorderSide(
                  color: AppColors.textGray.withOpacity(.6), width: 1.5)),
      color: color ?? AppColors.white,
      enableFeedback: enableFeedback,
      child: child ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconStart != null) ...[iconStart!, 10.horizontalSpace],
              Text(
                text ?? '',
                style: textStyle ??
                    context.textTheme.titleSmall?.copyWith(
                        color: textColor ?? Colors.black),
              ),
              if (iconEnd != null) ...[10.horizontalSpace, iconEnd!]
            ],
          ),
    );
  }
}
