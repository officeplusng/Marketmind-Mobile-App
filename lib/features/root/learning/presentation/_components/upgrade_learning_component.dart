import 'package:marketmind/core/export/export.core.dart';

class UpgradeLearningComponent extends StatelessWidget {
  const UpgradeLearningComponent({super.key,this.actionText,this.content});

  final String? actionText;
  final String? content;
  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        width: double.infinity,
        useHeight: false,
        backgroundColor: AppColors.gray,

        borderRadius: 12,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content??'Level up your trading skills! Unlock premium modules, live simulations, and your AI trading mentor.',
              style: context.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
            20.verticalSpace,
            GestureDetector(
              child: Text(
               actionText?? 'Upgrade now',
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.primary),
              ),
            )
          ],
        ));
  }
}
