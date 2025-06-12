import '../../../../core/export/export.core.dart';
import 'components/home_app_bar_action_icon.dart';
import 'components/trading_insight_component.dart';

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

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      horizontalPadding: 20,
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  HomeAppBarActionIcon(asset: Assets.bellIcon),
                  10.horizontalSpace,
                  HomeAppBarActionIcon(
                    asset: Assets.filterList,
                  ),
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
              labelStyle: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(vertical: 5),
              onTap: (value) {
                setState(() {
                  _currentTab = value;
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
          Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TradingInsightComponent();
                  }))
        ],
      )),
    );
  }
}
