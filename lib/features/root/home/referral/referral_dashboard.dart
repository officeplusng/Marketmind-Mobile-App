import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/component/custom_app_bar.dart';
import 'package:marketmind/features/root/home/components/faq_component.dart';
import 'package:marketmind/features/root/home/components/home_app_bar_action_icon.dart';
import 'package:marketmind/features/root/home/referral/referral_list_page.dart';

import '../components/referral_component.dart';

class ReferralDashboard extends StatefulWidget {
  const ReferralDashboard({super.key});

  @override
  State<ReferralDashboard> createState() => _ReferralDashboardState();
}

class _ReferralDashboardState extends State<ReferralDashboard> {
  bool viewingFaq = false;

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
              height: MediaQuery.of(context).size.height * .4,
              color: AppColors.primary,
            ),
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PagePadding(
                      child: CustomAppBar(
                    backgroundColor: Color(0xFF2D53DD),
                    iconColor: AppColors.white,
                    action: [
                      HomeAppBarActionIcon(
                        onClick: () {},
                        color:const Color(0xFF2D53DD),
                        child: Icon(
                          Icons.info_outline,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  )),
                  20.verticalSpace,
                  Expanded(
                      child: SingleChildScrollView(
                    child: PagePadding(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Referral Dashboard',
                          style: context.textTheme.headlineMedium
                              ?.copyWith(color: AppColors.white),
                        ),
                        10.verticalSpace,
                        Text(
                          "Track your referrals, earnings, and grow your network",
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: AppColors.white),
                        ),
                        20.verticalSpace,
                        WrapperContainer.rectangular(
                            borderColor: Color(0xFFF2F4F7),
                            backgroundColor: AppColors.white,
                            padding: EdgeInsets.all(16),
                            borderRadius: 16,
                            bordered: true,
                            width: double.infinity,
                            useHeight: false,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _dashboardComponent(context,
                                        title: "Total Referrals", value: "502"),
                                    Spacer(),
                                    _dashboardComponent(context,
                                        title: "Active Subscriptions",
                                        value: "40")
                                  ],
                                ),
                                20.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _dashboardComponent(context,
                                        title: "Total Earned", value: "\$69.3"),
                                    Spacer(),
                                    _dashboardComponent(context,
                                        title: "Pending Payout", value: "\$50")
                                  ],
                                )
                              ],
                            )),
                        20.verticalSpace,
                        //
                        WrapperContainer.rectangular(
                            width: double.infinity,
                            useHeight: false,
                            backgroundColor: AppColors.white,
                            borderColor: const Color(0xFFF2F4F7),
                            padding: const EdgeInsets.all(16),
                            bordered: true,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Your Referrals",
                                      style: context.textTheme.titleSmall
                                          ?.copyWith(
                                          color: AppColors.textBlack1,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        context.push(ReferralListPage());
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "View All",
                                            style: context.textTheme.titleSmall
                                                ?.copyWith(
                                                color: AppColors.primary),
                                          ),
                                          3.horizontalSpace,
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: AppColors.primary,
                                            size: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                const ReferralComponent(),
                                5.verticalSpace,
                                const ReferralComponent(),
                                5.verticalSpace,
                                const ReferralComponent(),
                                5.verticalSpace,
                                const ReferralComponent(),
                                5.verticalSpace,
                                const ReferralComponent(),
                                5.verticalSpace,
                              ],
                            )),
                        //
                        20.verticalSpace,
                        WrapperContainer.rectangular(
                            width: double.infinity,
                            useHeight: false,
                            backgroundColor: AppColors.white,
                            borderColor: const Color(0xFFF2F4F7),
                            padding: const EdgeInsets.all(16),
                            bordered: true,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Referrals",
                                      style: context.textTheme.titleSmall
                                          ?.copyWith(
                                              color: AppColors.textBlack1,
                                              fontWeight: FontWeight.w700),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        context.push(ReferralListPage());
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "View All",
                                            style: context.textTheme.titleSmall
                                                ?.copyWith(
                                                    color: AppColors.primary),
                                          ),
                                          3.horizontalSpace,
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: AppColors.primary,
                                            size: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                10.verticalSpace,
                                const ReferralComponent(),
                                5.verticalSpace,
                                const ReferralComponent(),
                                5.verticalSpace,
                                ReferralComponent(),
                                5.verticalSpace,
                                ReferralComponent(),
                                5.verticalSpace,
                                ReferralComponent(),
                                5.verticalSpace,
                              ],
                            )),
                        20.verticalSpace,
                        WrapperContainer.rectangular(
                          width: double.infinity,
                          useHeight: false,
                          backgroundColor: AppColors.white,
                          borderColor: const Color(0xFFF2F4F7),
                          padding: const EdgeInsets.all(16),
                          bordered: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Frequently Asked Questions",
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(
                                            color: AppColors.textBlack1,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  WrapperContainer(
                                      width: 36,
                                      onClick: () {
                                        setState(() {
                                          viewingFaq = !viewingFaq;
                                        });
                                      },
                                      borderColor: Color(0xFFF2F4F7),
                                      bordered: true,
                                      height: 36,
                                      child: Icon(
                                        viewingFaq
                                            ? Icons.keyboard_arrow_up_rounded
                                            : Icons.keyboard_arrow_down_rounded,
                                        color: AppColors.primary,
                                      ))
                                ],
                              ),
                              if (viewingFaq) ...[
                                20.verticalSpace,
                                ...faqContent.map((e) =>
                                    FaqComponent(title: e.$1, content: e.$2))
                              ]
                            ],
                          ),
                        ),
                        20.verticalSpace,
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                gradient: const LinearGradient(colors: [
                                  Color(0xFFCE9FFC),
                                  Color(0xFF7367F0)
                                ])),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                WrapperContainer(
                                    width: 44,
                                    height: 44,
                                    backgroundColor: AppColors.white,
                                    child: SvgPicture.asset(Assets.diamond)),
                                20.verticalSpace,
                                Text(
                                  "Ready to boost your earnings?",
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white),
                                ),
                                10.verticalSpace,
                                Text(
                                  'Spread the word about MarketMind and watch your commissions grow!',
                                  style: context.textTheme.bodyMedium
                                      ?.copyWith(color: AppColors.white),
                                ),
                                20.verticalSpace,
                                PrimaryButton.light(
                                  text: 'Invite & Earn',
                                )
                              ],
                            )),

                        20.verticalSpace,
                      ],
                    )),
                  ))
                ],
              ),
            )
          ],
        ));
  }

  Widget _dashboardComponent(BuildContext context,
      {required String title, required String value}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textGray1, fontWeight: FontWeight.w500),
        ),
        10.verticalSpace,
        Text(
          value,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        Container(
          height: 24,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: ShapeDecoration(
              color: AppColors.greenLight1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Assets.trend),
              5.horizontalSpace,
              Text(
                '+5',
                style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.textGreen),
              )
            ],
          ),
        )
      ],
    );
  }
}
