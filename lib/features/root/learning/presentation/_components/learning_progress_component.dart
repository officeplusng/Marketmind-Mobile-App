import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';

class LearningProgressComponent extends StatelessWidget {
  const LearningProgressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
      useHeight: false,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        borderRadius: 16,
        bordered: true,
        borderColor: Color(0XFFDCFAE6),
        backgroundColor: Color(0xFFECFDF3),
        child: Column(
          children: [

            Row(
              children: [
                Text(
                  'Beginner',
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.black),
                )
              ],
            ),
            15.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Progress',style: context.textTheme.bodyMedium,),
                Text('100%',style: context.textTheme.bodyMedium,),
              ],
            ),
            5.verticalSpace,
            LinearProgressIndicator(
              value: .6,
              borderRadius: BorderRadius.circular(100),
              minHeight: 8,
              backgroundColor: AppColors.onSurfaceCardColor,
              color: AppColors.green,
            ),
            5.verticalSpace,
            Text(
              "Foundation complete! Review anytime to refresh your knowledge",
              style: context.textTheme.bodyMedium,
            )
          ],
        ));
  }
}
