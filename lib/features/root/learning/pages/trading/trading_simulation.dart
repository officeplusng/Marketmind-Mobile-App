import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/component/custom_app_bar.dart';
import 'package:marketmind/features/root/home/components/home_app_bar_action_icon.dart';
import 'package:marketmind/features/root/learning/pages/trading/trade_execution_screen.dart';

class TradingSimulationScreen extends StatefulWidget {
  const TradingSimulationScreen({super.key});

  @override
  State<TradingSimulationScreen> createState() =>
      _TradingSimulationScreenState();
}

class _TradingSimulationScreenState extends State<TradingSimulationScreen> with SingleTickerProviderStateMixin {

  TabController? _tabController;

  final _tabs = ['Chart', 'News'];
  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var copyWith =
        context.textTheme.bodyMedium?.copyWith(color: AppColors.textGray1);
    var boldStyle = copyWith?.copyWith(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack);
    return BaseScaffold(
        child: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  onPressed: (){
                    context.push(TradeExecutionScreen());},
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
                  onPressed: (){
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
        )
      ],
    )));
  }
}
