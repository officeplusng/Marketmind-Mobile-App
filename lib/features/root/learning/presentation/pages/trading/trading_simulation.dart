import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/component/custom_app_bar.dart';
import 'package:marketmind/features/root/home/presentation/components/home_app_bar_action_icon.dart';
import 'package:marketmind/features/root/learning/presentation/_components/trading_news_component.dart';
import 'package:marketmind/features/root/learning/presentation/pages/trading/tabs/chart_tab.dart';
import 'package:marketmind/features/root/learning/presentation/pages/trading/trade_execution_screen.dart';

import '../../_components/opened_position_component.dart';
import '../../_components/trade_statistics_component.dart';

class TradingSimulationScreen extends StatefulWidget {
  const TradingSimulationScreen({super.key});

  @override
  State<TradingSimulationScreen> createState() =>
      _TradingSimulationScreenState();
}

class _TradingSimulationScreenState extends State<TradingSimulationScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final _tabs = ['Chart', 'News'];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    var copyWith =
        context.textTheme.bodyMedium?.copyWith(color: AppColors.textGray1);
    var boldStyle = copyWith?.copyWith(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack);
    return BaseScaffold(
        child: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          CustomAppBar(
            action: [
              HomeAppBarActionIcon(
                onClick: () {},
                child: const Icon(
                  Icons.settings,
                  size: 18,
                ),
              ),
            ],
            children: [
              20.horizontalSpace,
              Text(
                'EUR/USD',
                style: context.textTheme.titleMedium,
              )
            ],
          ),
          20.verticalSpace,
          Text('Support & Resistance Trading ', style: copyWith),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Virtual Balance',
                style: copyWith,
              ),
              Text('Current Price', style: copyWith),
            ],
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$10,000.00',
                style: boldStyle,
              ),
              Text(
                '1.0815',
                style: boldStyle,
              ),
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              Expanded(
                  child: PrimaryButton.minDark(
                onPressed: () {
                  context.push(TradeExecutionScreen());
                },
                color: AppColors.textGreenLight,
                text: 'Buy',
                icon: const Icon(
                  Icons.arrow_upward,
                  color: AppColors.white,
                ),
              )),
              15.horizontalSpace,
              Expanded(
                  child: PrimaryButton.minDark(
                onPressed: () {
                  context.push(TradeExecutionScreen());
                },
                color: AppColors.red,
                text: 'Sell',
                icon: const Icon(
                  Icons.arrow_downward,
                  color: AppColors.white,
                ),
              )),
            ],
          ),
          10.verticalSpace,
          TabBar(
            controller: _tabController,
            indicatorColor: AppColors.primary,
            dividerColor: AppColors.transparent,
            unselectedLabelColor: AppColors.textGray1,
            labelColor: const Color(0xFF315BF3),
            onTap: (value){
              setState(() {
                _currentTab=value;
              });
            },
            isScrollable: false,
            tabAlignment: TabAlignment.fill,
            labelStyle: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: List.generate(_tabs.length, (value) {
              final e = _tabs[value];
              return Tab(
                text: e,
              );
            }),
          ),
          20.verticalSpace,
        _currentTab==0?ChartTab():TradingNewsItems()
        ],
      ),
    )));
  }


}
