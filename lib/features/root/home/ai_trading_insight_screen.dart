import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';
import 'package:marketmind/features/root/home/components/trading_insight_component.dart';
import '../../../core/export/export.core.dart';
import 'components/home_app_bar_action_icon.dart';

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
    return GradientScaffold(
      backgroundAsset: Assets.homeGradient,
      horizontalPadding: 20,
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
          TabBar(
            controller: _tabController,
            indicatorColor: AppColors.primary,
            dividerColor: AppColors.transparent,
            unselectedLabelColor: const Color(0xFF667085),
            labelColor: const Color(0xFF344054),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelStyle: context.textTheme.bodyMedium,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.symmetric(vertical: 8),
            onTap: (value) {
              setState(() {
                _currentTab = value;
              });
            },
            indicator: ShapeDecoration(
              color: AppColors.grayDark,
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
          10.verticalSpace,
         Expanded(child:  ListView.builder(
             itemCount: 15,
             shrinkWrap: true,
             itemBuilder: (context, index) {
               return TradingInsightComponent();
             }))
        ],
      ),
    );
  }
}
