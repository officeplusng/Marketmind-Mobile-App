import 'package:marketmind/core/export/export.core.dart';

class HomeTradingInsightComponent extends StatelessWidget {
  const HomeTradingInsightComponent(
      {super.key,
      required this.currencyPair,
      required this.insight,
      required this.percentageConfidence,
      required this.tradeDirection});

  final double percentageConfidence;
  final String currencyPair;
  final String tradeDirection;
  final String insight;

  @override
  Widget build(BuildContext context) {
    final buy = tradeDirection.toLowerCase() == 'buy';
    const buyGradient = LinearGradient(colors: [
      Color(0xFFACCBEE),
      Color(0xFFE7F0FD),
    ]);
    const sellGradient = LinearGradient(colors: [
      Color(0xFFEAFA8), //#FEAFA8
      Color(0xFFF5EFEF),
    ]);
    return Container(
      padding: const EdgeInsets.only(top: 8),
      width: double.infinity,
      decoration: ShapeDecoration(
          gradient: buy ? buyGradient : sellGradient,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Color(0xFFEAECF0)))),
      child: Column(
        children: [
          Row(
            children: [
              16.horizontalSpace,
              Text(
                '$currencyPair $tradeDirection Signal',
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              10.horizontalSpace,
              priceChange(context,buy)
            ],
          ),
          8.verticalSpace,
          Container(
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text(
              'Entry: 1.1050 | SL: 1.1020 | TP: 1.1100. Strong support at 1.1020 with increasing bullish momentum on 4H chart.',
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.textGray1),
            ),
          )
        ],
      ),
    );
  }

  Widget priceChange(
    BuildContext context,
      bool buy
  ) =>
      Container(
        height: 21.5,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: ShapeDecoration(
            color: !buy
                ? const Color(0xFFFEF0C7) //F2F4F7
                : AppColors.greenLight1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$percentageConfidence%',
              style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: buy?AppColors.textGreen:const Color(0xFF93370D)),
            )
          ],
        ),
      );
}
