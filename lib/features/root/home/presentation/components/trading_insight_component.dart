import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/home/data/dto/trading_insight_dto.dart';

import '../../controllers/cubit/trading_insight_cubit.dart';

class TradingInsightComponent extends StatelessWidget {
  const TradingInsightComponent({super.key, required this.data});

  final TradingInsightDto data;

  @override
  Widget build(BuildContext context) {
    final cubitData =
        context.read<AiInsightCubit>().state.data?.marketSentiments ?? [];
    final sentiment = cubitData
            .where((element) => element.pair == data.asset)
            .firstOrNull
            ?.summary ??
        '';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
          color: data.buy ? const Color(0xFFECFDF3) : const Color(0XFFFEF3F2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                  color: data.buy ? Color(0xFFABEFC6) : Color(0XFFFECDCA)))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.asset,
                    style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: Color(0xFF101828)),
                  ),
                  10.horizontalSpace,
                  priceChange(context, data.buy, data.confidence.toDouble())
                ],
              ),
              Text(
                '${data.signal} Signal',
                style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: data.buy ? const Color(0xFF079455) : AppColors.red),
              ),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _tradeParameter(context,
                  title: 'Entry', value: data.entryPrice?.toString() ?? ''),
              _tradeParameter(context,
                  title: 'Stop Loss', value: data.sl?.toString() ?? ''),
              _tradeParameter(context,
                  title: 'Take Profile', value: data.tp?.toString() ?? ''),
            ],
          ),
          5.verticalSpace,
          Text(
            sentiment,
            // data.info ?? '',
            textAlign: TextAlign.start,
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

  Widget priceChange(BuildContext context, bool buy, double confidence) =>
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
              '${data.confidence}% Confidence',
              style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: buy ? AppColors.textGreen : const Color(0xFF93370D)),
            )
          ],
        ),
      );
}
