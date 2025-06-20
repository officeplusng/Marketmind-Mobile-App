
import 'package:marketmind/core/export/export.core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField(
      {super.key,
      required this.hint,
      required this.onChange,
      this.controller,
      this.validator,
      this.confirmed = false,
      this.error,
        this.label,
      this.length = 4});

  final String hint;
  final void Function(String) onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int length;
  final String? label;
  final String? error;
  final bool confirmed;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputField.filled(
          hint: widget.hint,
          label:widget.label??'Password' ,
          controller: widget.controller,
          useFocusBorder: widget.confirmed,
          onChange: widget.onChange,
          fontWeight: FontWeight.bold,
          keyboardType: TextInputType.text,
          letterSpacing: 2,
          useErrorBorder: widget.error != null,
          validator: widget.validator ?? InputValidators.required,
          maxLines: 1,
          obscureText: !showPassword,
          surfixIcon: IconButton(
              onPressed: () => setState(() => showPassword = !showPassword),
              icon: Icon(showPassword?Icons.visibility_outlined:Icons.visibility_off_outlined)),
        ),
        if (widget.error != null) ...[
          10.verticalSpace,
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Iconsax.info_circle_copy,
                color: AppColors.red,
                size: 18,
              ),
              5.horizontalSpace,
              Text(
                widget.error!,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.red),
              )
            ],
          )
        ]
      ],
    );
  }
}
