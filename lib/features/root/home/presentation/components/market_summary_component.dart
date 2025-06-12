import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';

class MarketSummaryComponent extends StatelessWidget {
  const MarketSummaryComponent({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(
                  width: 1, color: AppColors.secondaryCardBorder))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Market Summary',
            style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500, color: AppColors.textGray1),
          ),
          10.verticalSpace,
          Text(
            "Today's Outlook",
            style: context.textTheme.headlineMedium
                ?.copyWith(color: AppColors.black),
          ),
          10.verticalSpace,
          Row(
            children: [
             Expanded(child:  currencySummary(context, currency: 'S&P 500', percentageMovement: 1.2)),
              10.horizontalSpace,
              Expanded(child:
              currencySummary(context, currency: 'XAU/USD', percentageMovement: -4.5)),
            ],
          )
        ],
      ),
    );
  }

  Widget currencySummary(
    BuildContext context,
      {
    required String currency,
    required double percentageMovement,
  }) =>
      Container(
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
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
              Icons.circle,
              color: percentageMovement < 0
                  ? AppColors.errorText
                  : AppColors.textGreen,
              size: 6,
            ),
            8.horizontalSpace,
            Text(
              '$currency ${percentageMovement > 0 ? '+' : ''}$percentageMovement%',
              style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: percentageMovement < 0
                      ? AppColors.errorText
                      : AppColors.textGreen),
            )
          ],
        ),
      );
}
