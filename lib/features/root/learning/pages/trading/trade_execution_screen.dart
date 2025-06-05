import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketmind/core/components/export.core.component.dart';
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
    return BaseScaffold(child: SafeArea(child: Column(
      children: [

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
      ],
    )));
  }
}
