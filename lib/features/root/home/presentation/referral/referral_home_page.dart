import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/_shared/data/dto/user_dto.dart';
import 'package:marketmind/features/root/component/custom_app_bar.dart';
import 'package:marketmind/features/root/home/presentation/referral/referral_dashboard.dart';
import 'package:marketmind/src/presentation/snack_bar_helper.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

class ReferralHomePage extends StatefulWidget {
  const ReferralHomePage({super.key});

  @override
  State<ReferralHomePage> createState() => _ReferralHomePageState();
}

class _ReferralHomePageState extends State<ReferralHomePage> {
  bool viewContent = false;

  @override
  Widget build(BuildContext context) {
    final content = [
      (
        "Share Your Invitation",
        "Share your unique referral code, custom link, or QR code with fellow traders and investors interested in AI-powered trading insights."
      ),
      (
        "They Join MarketMind",
        "Your connections sign up using your referral code and subscribe to any of our plans, from Insight Basic to Professional."
      ),
      (
        "You Earn Ongoing Commissions",
        "Receive 10% commission on direct referrals' subscription fees. As your network grows, earn additional commissions from their referrals - up to 5 levels deep."
      ),
      (
        "Automated Tracking & Payments",
        "Our AI automatically calculates your earnings and processes monthly payouts. Monitor your entire referral network in real-time through your Partner Dashboard."
      )
    ];
    return BlocBuilder<AccountCubit, BaseState<UserDto>>(
        builder: (context, state) {
      final data = state.data;
      final nameSplit = data?.fullname?.split(' ');
      return BaseScaffold(
          child: SafeArea(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          CustomAppBar(
            action: [_dashboardButton()],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFF2F4F7)),
                          borderRadius: BorderRadius.circular(24)),
                      color: AppColors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.verticalSpace,
                      Center(
                        child: Image.asset(
                          Assets.referralIllustration,
                          width: 140,
                          height: 140,
                        ),
                      ),
                      20.verticalSpace,
                      Text(
                        "Grow your income with every referral",
                        style: context.textTheme.bodyLarge?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textBlack1),
                      ),
                      10.verticalSpace,
                      Text(
                        "Earn up to 10% on direct referrals and 5% on their referrals, down to 5 levels deep",
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.defaultButtonTextHomeColor),
                      ),
                      10.verticalSpace,
                      Text(
                        "Your unique referral code",
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.defaultButtonTextHomeColor,
                            fontSize: 16),
                      ),
                      10.verticalSpace,
                      WrapperContainer.rectangular(
                          height: 42,
                          width: double.infinity,
                          onClick: () {
                            AppSnackBarHelper.showCopiedSnackBar(context);
                            FlutterClipboard.copy('hello flutter friends');
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          borderColor: const Color(0xFFEAECF0),
                          backgroundColor: const Color(0xFFFCFCFD),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data?.referralCode ?? '',
                                style: context.textTheme.titleSmall,
                              ),
                              GestureDetector(
                                onTap: () {
                                  FlutterClipboard.copy(
                                      data?.referralCode ?? '');
                                  AppSnackBarHelper.showCopiedSnackBar(context);
                                },
                                child: Icon(Iconsax.copy),
                              )
                            ],
                          )),
                      30.verticalSpace,
                      PrimaryButton.primary(
                        text: 'Invite & Earn',
                      ),
                      5.verticalSpace,
                      Center(
                        child: Text(
                          "Share with fellow traders and start building your network today!",
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontSize: 12, color: AppColors.textGray1),
                        ),
                      ),
                      20.verticalSpace
                    ],
                  ),
                ),
                20.verticalSpace,
                Text(
                  "Your unique link",
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.defaultButtonTextHomeColor,
                      fontSize: 16),
                ),
                10.verticalSpace,
                WrapperContainer.rectangular(
                    height: 42,
                    width: double.infinity,
                    onClick: () {
                      AppSnackBarHelper.showCopiedSnackBar(context);
                      FlutterClipboard.copy('hello flutter friends');
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    bordered: true,
                    borderColor: Color(0xFFEAECF0),
                    backgroundColor: Color(0xFFFCFCFD),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          "https://getmarketmind.com/register?inviteCode=${data?.referralCode ?? ''}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleSmall,
                        )),
                        20.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            FlutterClipboard.copy(
                                "https://getmarketmind.com/register?inviteCode=${data?.referralCode ?? ''}");
                            AppSnackBarHelper.showCopiedSnackBar(context);
                          },
                          child: Icon(Iconsax.copy),
                        )
                      ],
                    )),
                40.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "How it works",
                      style: context.textTheme.titleSmall?.copyWith(
                          color: viewContent
                              ? AppColors.primary
                              : AppColors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          viewContent = !viewContent;
                        });
                      },
                      child: WrapperContainer(
                          width: 36,
                          backgroundColor: Color(0xFFF2F4F7),
                          height: 36,
                          child: Icon(
                            viewContent
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: viewContent
                                ? AppColors.primary
                                : AppColors.black,
                          )),
                    )
                  ],
                ),
                20.verticalSpace,
                if (viewContent)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                        color: const Color(0xFFF2F4F7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: content.map((e) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.$1,
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(color: const Color(0xFF101828)),
                            ),
                            5.verticalSpace,
                            Text(
                              e.$2,
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(color: const Color(0xFF667085)),
                            ),
                            10.verticalSpace,
                          ],
                        );
                      }).toList(),
                    ),
                  )
              ],
            ),
          ))
        ],
      )));
    });
  }

  Widget _dashboardButton() => InkWell(
        radius: 999,
        onTap: () {
          context.push(const ReferralDashboard());
        },
        child: Container(
          width: 100,
          height: 40,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFD0D5DD)),
                  borderRadius: BorderRadius.circular(999))),
          child: Center(
              child: Text(
            'Dashboard',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Color(0xFF344054),
            ),
          )),
        ),
      );
}
