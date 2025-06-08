import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketmind/core/export/export.core.dart';

import '../../../../../../../core/assets/assets.dart';
import '../../../../../../../core/components/buttons/app_button.dart';
import '../../../_components/ai_trading_feedback.dart';
import '../../../_components/expandable_info_component.dart';
import '../../../_components/opened_position_component.dart';
import '../../../_components/trade_statistics_component.dart';

class ChartTab extends StatelessWidget {
  const ChartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandableInfoComponent(
            child: AiTradingFeedback(), title: 'AI Commentary'),
        5.verticalSpace,
        ExpandableInfoComponent(
            child: OpenedPosition(), title: 'Opened Positions'),
        5.verticalSpace,
        ExpandableInfoComponent(
          child: TradeStatistics(), title: 'Trade Statistics',divide: false,),
        50.verticalSpace,
        PrimaryButton.primary(
          height: 44,
          icon: SvgPicture.asset(Assets.rotate),
          text: 'Complete & View Results',
        ),
        10.verticalSpace,
        Text(
          'Goal: Apply support & resistance trading strategies in the current market scenario',
          style: context.textTheme.bodySmall
              ?.copyWith(color: AppColors.textGray1),
          textAlign: TextAlign.center,
        ),
        50.verticalSpace,
      ],
    );
  }
}
