import 'package:marketmind/core/export/export.core.dart';


class TradingSimulationComponent extends StatelessWidget {
  const TradingSimulationComponent(
      {super.key,
      this.lastScore,
      required this.title,
      required this.description,
      required this.difficulty});

  final String? lastScore;
  final String title;
  final String description;
  final String difficulty;

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
                title,
                  style: context.textTheme.titleSmall,
                ),
                10.verticalSpace,
                Text(
                description,
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
                              text: difficulty,
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
                      lastScore ?? 'Not attempted yet',
                      style: context.textTheme.bodyMedium?.copyWith(
                          color: lastScore != null
                              ? AppColors.primaryDark
                              : AppColors.textGray1),
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
