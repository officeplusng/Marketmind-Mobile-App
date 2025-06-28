import 'package:marketmind/core/export/export.core.dart';

class ReferralInfoModal extends StatelessWidget {
  const ReferralInfoModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModalParent(
        horizontalPadding: 5,
        verticalMargin: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseModalParent.modalPin(),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(Assets.referralIcon),
            ),
            15.verticalSpace,
            Align(
              alignment: Alignment.center,
              child: Text(
                "Partner Program Commissions",
                style: context.textTheme.titleSmall
                    ?.copyWith(color: AppColors.textBlack, fontSize: 20),
              ),
            ),
            20.verticalSpace,
            Text(
              "Earn recurring commissions through our 5-tier referral network:",
              style: context.textTheme.titleSmall
                  ?.copyWith(fontSize: 16, color: AppColors.textGray1),
            ),
            20.verticalSpace,
            ...[
              "Level 1 (Direct): 10% of subscription fee",
              "Level 2: 5% when your referrals invite others",
              "Level 3: 3% from third-level connections",
              "Level 4: 2% continues your passive income",
              "Level 5: 1% completes your network reach"
            ].map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.circle,
                        color: AppColors.textGray1,
                        size: 8,
                      ),
                      5.horizontalSpace,
                      Text(
                        e,
                        style: context.textTheme.titleSmall?.copyWith(
                            fontSize: 16, color: AppColors.textGray1),
                      )
                    ],
                  ),
                )),
            20.verticalSpace,
            Text(
              "Your commission is automatically calculated and paid monthly. All active subscribers can participate in the Partner Program with no additional fees.",
              style: context.textTheme.titleSmall
                  ?.copyWith(fontSize: 16, color: AppColors.textGray1),
            ),
            20.verticalSpace,
            Text(
              "Premium Partners receive faster payouts and bank transfer options.",
              style: context.textTheme.titleSmall
                  ?.copyWith(fontSize: 16, color: AppColors.textGray1),
            ),
            40.verticalSpace,
            PrimaryButton.primary(
              text: 'Close',
              onPressed: () {
                context.popDialog();
              },
            ),
            20.verticalSpace
          ],
        ));
  }
}
