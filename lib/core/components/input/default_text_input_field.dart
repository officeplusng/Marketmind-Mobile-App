import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketmind/core/export/export.core.dart';
import '../../dimen/dimens.dart';

class InputField extends StatelessWidget {
  final String? hint;
  final String? initialValue;
  final int? maxLines;
  final String? label;
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
  final OutlineInputBorder? border;
  final OutlineInputBorder? focusBorder;
  final bool useErrorBorder;
  final double? borderRadius;
  final VoidCallback? onClick;
  final bool readOnly;
  final VoidCallback? onTap;
  final Color? fillColor;
  final FontWeight? fontWeight;
  final String? Function(String?)? validator;
  final bool enabled;

  // Private constructor
  const InputField._({
    super.key,
    this.prefixIcon,
    this.readOnly = false,
    this.border,
    this.surfixIcon,
    this.hint,
    this.maxLines,
    this.validator,
    this.onClick,
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
    this.focusBorder,
    this.letterSpacing,
    this.borderRadius,
    this.useFocusBorder = false,
    this.height,
    this.minLines,
    this.label,
    this.fillColor,
    this.onChange,
  });

  /// Filled variant
  factory InputField.filled({
    Key? key,
    String? hint,
    OutlineInputBorder? border,
    OutlineInputBorder? focusBorder,
    String? label,
    TextEditingController? controller,
    Widget? prefixIcon,
    Widget? surfixIcon,
    String? Function(String?)? validator,
    bool readOnly = false,
    VoidCallback? onTap,
    bool enabled = true,
    String? initialValue,
    TextInputType? keyboardType,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? textColor,
    VoidCallback? onClick,
    double? borderRadius,
    int? minLines,
    int? maxLines,
    double? height,
    Color? fillColor = AppColors.white,
    bool useFocusBorder = false,
    bool useErrorBorder = false,
    bool obscureText = false,
    List<TextInputFormatter> inputFormatters = const [],
    void Function(String)? onChange,
  }) {
    return InputField._(
      key: key,
      hint: hint,
      label: label,
      controller: controller,
      border: border,
      prefixIcon: prefixIcon,
      focusBorder: focusBorder,
      surfixIcon: surfixIcon,
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      enabled: enabled,
      initialValue: initialValue,
      keyboardType: keyboardType,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      textColor: textColor,
      borderRadius: borderRadius,
      minLines: minLines,
      maxLines: maxLines,
      height: height,
      fillColor: fillColor,
      useFocusBorder: useFocusBorder,
      useErrorBorder: useErrorBorder,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      onChange: onChange,
    );
  }

  /// Outline variant
  factory InputField.outline({
    Key? key,
    // Same parameters, but no fillColor
    // fillColor will be null, border shows
    String? hint,
    String? label,
    TextEditingController? controller,
    Widget? prefixIcon,
    Widget? surfixIcon,
    String? Function(String?)? validator,
    bool readOnly = false,
    VoidCallback? onTap,
    bool enabled = true,
    String? initialValue,
    TextInputType? keyboardType,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? textColor,
    double? borderRadius,
    int? minLines,
    int? maxLines,
    double? height,
    bool useFocusBorder = true,
    bool useErrorBorder = false,
    bool obscureText = false,
    List<TextInputFormatter> inputFormatters = const [],
    void Function(String)? onChange,
  }) {
    return InputField._(
      key: key,
      hint: hint,
      label: label,
      controller: controller,
      prefixIcon: prefixIcon,
      surfixIcon: surfixIcon,
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      enabled: enabled,
      initialValue: initialValue,
      keyboardType: keyboardType,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      textColor: textColor,
      borderRadius: borderRadius,
      minLines: minLines,
      maxLines: maxLines,
      height: height,
      fillColor: null,
      useFocusBorder: useFocusBorder,
      useErrorBorder: useErrorBorder,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      onChange: onChange,
    );
  }

  /// Search variant
  factory InputField.search({
    Key? key,
    String? hint = "Search...",
    TextEditingController? controller,
    void Function(String)? onChange,
    VoidCallback? onClick,
    OutlineInputBorder? border,
  }) {
    return InputField.filled(
      key: key,
      hint: hint,
      onClick: onClick,
      controller: controller,


      focusBorder:border ??
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.gray)) ,
      border: border ??
          OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.gray)),
      prefixIcon: const Icon(
        Iconsax.search_normal_1_copy,
        color: AppColors.textGray1,
      ),
      borderRadius: 12,
      onChange: onChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
        ],
        TextFormField(
          style: context.textTheme.bodyMedium?.copyWith(
            letterSpacing: letterSpacing,
            color: textColor,
            fontWeight: fontWeight,
          ),
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
            hintText: hint,
            fillColor: fillColor,
            filled: fillColor != null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            constraints: BoxConstraints(minHeight: height ?? 42),
            hintStyle: context.textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
            ),
            errorStyle:
                context.textTheme.bodySmall?.copyWith(color: Colors.red),
            enabledBorder: border,
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8),
                  borderSide: BorderSide(
                    color: useErrorBorder
                        ? Colors.red
                        : (useFocusBorder ? Colors.blue : Colors.grey),
                  ),
                ),
            focusedBorder:focusBorder?? border?.copyWith(
                    borderSide:
                        BorderSide(width: 1.5, color: AppColors.gray)) ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8),
                  borderSide: BorderSide(
                      color: useErrorBorder ? Colors.red : Colors.blue,
                      width: 1),
                ),
            disabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
          ),
        ),
      ],
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
    return InputField.outline(
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
