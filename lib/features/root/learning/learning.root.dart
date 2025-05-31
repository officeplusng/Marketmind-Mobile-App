import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';
import 'package:marketmind/core/export/export.core.dart';

import '../component/custom_app_bar.dart';
import '../home/components/home_app_bar_action_icon.dart';

class LearningRoot extends StatefulWidget {
  const LearningRoot({super.key});

  @override
  State<LearningRoot> createState() => _LearningRootState();
}

class _LearningRootState extends State<LearningRoot>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final tabs = ["Home", "My Learning", "Trading Simulation"];

  int _currentTab = 0;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final faqContent = [
      (
        "How does the multi-level commission structure work?",
        "Commissions are automatically calculated daily and paid out on the 1st of every month, provided you've reached the minimum threshold of \$20. Payments are processed through your selected payment method in your account settings."
      ),
      (
        "When do I receive my commission payouts?",
        "Commissions are automatically calculated daily and paid out on the 1st of every month, provided you've reached the minimum threshold of \$20. Payments are processed through your selected payment method in your account settings."
      ),
      (
        "What happens if my referral cancels their subscription?",
        "If a referral cancels their subscription, you'll no longer receive commissions from their monthly payments. However, any commissions already earned from their previous payments remain in your account."
      )
    ];
    return BaseScaffold(
        backgroundColor: AppColors.white,
        horizontalPadding: 0,
        verticalPadding: 0,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .35,
              color: AppColors.primary,
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PagePadding(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Good morning, Ekene 👋',
                        style: context.textTheme.headlineMedium
                            ?.copyWith(fontSize: 20, color: AppColors.white),
                      ),
                      HomeAppBarActionIcon(
                        onClick: () {},
                        color: const Color(0xFF2D53DD),
                        child: SvgPicture.asset(
                          Assets.menuIcon,
                        ),
                      )
                    ],
                  )),
                  20.verticalSpace,
                  PagePadding(
                      child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: ShapeDecoration(
                        color: const Color(0xFF2D53DD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                                width: 1, color: Color(0xFF7595F7)))),
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: AppColors.primary,
                      dividerColor: AppColors.transparent,
                      unselectedLabelColor: const Color(0xFFBFCDFB),
                      labelColor: const Color(0xFF315BF3),
                      isScrollable: false,
                      tabAlignment: TabAlignment.fill,
                      labelStyle: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 2),
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
                  )),
                  20.verticalSpace,
                  Expanded(
                      child: SingleChildScrollView(
                    child: PagePadding(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your personal AI trading mentor is ready to continue your journey today',
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: AppColors.white),
                        ),
                        20.verticalSpace,
                        _container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.verticalSpace,
                            Center(
                              child: Image.asset(
                                Assets.illustration31,
                                width: 135,
                                height: 100,
                              ),
                            ),
                            20.verticalSpace,
                            Center(
                              child: Text(
                                'Ready to master forex trading?',
                                style: context.textTheme.titleSmall?.copyWith(
                                    fontSize: 20,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            10.verticalSpace,
                            Center(
                              child: Text(
                                'Start your AI-powered learning journey and become a confident trader',
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.textGray1),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            30.verticalSpace,
                            Text(
                              'Start with these popular courses',
                              style: context.textTheme.titleSmall,
                            ),
                            10.verticalSpace,
                          ],
                        )),
                        20.verticalSpace,
                        container(
                            title: 'Forex Fundamentals',
                            subtitle: 'Perfect for beginners • 12 lessons',
                            primaryColor: const Color(0xFF17B26A),
                            secondaryColor: const Color(0xFF47CD89),
                            endIcon: const Icon(
                              Icons.play_arrow,
                              color: AppColors.white,
                            ),
                            startIcon: SvgPicture.asset(
                              Assets.chart,
                              color: AppColors.white,
                            )),
                        10.verticalSpace,
                        container(
                            title: 'AI Trading Basics',
                            subtitle: 'Learn with AI assistance • 8 lessons',
                            primaryColor: const Color(0xFF7A5AF8),
                            secondaryColor: const Color(0xFF9B8AFB),
                            endIcon: const Icon(
                              Icons.play_arrow,
                              color: AppColors.white,
                            ),
                            startIcon: Icon(
                              Icons.star_border,
                              color: AppColors.white,
                            )),
                        20.verticalSpace,
                        WrapperContainer.rectangular(
                            width: double.infinity,
                            useHeight: false,
                            backgroundColor: AppColors.white,
                            borderColor: const Color(0xFFF2F4F7),
                            borderRadius: 8,
                            padding: const EdgeInsets.all(16),
                            bordered: true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Why learn with MarketMind?',
                                  style: context.textTheme.titleSmall
                                      ?.copyWith(color: AppColors.textBlack1),
                                ),
                                15.verticalSpace,
                                ...[
                                  (
                                    'AI-powered personalized learning paths',
                                    AppColors.primary
                                  ),
                                  (
                                    'Risk-free trading simulations',
                                    AppColors.purpleLight
                                  ),
                                  (
                                    'Real-time market insights',
                                    AppColors.textGreenLight
                                  ),
                                ].map((e) =>
                                    _infoComponent(text: e.$1, color: e.$2)),
                              ],
                            )),
                        50.verticalSpace,
                        Center(
                          child: _startLearningButton(context),
                        )
                      ],
                    )),
                  ))
                ],
              ),
            )
          ],
        ));
  }

  Widget _startLearningButton(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 18, vertical: 11),
        height: 44,
        decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                  color: const Color(0x1018280D)
                      .withOpacity(.05))
            ],
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadiusGeometry.circular(999),
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'page3'.svg,
              color: AppColors.white,
            ),
            15.horizontalSpace,
            Text(
              'Start Your Learning Journey',
              style: context.textTheme.titleSmall?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoComponent({Color? color, required String text}) => Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 10,
              color: color ?? AppColors.primary,
            ),
            10.horizontalSpace,
            Text(
              text,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontSize: 16, color: AppColors.textGray1),
            )
          ],
        ),
      );

  Widget container(
      {required String title,
      required String subtitle,
      required Widget startIcon,
      required Widget endIcon,
      VoidCallback? onClick,
      required Color primaryColor,
      required Color secondaryColor}) {
    return WrapperContainer.rectangular(
        width: double.infinity,
        useHeight: false,
        onClick: onClick,
        backgroundColor: primaryColor,
        borderRadius: 20,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        bordered: true,
        child: Row(
          children: [
            WrapperContainer(
                width: 40,
                height: 40,
                backgroundColor: secondaryColor,
                child: startIcon),
            10.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: AppColors.white),
                ),
                5.verticalSpace,
                Text(
                  subtitle,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.white),
                ),
              ],
            ),
            const Spacer(),
            WrapperContainer(
                width: 32,
                height: 32,
                backgroundColor: secondaryColor,
                child: endIcon)
          ],
        ));
  }

  Widget _container({required Widget child}) {
    return WrapperContainer.rectangular(
        width: double.infinity,
        useHeight: false,
        backgroundColor: AppColors.white,
        borderColor: const Color(0xFFF2F4F7),
        borderRadius: 20,
        padding: const EdgeInsets.all(16),
        bordered: true,
        child: child);
  }
}
