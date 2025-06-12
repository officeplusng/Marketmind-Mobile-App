import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/learning/presentation/_components/learning_next_step_component.dart';

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
      Expanded(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WrapperContainer.rectangular(
                useHeight: false,
                useWidth: false,
                padding: const EdgeInsets.all(20),
                backgroundColor: const Color(0XFFF5F8FF),
                borderColor: const Color(0XFFBFCDFB),
                borderRadius: 15,
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
                    Row(
                      children: [
                        Expanded(
                            child: _infoContainer(
                                text: '9/10',
                                description: 'Score',
                                textColor: AppColors.purpleDark)),
                        10.horizontalSpace,
                        Expanded(
                            child: _infoContainer(
                                text: '9%',
                                description: 'Accuracy',
                                textColor: AppColors.textGreen)),
                        10.horizontalSpace,
                        Expanded(
                            child: _infoContainer(
                                text: '5m 26s',
                                description: 'Time',
                                textColor: AppColors.orange)),
                      ],
                    ),
                    20.verticalSpace,
                    PrimaryButton.primary(
                      text: 'Certificate',
                      icon: SvgPicture.asset(Assets.download01),
                    ),
                    8.verticalSpace,
                    PrimaryButton.outlined(
                      text: 'Certificate',
                      iconStart: SvgPicture.asset(Assets.share07),
                      height: Dimens.buttonHeightMin,
                    ),
                    20.verticalSpace,
                  ],
                )),
            40.verticalSpace,
            Text(
              'Next Steps',
              style: context.textTheme.titleMedium
                  ?.copyWith(color: AppColors.textBlack),
            ),
            20.verticalSpace,
            LearningNextStepComponent(
                assetName: Assets.courseModule,
                title: 'Continue to Next Module',
                actionText: 'Begin Module',
                description: 'Advance to Forex Price Action Strategies module'),
            40.verticalSpace,
            Text(
              'Performance Analysis',
              style: context.textTheme.titleMedium
                  ?.copyWith(color: AppColors.textBlack),
            ),
            20.verticalSpace,

            WrapperContainer.rectangular(
                useHeight: false,
                useWidth: false,
                padding: const EdgeInsets.all(16),
                backgroundColor: const Color(0XFFF5F8FF),
                borderColor: const Color(0XFFBFCDFB),
                borderRadius: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(),
                    Text('Accuracy by Topic',style: context.textTheme.titleSmall?.copyWith(color: AppColors.textGray1),),
                    20.verticalSpace,
                    _progressIndicator(title: 'Support Level identification', value: 100,color: const Color(0XFF079455)),
                    20.verticalSpace,
                    _progressIndicator(title: 'Resistance Level Identification', value: 100,color: const Color(0XFF079455)),
                    20.verticalSpace,
                    _progressIndicator(title: 'Trading Strategies', value: 75,color: const Color(0XFFDC6803)),
                    20.verticalSpace,
                    _progressIndicator(title: 'Market Psychology', value: 75,color: const Color(0XFFDC6803)),
                    30.verticalSpace,

                  ],
                )),
            50.verticalSpace,
          ],
        ),
      ))
      ],
    )));
  }

  Widget _progressIndicator({required String title,required int value,Color? color}){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textBlack1),),
            Text('$value%',style: context.textTheme.bodyMedium?.copyWith(color: AppColors.textBlack1),),

          ],
        ),
        10.verticalSpace,
        LinearProgressIndicator(
          value: value/100,
          color: color,
          borderRadius: BorderRadius.circular(4),
          minHeight: 8,
          backgroundColor:const Color(0XFFEAECF0) ,
        )
      ],
    );
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
        children: [
          Text(
            text,
            style: context.textTheme.titleSmall
                ?.copyWith(color: textColor, fontWeight: FontWeight.w700),
          ),
          10.verticalSpace,
          Text(
            description,
            style: context.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF475467),
                fontSize: 12,
                letterSpacing: .5),
          )
        ],
      ),
    );
  }
}
