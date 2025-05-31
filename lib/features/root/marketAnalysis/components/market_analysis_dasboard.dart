import '../../../../core/export/export.core.dart';

class MarketAnalysisDashboardComponent extends StatelessWidget {
  const MarketAnalysisDashboardComponent({super.key,this.backgroundColor,this.textColor});

  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        backgroundColor:backgroundColor?? AppColors.white,
        borderColor: backgroundColor??const Color(0xFFF2F4F7),
        useHeight: false,
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 16),
        bordered: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DeFi TVL',
                style: context.textTheme.bodyMedium?.copyWith(
                    color: textColor??AppColors.textGray1, fontWeight: FontWeight.w500)),
            10.verticalSpace,
            Text(
              '\$45.8B',
              style: context.textTheme.headlineMedium?.copyWith(color: textColor),
            ),
            20.verticalSpace,
            _spikeIcon(context, text: '+1.25%'),
            15.verticalSpace,
            Text(
              '24h Change: +45.2B',
              maxLines: 1,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: textColor??AppColors.textGray1),
            )
          ],
        ));
  }

  Widget _spikeIcon(BuildContext context,
      {Color? color, Color? textColor, required String text}) {
    return Container(
      height: 21,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: ShapeDecoration(
          color: color ?? AppColors.greenLight1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.trend),
          5.horizontalSpace,
          Text(
            '+5',
            style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: textColor ?? AppColors.textGreen),
          )
        ],
      ),
    );
  }
}
