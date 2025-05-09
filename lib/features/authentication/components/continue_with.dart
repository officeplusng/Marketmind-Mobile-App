import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/export/export.core.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    final divider = Expanded(child: Container(
      width: double.infinity,
      color: AppColors.dividerColor,
      height: 1,
    ));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        divider,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            15.horizontalSpace,
            Text('or continue with',style: context.textTheme.bodyMedium?.copyWith(color: AppColors.secondaryTextColor),),
            15.horizontalSpace
          ],
        ),
        divider
      ],
    );
  }
}
