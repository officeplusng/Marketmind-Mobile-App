import 'package:marketmind/core/export/export.core.dart';

class TradeStatistics extends StatelessWidget {
  const TradeStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 2),
      children: const [
        TradeStatisticsComponent(),
        TradeStatisticsComponent(),
        TradeStatisticsComponent(),
        TradeStatisticsComponent(),
      ],
    );
  }
}

class TradeStatisticsComponent extends StatelessWidget {
  const TradeStatisticsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        useWidth: false,
        useHeight: false,
        backgroundColor: const Color(0XFFF2F4F7),
        borderRadius: 8,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Win Rate',
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.textGray1),
            ),
            10.verticalSpace,
            Text(
              '67%',
              style: context.textTheme.titleSmall,
            ),
          ],
        ));
  }
}
