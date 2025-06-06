import 'package:marketmind/core/export/export.core.dart';


class TradingNewsItems extends StatelessWidget {
  const TradingNewsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        TradingNewsComponent(),
        10.verticalSpace,
        TradingNewsComponent(),
        10.verticalSpace,
        TradingNewsComponent(),
        10.verticalSpace,
      ],
    );
  }
}

class TradingNewsComponent extends StatelessWidget {
  const TradingNewsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        useWidth: false,
        useHeight: false,
        backgroundColor: AppColors.white,
        borderRadius: 12,
        padding: const EdgeInsets.all(16),
        borderColor: const Color(0XFFEAECF0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(),
            Text(
              'ECP Interest Rate Decision',
              style: context.textTheme.titleSmall,
            ),
            10.verticalSpace,
            Text(
              'The European Central Bank maintained interest rates at 3.75%, in line with market expectations. ECB President Christine Lagrade indicated that inflation remains a concern but economic growth is showing signs of stabilization.',
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.textGray1),
            ),
            20.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const  Icon(
                  Icons.access_time_outlined,
                  size: 10,
                  color: AppColors.textGray1,
                ),
                5.horizontalSpace,
                Text(
                  '2 hours ago',
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: AppColors.textBlack1),
                )
              ],
            )
          ],
        ));
  }
}
