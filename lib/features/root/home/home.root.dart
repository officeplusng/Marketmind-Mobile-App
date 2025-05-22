import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/home/components/complete_profile_component.dart';
import 'package:marketmind/features/root/home/components/home_app_bar_action_icon.dart';
import 'package:marketmind/features/root/home/components/home_info_card.dart';
import 'package:marketmind/features/root/home/components/home_trading_insight_component.dart';
import 'package:marketmind/features/root/home/components/market_data_component.dart';
import 'package:marketmind/features/root/home/components/market_summary_component.dart';

import 'ai_trading_insight_screen.dart';

class MarketDataDto {
  final String currencyPair;
  final String currentPrice;
  final double percentage;

  const MarketDataDto(
      {required this.currentPrice,
      required this.currencyPair,
      required this.percentage});
}

class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  @override
  Widget build(BuildContext context) {
    final dummyMarketData = [
      MarketDataDto(
          currentPrice: '1.105', currencyPair: 'EUR/USD', percentage: -.2),
      MarketDataDto(
          currentPrice: '\$2,9671.05',
          currencyPair: 'NVIDIA (NVDA)',
          percentage: 7.5),
      MarketDataDto(
          currentPrice: '\$32,742.0',
          currencyPair: 'Microsoft',
          percentage: 4.2),
      MarketDataDto(
          currentPrice: '\$78,742.0', currencyPair: 'Apple', percentage: 17.6),
      MarketDataDto(
          currentPrice: '\$106,000', currencyPair: 'Bitcoin', percentage: 10.1),
    ];
    return GradientScaffold(
        backgroundAsset: Assets.homeGradient,
        horizontalPadding: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(AppConstants.placeHolder),
                    ),
                    10.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                        ),
                        Text(
                          'Kariaki Ebilate',
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: AppColors.white),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HomeAppBarActionIcon(asset: Assets.bellIcon),
                    10.horizontalSpace,
                    HomeAppBarActionIcon(asset: Assets.search),
                  ],
                )
              ],
            ),
            20.verticalSpace,
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CompleteProfileComponent(),
                  30.verticalSpace,
                  MarketSummaryComponent(),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _title('AI Trade Insights'),
                      InkWell(
                          onTap: () {
                            context.push(AiTradingInsightScreen());
                          },
                          child: Text(
                            'View All',
                            style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.primary),
                          ))
                    ],
                  ),
                  5.verticalSpace,
                  HomeTradingInsightComponent(
                      currencyPair: 'EUR/GBP',
                      insight: '',
                      percentageConfidence: 85,
                      tradeDirection: 'SELL'),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _title('Market Data'),
                      InkWell(
                          onTap: () {},
                          child: Text(
                            'Edit',
                            style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.primary),
                          ))
                    ],
                  ),
                  5.verticalSpace,
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: dummyMarketData.length,
                      itemBuilder: (context, index) {
                        final item = dummyMarketData[index];
                        return MarketDataComponent(
                          currencyPair: item.currencyPair,
                          currentPrice: item.currentPrice,
                          percentageMovement: item.percentage,
                        );
                      },
                    ),
                  ),
                  20.verticalSpace,
                  _title('Learning Progress'),
                  5.verticalSpace,
                  HomeInfoCard(
                      title: 'Intermediate Forex Strategies',
                      subtitle: "Lesson 4 of 6: Support & Resistance Levels",
                      buttonText: 'Continue',
                      backgroundAsset: Assets.homeBackground1,
                      buttonIcon: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.black,
                        size: 14,
                      )),
                  20.verticalSpace,
                  _title('Partner Program'),
                  5.verticalSpace,
                  HomeInfoCard(
                      title: 'Your Referral Network',
                      subtitle: "Track your referrals and earnings",
                      buttonText: 'Earn commission',
                      backgroundAsset: Assets.homeBackground2,
                      subtitleColor: AppColors.defaultSubtitleHomeColor,
                      buttonIcon: SvgPicture.asset(Assets.giftIcon)),
                ],
              ),
            ))
          ],
        ));
  }

  Widget _title(String text) => Text(
        text,
        style: context.textTheme.titleSmall
            ?.copyWith(color: AppColors.defaultButtonTextHomeColor),
      );
}
