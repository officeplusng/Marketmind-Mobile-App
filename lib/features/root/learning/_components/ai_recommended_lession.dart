import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';

import '../../../../core/components/round_container.dart';

class AiRecommendedLesson extends StatelessWidget {
  const AiRecommendedLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
      width: double.infinity,
      useHeight: false,
      backgroundColor: AppColors.primaryDark,
      borderRadius: 20,
      padding: const EdgeInsets.all(16),
      bordered: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI RECOMMENDED ',
            style: context.textTheme.bodyMedium
                ?.copyWith(fontSize: 14, color: const Color(0xFFFDE272)),
          ),
          20.verticalSpace,
          Text(
            'Risk Management: Position Sizing Techniques',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style:
                context.textTheme.titleMedium?.copyWith(color: AppColors.white),
          ),
          20.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.bar_chart,
                color: AppColors.white,
              ),
              15.horizontalSpace,
              Text(
                'Video lesson + simulation',
                style: context.textTheme.titleSmall
                    ?.copyWith(color: AppColors.white),
              )
            ],
          ),
          20.verticalSpace,
          Text(
            'This lesson addresses patterns in your recent practice trades',
            style:
                context.textTheme.bodyMedium?.copyWith(color: AppColors.white),
          )
        ],
      ),
    );
  }
}
