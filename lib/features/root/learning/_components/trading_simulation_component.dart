import 'package:marketmind/core/export/export.core.dart';

class TradingSimulationComponent extends StatelessWidget {
  const TradingSimulationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var bodyMedium2 = context.textTheme.bodyMedium;
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                  color: AppColors.onSurfaceCardColor, width: 1))),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Live Price Action Trading',
                  style: context.textTheme.titleSmall,
                ),
                10.verticalSpace,
                Text(
                  'Practice making real-time decisions based on current market conditions',
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: AppColors.textGray1),
                )
              ],
            ),
          ),
          20.verticalSpace,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: const ShapeDecoration(
                color: Color(0xFFF9FAFB),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(TextSpan(
                        text: 'Difficulty: ',
                        style:
                            bodyMedium2?.copyWith(fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: 'Advanced',
                              style: bodyMedium2?.copyWith(
                                  color: AppColors.textGray1))
                        ])),
                    20.horizontalSpace,
                    Text.rich(TextSpan(
                        text: 'Time: ',
                        style:
                            bodyMedium2?.copyWith(fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: '20-40 minutes',
                              style: bodyMedium2?.copyWith(
                                  color: AppColors.textGray1))
                        ]))
                  ],
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Not attempted yet',
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.textGray1),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 36,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 14),
                        decoration: ShapeDecoration(
                            color: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999))),
                        child: Text(
                          'Start Simulation',
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
