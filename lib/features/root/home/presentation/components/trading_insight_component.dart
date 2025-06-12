import 'package:marketmind/core/export/export.core.dart';

class TradingInsightComponent extends StatelessWidget {
  const TradingInsightComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 160),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
          color: const Color(0xFFECFDF3),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Color(0xFFABEFC6)))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'EUR/USD',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold,color: Color(0xFF101828)),
                  ),
                  10.horizontalSpace,
                  priceChange(context, true, 87)
                ],
              ),
              Text(
                'EUR/USD',
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold,color: const Color(0xFF079455)),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _tradeParameter(context, title: 'Entry', value: '1.1050'),
              _tradeParameter(context, title: 'Stop Loss', value: '0.9821'),
              _tradeParameter(context, title: 'Take Profile', value: '2.1051'),
            ],
          ),
          10.verticalSpace,
          Text(
            "Strong support at 1.1020 with increasing bullish momentum on 4H chart. Sentiment analysis of recent ECB statements shows 68% positive tone.",
            style: context.textTheme.bodyMedium
                ?.copyWith(fontSize: 12, color: const Color(0xFF667085)),
          ),
        ],
      ),
    );
  }

  Widget _tradeParameter(BuildContext context,
          {required String title, required String value}) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontSize: 12, color: Color(0xFF667085)),
          ),
          2.5.verticalSpace,
          Text(
            value,
            style: context.textTheme.bodyMedium,
          )
        ],
      );

  Widget priceChange(
      BuildContext context,
      bool buy,
      double confidence
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
              '$confidence%',
              style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: buy?AppColors.textGreen:const Color(0xFF93370D)),
            )
          ],
        ),
      );
}
