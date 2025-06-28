import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/features/_shared/presentation/base_shimmer.dart';
import 'package:marketmind/features/root/home/controllers/cubit/trading_insight_cubit.dart';
import 'package:marketmind/features/root/home/data/dto/trading_insight_dto.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../../../../core/export/export.core.dart';
import '../data/dto/trading_insight_data_dto.dart';
import 'components/home_app_bar_action_icon.dart';
import 'components/trading_insight_component.dart';
import 'notification/notification_screen.dart';

typedef TradingInsight = List<TradingInsightDto>;

class AiTradingInsightScreen extends StatefulWidget {
  const AiTradingInsightScreen({super.key});

  @override
  State<AiTradingInsightScreen> createState() => _AiTradingInsightScreenState();
}

final tabs = ["All Insights", "Forex", "Deriv", "Stocks", "Crypto"];

class _AiTradingInsightScreenState extends State<AiTradingInsightScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  int _currentTab = 0;
  String category = '';
  final categories = ['', 'forex', 'deriv', 'stock', 'crypto'];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      horizontalPadding: 20,
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeAppBarActionIcon(
                onClick: () {
                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 18,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HomeAppBarActionIcon(asset: Assets.bellIcon,onClick: (){
                    context.push(const NotificationScreen());
                  },),
                ],
              )
            ],
          ),
          30.verticalSpace,
          Text(
            'AI Trade Insights',
            style: context.textTheme.headlineMedium
                ?.copyWith(color: AppColors.black),
          ),
          20.verticalSpace,
          //#F9FAFB
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: ShapeDecoration(
                color: const Color(0xFFF9FAFB),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(width: 1, color: Color(0xFFEAECF0)))),
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primary,
              dividerColor: AppColors.transparent,
              unselectedLabelColor: const Color(0xFF667085),
              labelColor: const Color(0xFF344054),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelStyle: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
              onTap: (value) {
                setState(() {
                  _currentTab = value;
                  category = categories[value];
                });
              },
              indicator: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              tabs: List.generate(tabs.length, (value) {
                final e = tabs[value];
                return Tab(
                  text: e,
                );
              }),
            ),
          ),
          10.verticalSpace,
          Expanded(child:
              BlocBuilder<AiInsightCubit, BaseState<MarketAnalysisData>>(
                  builder: (context, state) {
            if (state is LoadingState<MarketAnalysisData>) {
              return const BaseShimmer(
                height: 150,
                radius: 16,
              );
            }
            if (state is SuccessState<MarketAnalysisData>) {
              final data = state.data?.aiSignalSpotlights ?? [];
              return ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return TradingInsightComponent(
                      data: TradingInsightDto(
                          asset: item.pair ?? '',
                          confidence: item.confidence?.toDouble().round() ?? 0,
                          signal: item.signal??'',
                          info: 'info'),
                    );
                  });
            }
            return SizedBox();
          }))
        ],
      )),
    );
  }
}
