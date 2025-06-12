import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/export/export.core.dart';

class ReferralComponent extends StatelessWidget {
  const ReferralComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(width: 1, color: Color(0xFFEAECF0)))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Michael T',
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.defaultButtonTextHomeColor),
                ),
                Text(
                  '\$15.80',
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.defaultButtonTextHomeColor),
                )
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFEAECF0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "10/02/2025",
                  style: context.textTheme.bodyMedium,
                ),
                5.horizontalSpace,
                _activeContainer(context, true),
                Spacer(),
                Text(
                  "Level 1\t\t•",
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  "\t\tAutopilot",
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _activeContainer(BuildContext context, bool active) => Container(
        height: 21,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: ShapeDecoration(
            color: active ? AppColors.greenLight1 : Color(0xFFFEF0C7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: Text(
          active ? 'Active' : 'Pending',
          style: context.textTheme.bodySmall?.copyWith(
              color: active ? AppColors.textGreen : AppColors.yellowDark),
        ),
      );
}
