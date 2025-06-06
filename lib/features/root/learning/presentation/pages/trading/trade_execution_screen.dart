 import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/component/custom_app_bar.dart';
import 'package:marketmind/features/root/home/components/home_app_bar_action_icon.dart';

class TradeExecutionScreen extends StatefulWidget {
  const TradeExecutionScreen({super.key});

  @override
  State<TradeExecutionScreen> createState() => _TradeExecutionScreenState();
}

class _TradeExecutionScreenState extends State<TradeExecutionScreen> {
  @override
  Widget build(BuildContext context) {

    var copyWith =
    context.textTheme.bodyMedium?.copyWith(color: AppColors.textGray1);
    var boldStyle = copyWith?.copyWith(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack);
    return BaseScaffold(child: SafeArea(child: Column(
      children: [

        20.verticalSpace,
        CustomAppBar(
          backIcon: Icons.close,
          action: [
            HomeAppBarActionIcon(
              onClick: () {},
              color: AppColors.lightBlue,
              child:  const Icon(
                Icons.read_more,
                color: AppColors.primaryDark,
                size: 18,
              ),
            ),
          ],
        ),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              'EUR/USD',
              style: context.textTheme.titleMedium?.copyWith(fontSize: 28),
            )
          ],
        ),
        20.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Virtual Balance',
              style: copyWith,
            ),
            Text('Current Price', style: copyWith),
          ],
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$10,000.00',
              style: boldStyle,
            ),
            Text(
              '1.0815',
              style: boldStyle,
            ),
          ],
        ),
        10.verticalSpace,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Support: 10796',
              style: copyWith?.copyWith(color: AppColors.greenDark,fontWeight: FontWeight.w500),
            ),
            Text('Resistance: 1.085', style: copyWith?.copyWith(color: AppColors.red,fontWeight: FontWeight.w500)),
          ],
        ),
        20.verticalSpace,
      ],
    )));
  }
}
