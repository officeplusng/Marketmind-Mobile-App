import 'package:marketmind/features/_shared/presentation/generic_empty_state.dart';
import 'package:marketmind/features/root/home/data/dto/trading_insight_dto.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/home/domain/entity/app_notification_entity.dart';
import 'package:marketmind/features/root/home/presentation/components/notification_component.dart';
import 'package:marketmind/features/root/settings/presentation/screens/notification_settings.dart';
import '../components/home_app_bar_action_icon.dart';

typedef TradingInsight = List<TradingInsightDto>;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

final tabs = ['Notifications', 'Price alerts'];

class _NotificationScreenState extends State<NotificationScreen>
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
                  GestureDetector(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                              side: BorderSide(color: AppColors.textGray12))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            color: AppColors.defaultButtonTextHomeColor,
                          ),
                          10.horizontalSpace,
                          Text(
                            'Mark all as read',
                            style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.defaultButtonTextHomeColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  HomeAppBarActionIcon(asset: Assets.settings,onClick: (){
                    context.push(const NotificationSettings());
                  },),
                ],
              )
            ],
          ),
          30.verticalSpace,
          Text(
            'Notifications',
            style: context.textTheme.headlineMedium
                ?.copyWith(color: AppColors.black, fontSize: 30),
          ),
          20.verticalSpace,
          //todo hide tab if notification is empty
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            width: 250,
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
              labelStyle: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
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
          Expanded(child: Builder(builder: (_) {
            final data = AppNotificationEntity.dummyNotifications;
            if (data.isEmpty) {
              return GenericEmptyState(
                  asset: Assets.notificationEmptyState,
                  title: 'No notifications yet',
                  description:
                      "Your AI trading alerts and market insights will appear here once you've received them.");
            }
            return ListView.separated(
                separatorBuilder: (_, index) => 10.verticalSpace,
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return NotificationComponent(
                      isRead: item.isRead,
                      asset:item.asset,
                      title: item.title,
                      content: item.content,
                      time: item.time);
                });
          }))
        ],
      )),
    );
  }
}
