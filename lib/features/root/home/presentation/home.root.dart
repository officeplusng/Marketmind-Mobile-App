import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/_shared/data/dto/user_dto.dart';
import 'package:marketmind/features/_shared/presentation/base_shimmer.dart';
import 'package:marketmind/features/root/home/controllers/cubit/trading_insight_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/watch_list_cubit.dart';
import 'package:marketmind/features/root/home/data/dto/trading_insight_data_dto.dart';
import 'package:marketmind/features/root/home/data/dto/trading_insight_dto.dart';
import 'package:marketmind/features/root/home/data/dto/watch_list_dto.dart';
import 'package:marketmind/features/root/home/presentation/referral/referral_home_page.dart';
import 'package:marketmind/features/root/settings/presentation/settings.root.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../../../_shared/controllers/cubit/candle_chart_cubit.dart';
import '../../../_shared/data/enum/time_frame.dart';
import 'ai_trading_insight_screen.dart';
import 'components/complete_profile_component.dart';
import 'components/home_app_bar_action_icon.dart';
import 'components/home_info_card.dart';
import 'components/home_trading_insight_component.dart';
import 'components/market_data_component.dart';
import 'components/market_summary_component.dart';
import 'customize_market_data.dart';

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
    return GradientScaffold(
        backgroundAsset: Assets.homeGradient,
        horizontalPadding: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            BlocBuilder<AccountCubit, BaseState<UserDto>>(
                builder: (context, state) {
              final data = state.data;
              final nameSplit = data?.fullname?.split(' ');
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {

                          context.read<CandleChartCubit>().fetchChartData(fromSymbol: 'EUR',toSymbol: 'USD',timeframe: TimeFrame.monthly);
                          return;
                          context.push(SettingsRoot());
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: data?.avatar == null
                              ? null
                              : NetworkImage(data?.avatar?.url ??
                                  AppConstants.placeHolder),
                          backgroundColor:
                              data?.avatar != null ? AppColors.primary : null,
                          child: data?.avatar != null
                              ? Text(
                                  '${nameSplit?.firstOrNull?.characters.firstOrNull ?? ''}${nameSplit?.lastOrNull?.characters.firstOrNull ?? ''}',
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(color: AppColors.white),
                                )
                              : null,
                        ),
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBlack1),
                          ),
                          Text(
                            '${nameSplit?.firstOrNull ?? ''} ${nameSplit?.lastOrNull ?? ''}',
                            style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.textBlack1),
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
              );
            }),
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
                  BlocBuilder<AiInsightCubit, BaseState<MarketAnalysisData>>(
                      builder: (context, state) {
                    if (state is LoadingState) {
                      return const BaseShimmer(
                        itemCount: 2,
                        radius: 20,
                      );
                    }
                    if (state is ErrorState) {
                      return SizedBox();
                    }
                    if (state is SuccessState) {
                      final data = state.data?.aiSignalSpotlights ?? [];
                      int itemCount = data.length > 2 ? 2 : data.length;
                      if (itemCount == 0) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'No Trading Insight available',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(color: AppColors.textGray1),
                            ),
                          ),
                        );
                      }
                      return ListView.separated(
                          separatorBuilder: (_, a) => 10.verticalSpace,
                          itemCount: itemCount,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            final item = data[index];
                            return HomeTradingInsightComponent(
                                currencyPair: item.pair ?? '',
                                insight: 'item.info',
                                percentageConfidence:
                                    item.confidence?.toDouble() ?? 0,
                                tradeDirection: item.signal ?? '');
                          });
                    }
                    return SizedBox();
                  }),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _title('Market Data'),
                      InkWell(
                          onTap: () {
                            context.push(const CustomizeMarketData());
                          },
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
                  BlocBuilder<AiInsightCubit, BaseState<MarketAnalysisData>>(
                      builder: (context, state) {
                    if (state is LoadingState) {
                      return const SizedBox(
                        height: 100,
                        child: BaseShimmer(
                          height: 100,
                          direction: Axis.horizontal,
                          width: 150,
                          radius: 16,
                        ),
                      );
                    }
                    if (state is SuccessState) {
                      final item = state.data?.assetsToWatch ?? [];
                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: item.length,
                          itemBuilder: (context, index) {
                            final data = item[index];
                            return MarketDataComponent(
                              currencyPair: data.symbol ?? '',
                              currentPrice: data.price?.toString() ?? '0',
                              percentageMovement: double.tryParse(
                                      data.change24h?.toStringAsFixed(3) ??
                                          '') ??
                                  0,
                            );
                          },
                        ),
                      );
                    }
                    return SizedBox();
                  }),
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
                      onClick: () {
                        context.push(ReferralHomePage());
                      },
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
