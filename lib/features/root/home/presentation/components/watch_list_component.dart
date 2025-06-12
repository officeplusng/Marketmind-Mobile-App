import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';

class WatchListComponent extends StatelessWidget {
  const WatchListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          color: const Color(0xFF111322),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      padding: EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WrapperContainer(
              width: 32,
              height: 32,
              backgroundColor: AppColors.socialGray,
              child: Icon(CupertinoIcons.arrow_up_arrow_down)),
          10.horizontalSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EUR/USD',
                style: context.textTheme.titleMedium
                    ?.copyWith(color: AppColors.white),
              ),
              8.verticalSpace,
              Text(
                'British Pound / Japanese Yen',
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.textGray12),
              ),
              8.verticalSpace,
              Text(
                '188.75',
                style: context.textTheme.bodySmall
                    ?.copyWith(color: AppColors.textGray12),
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              10.horizontalSpace,
              currencySummary(context, percentageMovement: -.2),
              10.horizontalSpace,
              GestureDetector(
                onTap: () {},
                child: const WrapperContainer(
                  backgroundColor: Color(0xFF7A271A),
                  child: Icon(
                    Icons.remove,
                    color: AppColors.white,
                  ),
                  width: 28,
                  height: 28,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget currencySummary(
    BuildContext context, {
    required double percentageMovement,
  }) =>
      Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: ShapeDecoration(
            color: percentageMovement < 0
                ? AppColors.redLight
                : AppColors.greenLight1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              percentageMovement < 0
                  ? CupertinoIcons.arrow_down
                  : CupertinoIcons.arrow_up,
              color: percentageMovement < 0
                  ? AppColors.errorText
                  : AppColors.textGreen,
              size: 14,
            ),
            5.horizontalSpace,
            Text(
              '$percentageMovement%',
              style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: percentageMovement < 0
                      ? AppColors.errorText
                      : AppColors.textGreen),
            )
          ],
        ),
      );
}
