import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/component/custom_app_bar.dart';
import 'package:marketmind/features/root/home/controllers/cubit/referral_cubit.dart';
import 'package:marketmind/features/root/home/controllers/cubit/referral_dashboard_cubit.dart';
import 'package:marketmind/features/root/home/data/dto/referral_dto.dart';
import 'package:marketmind/features/root/home/data/dto/referral_statistics_dto.dart';
import 'package:marketmind/features/root/home/presentation/referral/referral_list_page.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';
import '../../../../_shared/presentation/base_shimmer.dart';
import '../components/faq_component.dart';
import '../components/home_app_bar_action_icon.dart';
import '../components/referral_component.dart';

class ReferralDashboard extends StatefulWidget {
  const ReferralDashboard({super.key});

  @override
  State<ReferralDashboard> createState() => _ReferralDashboardState();
}

class _ReferralDashboardState extends State<ReferralDashboard> {
  bool viewingFaq = false;
  @override
  void initState() {
    context.read<ReferralsCubit>().fetchReferrals();
    context.read<ReferralDashboardCubit>().fetchReferralStatistics();
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
    return BlocBuilder<ReferralDashboardCubit,
        BaseState<ReferralStatisticsDto>>(builder: (context, state) {
      return BaseScaffold(
          backgroundColor: AppColors.white,
          isLoading : state is LoadingState,
          horizontalPadding: 0,
          verticalPadding: 0,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .4,
                color: AppColors.primary,
              ),
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PagePadding(
                        child: CustomAppBar(
                          backgroundColor: const Color(0xFF2D53DD),
                          iconColor: AppColors.white,
                          action: [
                            HomeAppBarActionIcon(
                              onClick: () {
                                //todo show referral info page
                              },
                              color: const Color(0xFF2D53DD),
                              child: const Icon(
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
                                      child: Builder(builder: (context){

                                        final data = state.data;
                                        if(data==null){
                                          return SizedBox();
                                        }
                                        return Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                _dashboardComponent(context,
                                                    title: "Total Referrals",
                                                    move: data.totalReferrals
                                                        ?.changeValue ??
                                                        0,
                                                    value: data.totalReferrals
                                                        ?.value),
                                                Spacer(),
                                                _dashboardComponent(context,
                                                    title: "Active Subscriptions",
                                                    move: data
                                                        .activeSubscriptions
                                                        ?.changeValue ??
                                                        0,
                                                    value:
                                                    data.activeSubscriptions
                                                        ?.value)
                                              ],
                                            ),
                                            20.verticalSpace,
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                _dashboardComponent(context,
                                                    title: "Total Earned",
                                                    move:
                                                    data.totalEarned
                                                        ?.changeValue ??
                                                        0,
                                                    value: data.totalEarned
                                                        ?.value),
                                                Spacer(),
                                                _dashboardComponent(context,
                                                    title: "Pending Payout",
                                                    move: data.pendingPayout
                                                        ?.changeValue ??
                                                        0,
                                                    value: data.pendingPayout
                                                        ?.value)
                                              ],
                                            )
                                          ],
                                        );
                                      })),
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Your Referrals",
                                                style: context.textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                    color: AppColors.textBlack1,
                                                    fontWeight: FontWeight
                                                        .w700),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  context.push(
                                                      ReferralListPage());
                                                },
                                                child: Row(
                                                  mainAxisSize: MainAxisSize
                                                      .min,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View All",
                                                      style: context
                                                          .textTheme.titleSmall
                                                          ?.copyWith(
                                                          color: AppColors
                                                              .primary),
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Referrals",
                                                style: context.textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                    color: AppColors.textBlack1,
                                                    fontWeight: FontWeight
                                                        .w700),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  context.read<ReferralsCubit>().fetchReferrals();
                                                  context.push(
                                                      ReferralListPage());
                                                },
                                                child: Row(
                                                  mainAxisSize: MainAxisSize
                                                      .min,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View All",
                                                      style: context
                                                          .textTheme.titleSmall
                                                          ?.copyWith(
                                                          color: AppColors
                                                              .primary),
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
                                          BlocBuilder<ReferralsCubit,
                                              BaseState<List<ReferralDto>>>(
                                              builder: (_, state) {
                                                final data = state.data ?? [];
                                                if(state is LoadingState){
                                                  return const BaseShimmer(
                                                    itemCount: 3,
                                                    radius: 8,
                                                    height: 90,
                                                  );
                                                }
                                                return ListView.separated(
                                                  shrinkWrap: true,
                                                    itemBuilder: (_, index) =>
                                                     ReferralComponent(data: data[index],),
                                                    separatorBuilder: (_,
                                                        _a) => 10.verticalSpace,
                                                    itemCount: data.length>5?5:data.length);
                                              }),
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
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              "Frequently Asked Questions",
                                              style: context.textTheme
                                                  .titleSmall
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
                                                      ? Icons
                                                      .keyboard_arrow_up_rounded
                                                      : Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: AppColors.primary,
                                                ))
                                          ],
                                        ),
                                        if (viewingFaq) ...[
                                          20.verticalSpace,
                                          ...faqContent.map((e) =>
                                              FaqComponent(
                                                  title: e.$1, content: e.$2))
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
                                              borderRadius: BorderRadius
                                                  .circular(12)),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFFCE9FFC),
                                                Color(0xFF7367F0)
                                              ])),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          WrapperContainer(
                                              width: 44,
                                              height: 44,
                                              backgroundColor: AppColors.white,
                                              child: SvgPicture.asset(
                                                  Assets.diamond)),
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
                                                ?.copyWith(
                                                color: AppColors.white),
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
    });
  }

  Widget _dashboardComponent(BuildContext context,
      {required String title,
        required dynamic value,
        int move = 0,
        bool loading = false}) {
    if (loading) {
      return Container();
    }
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
          value.toString(),
          style: context.textTheme.bodyMedium
              ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        Container(
          height: 24,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: ShapeDecoration(
              color: move > 0 ? AppColors.greenLight1 : AppColors.redLight,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Assets.trend,color: move > 0 ? AppColors.textGreen : AppColors.red,),
              5.horizontalSpace,
              Text(
                '${move > 0 ? '+' : ''}$move',
                style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: move > 0 ? AppColors.textGreen : AppColors.red),
              )
            ],
          ),
        )
      ],
    );
  }
}
