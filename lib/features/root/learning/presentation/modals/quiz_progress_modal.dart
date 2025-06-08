import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/learning/domain/entity/quiz_entity.dart';

class QuizProgressModal extends StatefulWidget {
  final List<QuizEntity> quiz;
  final int currentIndex;

  final Map<int, int> answered;

  const QuizProgressModal(
      {super.key,
      required this.quiz,
      required this.currentIndex,
      required this.answered});

  @override
  State<QuizProgressModal> createState() => _QuizProgressModalState();
}

class _QuizProgressModalState extends State<QuizProgressModal> {
  @override
  Widget build(BuildContext context) {
    return BaseModalParent(
        horizontalPadding: 5,
        scrollable: false,
        verticalMargin: 10,
        child: Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BaseModalParent.modalPin(),
            10.verticalSpace,
            SvgPicture.asset(Assets.quizDocument),
            10.verticalSpace,
            Text(
              'Quiz Progress',
              style: context.textTheme.headlineMedium?.copyWith(fontSize: 20),
            ),
            20.verticalSpace,
            Text(
              'Track your progress through the quiz',
              style: context.textTheme.titleSmall
                  ?.copyWith(color: AppColors.textGray1),
            ),
            20.verticalSpace,
            Expanded(child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.quiz.length,
              itemBuilder: (context, index) {
                final item = widget.quiz[index];
                return _questionItemComponent(
                    choice: (index + 1).toString(),
                    text: item.question,
                    answering: index == widget.currentIndex,
                    answered: widget.answered.containsKey(index));
              },
            )),
            20.verticalSpace,
            PrimaryButton.primary(
              onPressed: () {
                context.pop();
              },
              text: 'Continue Quiz',
            ),
            20.verticalSpace
          ],
        )));
  }

  Widget _questionItemComponent(
      {required String choice,
      required String text,
      bool answered = false,
      bool answering = false,
      VoidCallback? onClick}) {
    final style = context.textTheme.bodyMedium
        ?.copyWith(fontWeight: FontWeight.w500, color: AppColors.textBlack1);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                      width: 1,
                      color: answering
                          ? AppColors.primary
                          : const Color(0XFFEAECF0)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: ShapeDecoration(
                    color: answered
                        ? AppColors.green
                        : (answering
                            ? AppColors.primary
                            : const Color(0XFFF2F4F7)),
                    shape: const CircleBorder()),
                width: 35,
                height: 35,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    choice.toUpperCase(),
                    style: style?.copyWith(
                        color: answered || answering ? AppColors.white : null),
                  ),
                ),
              ),
              10.horizontalSpace,
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(answered || answering ? text : 'Question $choice',
                      style: style?.copyWith(
                          color: answering ? AppColors.primary : null,fontSize: 16,fontWeight: FontWeight.w500)),
                  if (answered || answering) ...[
                    5.verticalSpace,
                    Text(
                      answered ? 'Answered' : 'Currently answering',
                      style: context.textTheme.bodySmall?.copyWith(
                          color:
                              answered ? AppColors.green : AppColors.primary),
                    )
                  ]
                ],
              )),
              20.horizontalSpace,
              SvgPicture.asset(answered
                  ? Assets.checkboxCircle
                  : (answering ? Assets.rectangleVertical : Assets.lock01))
            ],
          ),
        ),
      ),
    );
  }
}
