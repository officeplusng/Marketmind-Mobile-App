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
      this.color});

  final VoidCallback? onPressed;
  final Widget? child;

  final Color? textColor;
  final String? text;
  final double? height;
  final double? width;
  final bool removeBorder;
  final Color? color;
  final TextStyle? textStyle;

  factory PrimaryButton.state(
      {String? text, VoidCallback? onPressed,  bool active=false,double? height}) {
    if (!active) {
      return PrimaryButton.outlined(
        text: text,
        height: height,
        onPressed: onPressed,
      );
    }
    return PrimaryButton.dark(
      text: text,
      onPressed: onPressed,
    );
  }

  factory PrimaryButton.outlined(
          {String? text,
          Widget? child,
          TextStyle? textStyle,
            Color? backgroundColor,
          Color? textColor,
            double? height,
          VoidCallback? onPressed}) =>
      PrimaryButton(
        color:backgroundColor?? AppColors.transparent,
        textStyle: textStyle,

        height: height,

        textColor: textColor ?? AppColors.textBlack,
        onPressed: onPressed,
        text: text,
      );


  factory PrimaryButton.dark({
    String? text,
    Widget? child,
    double? height,
    VoidCallback? onPressed,
  }) =>
      PrimaryButton(
        color: AppColors.black,
        textColor: AppColors.white,
        height: height,
        removeBorder: true,
        onPressed: onPressed,
        text: text,
      );
  factory PrimaryButton.minDark({
    String? text,
    Widget? child,
    double? height,
    double? width,
    VoidCallback? onPressed,
  }) =>
      PrimaryButton(
        color: AppColors.black,
        textColor: AppColors.white,
        height: height??Dimens.buttonHeightMin,
        removeBorder: true,
        width: width,
        child: child,
        onPressed: onPressed,
        text: text,
      );

  factory PrimaryButton.light({
    String? text,
    Widget? child,
    VoidCallback? onPressed,
    double? height,
  }) =>
      PrimaryButton(
        color: AppColors.white,
        height: height,
        textColor: AppColors.black,
        onPressed: onPressed,
        text: text,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed?.call();
      },
      height:height?? Dimens.buttonHeight,
      minWidth:width?? double.infinity,
      disabledColor: color ?? AppColors.transparent,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      padding: const EdgeInsets.symmetric(vertical: Dimens.buttonPadding),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
          borderSide: removeBorder
              ? BorderSide.none
              : BorderSide(
                  color: AppColors.textGray.withOpacity(.6), width: 1.5)),
      color: color ?? AppColors.white,
      enableFeedback: true,
      child: child ??
          Text(
            text ?? '',
            style: textStyle ??
                context.textTheme.titleMedium?.copyWith(
                    color: textColor ?? Colors.black,
                    fontWeight: FontWeight.w500),
          ),
    );
  }
}
