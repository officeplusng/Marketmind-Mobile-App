import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';

class MarketAnalysisTechnicalAnalysisComponent extends StatefulWidget {
  const MarketAnalysisTechnicalAnalysisComponent({super.key});

  @override
  State<MarketAnalysisTechnicalAnalysisComponent> createState() =>
      _MarketAnalysisTechnicalAnalysisComponentState();
}

class _MarketAnalysisTechnicalAnalysisComponentState
    extends State<MarketAnalysisTechnicalAnalysisComponent> {
  @override
  Widget build(BuildContext context) {
    var bodyMedium2 = context.textTheme.bodyMedium;
    var bodyMediumTextGreenLight =
        bodyMedium2?.copyWith(color: AppColors.textGreenLight);
    return WrapperContainer.rectangular(
        width: double.infinity,
        useHeight: false,
        backgroundColor: AppColors.white,
        borderColor: const Color(0xFFF2F4F7),
        padding: const EdgeInsets.all(16),
        bordered: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Technical Analysis',
              style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.textBlack),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(Assets.calendar),
                    8.horizontalSpace,
                    Text(
                      'All time',
                      style: bodyMedium2?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    8.horizontalSpace,
                    Icon(Icons.keyboard_arrow_down_sharp)
                  ],
                ),
                // 20.horizontalSpace,
                // WrapperContainer.rectangular(
                //     width: 36,
                //     height: 36,
                //     backgroundColor: AppColors.lightBlue,
                //     child: SvgPicture.asset(Assets.chart)),
                // 20.horizontalSpace,
                // SvgPicture.asset(Assets.barChart)
              ],
            ),
            20.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: Text(
                  'Apple Inc. (AAPL)',
                  style: bodyMedium2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )),
                15.horizontalSpace,
                Text(
                  '182.52',
                  style: bodyMediumTextGreenLight,
                ),
                10.horizontalSpace,
                Text(
                  '+1.25%',
                  style: bodyMediumTextGreenLight,
                ),
                15.horizontalSpace,
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
            20.verticalSpace,
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 5,
                childAspectRatio: 1.7,
                crossAxisSpacing: 5),
            shrinkWrap: true,
            children: [

              _infoComponent(title: 'RSI', value: '65.42'),
              _infoComponent(title: 'MACD', value: 'Bullish',textColor: AppColors.textGreenLight),
              _infoComponent(title: 'Volume', value: '2.5M'),
              _infoComponent(title: 'Volatility', value: 'Medium'),
            ],)
          ],
        ));
  }

  Widget _infoComponent(
      {required String title, required String value, Color? textColor}) {
    return WrapperContainer.rectangular(
        width: 150,
        height: 85,
        backgroundColor: AppColors.white,
        borderColor: const Color(0xFFF2F4F7),
        padding: const EdgeInsets.all(12),
        bordered: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(),
            Text(
              'RSI',
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.textGray1),
            ),
            10.verticalSpace,
            Text(
              value,
              style: context.textTheme.headlineMedium?.copyWith(
                  fontSize: 20, color: textColor ?? AppColors.textBlack1),
            ),
          ],
        ));
  }
}
