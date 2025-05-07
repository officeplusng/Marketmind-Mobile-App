import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketmind/core/export/export.core.dart';
import '../../dimen/dimens.dart';
import '../../theme/app_colors.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      this.prefixIcon,
      this.readOnly = false,
      this.surfixIcon,
      this.hint,
      this.maxLines,
      this.validator,
      this.onTap,
      this.enabled = true,
      this.initialValue,
      this.inputFormatters = const [],
      this.textColor,
      this.fontWeight,
      this.keyboardType,
      this.obscureText = false,
      this.controller,
      this.useErrorBorder = false,
      this.letterSpacing,
        this.borderRadius,
      this.useFocusBorder = false,
        this.height,
        this.minLines,
      this.onChange});

  final String? hint;
  final String? initialValue;
  final int? maxLines;
  final int? minLines;
  final double? height;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final double? letterSpacing;
  final bool useFocusBorder;
  final List<TextInputFormatter> inputFormatters;
  final void Function(String)? onChange;
  final Widget? prefixIcon;
  final Color? textColor;
  final Widget? surfixIcon;
  final bool useErrorBorder;
  final double? borderRadius;
  final bool readOnly;
  final VoidCallback? onTap;
  final FontWeight? fontWeight;
  final String? Function(String?)? validator;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.textTheme.bodyMedium?.copyWith(
          letterSpacing: letterSpacing,
          color: textColor,
          fontWeight: fontWeight),
      maxLines: maxLines,
      enabled: enabled,
      minLines: minLines,
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      readOnly: readOnly,
      onTap: enabled ? onTap : null,
      onChanged: onChange,
      obscureText: obscureText,
      obscuringCharacter: '❋',
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: surfixIcon,
        errorStyle: context.textTheme.bodySmall?.copyWith(color: AppColors.red),
        hintStyle:
            context.textTheme.bodyMedium?.copyWith(color: AppColors.textGray),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??Dimens.defaultBorderRadius),
          borderSide: BorderSide(
              color: useErrorBorder ? AppColors.red : AppColors.blue, width: 1),
        ),
        constraints:  BoxConstraints(minHeight:height?? 44),
        contentPadding:
            const EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 12),
        hintText: hint,
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius??Dimens.defaultBorderRadius),
            borderSide: BorderSide(color: AppColors.textGray, width: 1)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius??Dimens.defaultBorderRadius),
            borderSide: BorderSide(
                color: useErrorBorder
                    ? AppColors.red
                    : (useFocusBorder ? AppColors.blue : AppColors.textGray),
                width: 1)),
      ),
    );
  }
}

class ClickableInputField extends StatelessWidget {
  final String? hint;

  const ClickableInputField(
      {super.key,
      this.hint,
      this.controller,
      this.value,
      this.onClick,
      this.validator});

  final VoidCallback? onClick;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InputField(
      hint: hint,
      controller: TextEditingController(text: value),
      onTap: onClick,
      // initialValue: value,
      readOnly: true,
      surfixIcon: IconButton(
          onPressed: onClick,
          icon: const Icon(Icons.keyboard_arrow_down_outlined)),
      validator: validator,
      keyboardType: TextInputType.name,
    );
  }
}
