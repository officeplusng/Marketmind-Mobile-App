import 'package:marketmind/core/export/export.core.dart';

class QuizCompleteScreen extends StatefulWidget {
  const QuizCompleteScreen({super.key});

  @override
  State<QuizCompleteScreen> createState() => _QuizCompleteScreenState();
}

class _QuizCompleteScreenState extends State<QuizCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: SafeArea(
            child: Column(
      children: [
        20.verticalSpace,
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_arrow_left,
                    size: 24,
                    color: AppColors.primary,
                  ),
                  10.horizontalSpace,
                  Text(
                    'Back to course',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: AppColors.primary),
                  )
                ],
              ),
            ),
          ),
        ),
        20.verticalSpace,
        WrapperContainer.rectangular(
            useHeight: false,
            useWidth: false,
            padding: const EdgeInsets.all(20),
            backgroundColor: const Color(0XFFF5F8FF),
            borderColor: const Color(0XFFBFCDFB),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.verticalSpace,
                SvgPicture.asset(
                  Assets.quizDone,
                  width: 60,
                  height: 60,
                ),
                20.verticalSpace,
                Text(
                  'Quiz Completed!',
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: AppColors.textBlack),
                ),
                20.verticalSpace,
                Text(
                  'Great job on completing the Support & Resistance Quiz',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: const Color(0XFF667085)),
                ),
                20.verticalSpace,
                PrimaryButton.primary(
                  text: 'Certificate',
                  icon: SvgPicture.asset(Assets.download01),
                ),
                5.verticalSpace,
                PrimaryButton.outlined(
                  text: 'Certificate',
                  iconStart: SvgPicture.asset(Assets.share07),
                  height: Dimens.buttonHeightMin,
                ),
                20.verticalSpace,
              ],
            ))
      ],
    )));
  }

  Widget _infoContainer(
      {required String text, Color? textColor, required String description}) {
    return WrapperContainer.rectangular(
      useHeight: false,
      useWidth: false,
      backgroundColor: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [Text(text), 10.verticalSpace, Text(description)],
      ),
    );
  }
}
