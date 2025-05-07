// ignore_for_file: prefer_const_constructors

import 'package:marketmind/core/export/export.core.dart';
import 'package:flutter/material.dart';

import '../../dimen/dimens.dart';
import '../../theme/app_colors.dart';

class DropdownField<T> extends StatelessWidget {
  final String? label;
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final Widget? prefixIcon;
  final String? error;
  final double? radius;
  final Color? fillColor;
  final Color? textColor;
  final Color? borderColor;
  final bool enabled;

  const DropdownField({
    super.key,
    this.label,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.prefixIcon,
    this.error,
    this.radius,
    this.fillColor,
    this.textColor,
    this.borderColor,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        InputDecorator(
          decoration:InputDecoration(

            errorStyle: context.textTheme.bodySmall?.copyWith(color: AppColors.red),
            hintStyle:
            context.textTheme.bodyMedium?.copyWith(color: AppColors.textGray),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
              borderSide: BorderSide(color: AppColors.blue, width: 1),
            ),
            constraints: BoxConstraints(minHeight: 44),
            contentPadding: EdgeInsets.only(top: 0,bottom: 0,left: 20,right: 12),
            hintText: hint,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
                borderSide: BorderSide(color: AppColors.textGray, width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
                borderSide: BorderSide(color: AppColors.textGray, width: 1)),
          ),
          isEmpty: value == null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              items: items,
              onChanged: enabled ? onChanged : null,
              isExpanded: true,
              dropdownColor: AppColors.white,

              hint: Text(
                hint,
                style: TextStyle(
                  color: AppColors.textGray,
                  fontSize: 14,
                ),
              ),
              style: TextStyle(
                color: textColor ?? AppColors.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
        if (error != null) ...[
          const SizedBox(height: 8),
          Text(
            error!,
            style: TextStyle(
              color: AppColors.red,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}
