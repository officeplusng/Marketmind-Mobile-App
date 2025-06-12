import 'package:marketmind/core/export/export.core.dart';

class MarketDataModal extends StatelessWidget {
  const MarketDataModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModalParent(
        horizontalPadding: 5,
        verticalMargin: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseModalParent.modalPin(),
            Row(
              children: [
                SvgPicture.asset(Assets.yellowInfoIcon),
                5.horizontalSpace,
                Text(
                  'Information',
                  style: context.textTheme.titleMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textBlack),
                )
              ],
            ),
            15.verticalSpace,
            Text(
              "Personalize your market data view to focus on the assets that matter most to your trading strategy. Choose which financial instruments to display, how they're organized, and what information is shown.",
              style: context.textTheme.titleSmall
                  ?.copyWith(color: AppColors.textGray1),
            ),
            20.verticalSpace,
            Text(
              "Your customized market data will be displayed on your dashboard and can be edited anytime. Premium subscribers can create unlimited watchlists and set up to 25 price alerts.",
              style: context.textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic, color: Color(0XFFB54708)),
            ),
            20.verticalSpace,
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
