
import 'package:marketmind/core/export/export.core.dart';

class WatchListInfoModal extends StatelessWidget {
  const WatchListInfoModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModalParent(
        child: Column(
      children: [
        10.verticalSpace,
        Center(
          child: BaseModalParent.modalPin(margin: 5),
        ),
        20.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.infoAsset),
            5.horizontalSpace,
            Text(
              'Information',
              style: context.textTheme.titleMedium
                  ?.copyWith(fontSize: 20, color: AppColors.textBlack),
            )
          ],
        ),
        10.verticalSpace,
        Text(
          "Personalize your market data view to focus on the assets that matter most to your trading strategy. Choose which financial instruments to display, how they're organized, and what information is shown.",
          style: context.textTheme.titleSmall
              ?.copyWith(color: AppColors.textGray1),
        ),
        10.verticalSpace,

        WrapperContainer.rectangular(
            useHeight: false,
            useWidth: false,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            bordered: true,
            backgroundColor: Color(0XFFFFFAEB),
            borderRadius: 8,
            borderColor: Color(0XFFFEF0C7),
            child: Text.rich(TextSpan(
                style: context.textTheme.bodyMedium?.copyWith(
                    color: Color(0XFFDC6803), fontWeight: FontWeight.w700),
                text: '',
                children: [
                  TextSpan(
                      style: context.textTheme.bodyMedium?.copyWith(
                          color: Color(0XFFDC6803),
                          fontWeight: FontWeight.w500),
                      text:
                      "Your customized market data will be displayed on your dashboard and can be edited anytime. Premium subscribers can create unlimited watchlists and set up to 25 price alerts.")
                ]))),
        20.verticalSpace,
        PrimaryButton.primary(text: 'Close',onPressed: (){
          context.pop();
        },),
        20.verticalSpace,
      ],
    ));
  }
}
