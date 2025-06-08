import 'package:marketmind/core/export/export.core.dart';

class AiTradingFeedback extends StatelessWidget {
  const AiTradingFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_,state)=>AiTradingFeedbackComponent(), separatorBuilder: (_,a)=>10.verticalSpace, itemCount: 3);
  }
}

class AiTradingFeedbackComponent extends StatelessWidget {
  const AiTradingFeedbackComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        padding: const EdgeInsets.all(12),
        borderRadius: 8,
        useWidth: false,
        useHeight: false,
        bordered: true,
        borderColor: AppColors.containerBackground2,
        backgroundColor: AppColors.gray3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.idea),
            10.horizontalSpace,
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Feedback',
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.textBlack),
                ),
                10.verticalSpace,
                Text(
                  "Good decision to buy at this level. You’ve identified a strong support zone where price has bounced previously. Consider setting your take-profit at the next resistance level (1.0850) and your stop-loss just below the support (1.0780) for a positive risk-reward ratio.",
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.textGray1),
                )
              ],
            ))
          ],
        ));
  }
}
