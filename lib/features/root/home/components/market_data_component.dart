import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';

class MarketDataComponent extends StatelessWidget {
  const MarketDataComponent(
      {super.key,
      required this.currencyPair,
      required this.currentPrice,
      this.percentageMovement = 0.0});

  final String currencyPair;
  final String currentPrice;
  final double percentageMovement;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      constraints: const BoxConstraints(
        minWidth: 150
      ),
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
          color: AppColors.bottomNavColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currencyPair,
            style: context.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700, color: AppColors.white),
          ),
          5.verticalSpace,
          Text(
            currentPrice,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontSize: 12, color: AppColors.white),
          ),
          5.verticalSpace,
          priceChange(context)
        ],
      ),
    );
  }

  Widget priceChange(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
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
            Text(
              '${percentageMovement>0?'+':''}$percentageMovement%',
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
