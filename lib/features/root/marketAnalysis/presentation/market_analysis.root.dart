import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/_shared/presentation/candle_chart.dart';
import 'package:marketmind/features/root/marketAnalysis/presentation/modal/market_analysis_option.dart';
import 'components/market_analysis_dasboard.dart';
import 'components/news_components.dart';
import 'components/technical_analysis.dart';

class MarketAnalysis extends StatefulWidget {
  const MarketAnalysis({super.key});

  @override
  State<MarketAnalysis> createState() => _MarketAnalysisState();
}

class _MarketAnalysisState extends State<MarketAnalysis> {
  final options = ['Stock','Crypto','Forex'
  ];
  String? analysisOption;
  @override
  void initState() {
    analysisOption=options.firstOrNull;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var data = 'Risk Analysis';
    const marketInsightText = "AI Market Insights";
    var bodyMedium = context.textTheme.bodyMedium;

    return BaseScaffold(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        60.verticalSpace,
        Text(
          'Market Analysis',
          style: context.textTheme.titleMedium
              ?.copyWith(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        30.verticalSpace,
        Row(
          children: [
            SvgPicture.asset(Assets.globe),
            10.horizontalSpace,
            Text(
              'Overview',
              style: context.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            Spacer(),
            WrapperContainer.rectangular(
                useHeight: false,
                useWidth: false,
                backgroundColor: AppColors.white,
                borderRadius: 999,
                onClick: (){
                  ModalHelper.showModalMax(context, MarketAnalysisOption(
                    options: options,
                    initialSelected: analysisOption,
                    onSelected: (value){
                      setState(() {
                        analysisOption=value;
                      });
                    },
                  ));
                },
                bordered: true,
                borderColor: const Color(0xFFF2F4F7),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      analysisOption??'',
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    5.horizontalSpace,
                    Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ))
          ],
        ),
        20.verticalSpace,
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .95,
                    crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
              children: [

                MarketAnalysisDashboardComponent(
                  backgroundColor: Color(0xFF6938EF),
                  textColor: AppColors.white,
                ),
                MarketAnalysisDashboardComponent(),
                MarketAnalysisDashboardComponent(),
                MarketAnalysisDashboardComponent(),
              ],),
              10.verticalSpace,
              MarketAnalysisTechnicalAnalysisComponent(),
              10.verticalSpace,
               CandleChart(),
              10.verticalSpace,
              NewsComponents(),
              10.verticalSpace,
              _marketInsightContainer(marketInsightText, context),
              10.verticalSpace,
              _riskAnalysisContainer(data, context, bodyMedium)
            ],
          ),
        ))
      ],
    ));
  }

  Widget _marketInsightContainer(
      String marketInsightText, BuildContext context) {
    return _container(
        child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.aiMagicLine),
            5.horizontalSpace,
            Text(
              marketInsightText,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                foreground: _gradientPaint(marketInsightText),
              ),
            )
          ],
        ),
        20.verticalSpace,
        _marketInsightComponent(context)
      ],
    ));
  }

  WrapperContainer _marketInsightComponent(BuildContext context) {
    return WrapperContainer.rectangular(
        bordered: false,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: double.infinity,
        backgroundColor: AppColors.lightBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [],
            ),
            Text(
              'Market Sentiment',
              style: context.textTheme.bodyLarge,
            ),
            Text(
              'Bullish',
              style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            Text(
              '24h Forecast',
              style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.primary),
            ),
          ],
        ));
  }

  Paint _gradientPaint(String marketInsightText) {
    return Paint()
      ..shader = const LinearGradient(colors: [
        Color(0xFFAD00FE),
        Color(0xFF00E0EE),
      ]).createShader(
        Rect.fromLTWH(0, 0, marketInsightText.length * 16, 16),
      );
  }

  Widget _riskAnalysisContainer(
      String data, BuildContext context, TextStyle? bodyMedium) {
    return _container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.riskAnalysis),
            5.horizontalSpace,
            Text(
              data,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                foreground: _gradientPaint(data),
              ),
            )
          ],
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Market Volatility',
              style: bodyMedium?.copyWith(color: AppColors.textGray1),
            ),
            Text(
              'Market Volatility',
              style: bodyMedium?.copyWith(
                  color: AppColors.textBlack1, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        10.verticalSpace,
        LinearProgressIndicator(
          minHeight: 8,
          backgroundColor: AppColors.onSurfaceCardColor,
          color: AppColors.orange,
          value: .7,
          borderRadius: BorderRadius.circular(100),
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Low',
              style: bodyMedium?.copyWith(color: AppColors.textGray1),
            ),
            Text(
              'Low',
              style: bodyMedium?.copyWith(color: AppColors.textGray1),
            ),
          ],
        ),
      ],
    ));
  }

  Widget _container({required Widget child}) {
    return WrapperContainer.rectangular(
        width: double.infinity,
        useHeight: false,
        backgroundColor: AppColors.white,
        borderColor: const Color(0xFFF2F4F7),
        padding: const EdgeInsets.all(16),
        bordered: true,
        child: child);
  }
}
