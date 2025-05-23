import '../../../../core/export/export.core.dart';

class MarketAnalysisDashboardComponent extends StatelessWidget {
  const MarketAnalysisDashboardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        width: 168,
        backgroundColor: AppColors.white,
        borderColor: const Color(0xFFF2F4F7),
        useHeight: false,
        padding: const EdgeInsets.all(16),
        bordered: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DeFi TVL',
                style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textGray1, fontWeight: FontWeight.w500)),
            10.verticalSpace,
            Text(
              '\$45.8B',
              style: context.textTheme.headlineMedium,
            ),
            20.verticalSpace,
            _spikeIcon(context, text: '+1.25%'),
            15.verticalSpace,
            Text(
              '24h Change: +45.2B',
              maxLines: 1,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.textGray1),
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
