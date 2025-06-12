import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/learning/domain/entity/quiz_entity.dart';
import 'package:marketmind/features/root/home/presentation/components/home_app_bar_action_icon.dart';
import 'package:marketmind/features/root/learning/presentation/modals/quiz_progress_modal.dart';
import 'package:marketmind/features/root/learning/presentation/pages/quiz_complete_screen.dart';
import 'package:marketmind/features/root/learning/presentation/pages/quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;

  final Map<int, int> _selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    final currentQuestion =
        QuizEntity.forexQuizQuestions[_currentQuestionIndex];

    return BaseScaffold(
        child: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        _header(context),
        20.verticalSpace,
        _quizProgress(
            _currentQuestionIndex + 1, QuizEntity.forexQuizQuestions.length),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.verticalSpace,
              Text(
                currentQuestion.question,
                style: context.textTheme.titleMedium
                    ?.copyWith(color: AppColors.textBlack),
              ),
              20.verticalSpace,
              ...List.generate(currentQuestion.options.length, (e) {
                final selectedValue = _selectedOptions[_currentQuestionIndex];
                final value = currentQuestion.options[e];
                return _questionItemComponent(
                    onClick: () {
                      setState(() {
                        _selectedOptions[_currentQuestionIndex] = e;
                      });
                    },
                    choice: _numberToLetter(e + 1),
                    text: value,
                    selected: selectedValue == e);
              })
            ],
          ),
        )),
        10.verticalSpace,
        Row(
          children: [
            Expanded(
                child: PrimaryButton.primary(
              textColor: AppColors.textBlack,
              color: AppColors.white,
              onPressed: () {
                if (_currentQuestionIndex > 0) {
                  setState(() {
                    _currentQuestionIndex--;
                  });
                }
              },
              text: 'Previous',
              icon: const Icon(Icons.keyboard_arrow_left),
            )),
            100.horizontalSpace,
            Expanded(
                child: PrimaryButton.primary(
              onPressed: () {

                if (_currentQuestionIndex <
                    QuizEntity.forexQuizQuestions.length - 1) {
                  setState(() {
                    _currentQuestionIndex++;
                  });
                }else{
                  context.push(QuizCompleteScreen());
                }
              },
              text: 'Next',
              iconEnd: const Icon(
                Icons.keyboard_arrow_right,
                color: AppColors.white,
              ),
            )),
          ],
        ),
        20.verticalSpace,
      ],
    )));
  }

  String _numberToLetter(int number) {
    if (number < 1 || number > 26) {
      throw ArgumentError('Number must be between 1 and 26');
    }
    return String.fromCharCode(96 + number); // 'a' is ASCII 97
  }

  Widget _questionItemComponent(
      {required String choice,
      required String text,
      bool selected = false,
      VoidCallback? onClick}) {
    final style = context.textTheme.bodyMedium
        ?.copyWith(fontWeight: FontWeight.w500, color: AppColors.textBlack1);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onClick,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: ShapeDecoration(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                      width: 1,
                      color: selected
                          ? AppColors.primary
                          : const Color(0XFFEAECF0)))),
          child: Row(
            children: [
              Container(
                decoration: ShapeDecoration(
                    color: const Color(0XFFF2F4F7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                width: 35,
                height: 35,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    choice.toUpperCase(),
                    style: style,
                  ),
                ),
              ),
              10.horizontalSpace,
              Expanded(
                  child: Text(text,
                      style: style?.copyWith(
                          color: selected ? AppColors.primary : null)))
            ],
          ),
        ),
      ),
    );
  }

  Widget _quizProgress(int current, int total) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Question $current of $total',
          style: context.textTheme.bodyMedium
              ?.copyWith(color: AppColors.textGray1),
        ),
        5.verticalSpace,
        LinearProgressIndicator(
          value: ((current * 100) / total) / 100,
          backgroundColor: const Color(0XFFEAECF0),
          borderRadius: BorderRadius.circular(4),
          minHeight: 10,
          color: AppColors.primary,
        )
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeAppBarActionIcon(
          onClick: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 18,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.timer_sharp,
              color: AppColors.primary,
              size: 20,
            ),
            10.horizontalSpace,
            Text(
              '0:20',
              style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.textBlack),
            ),
            20.horizontalSpace,
            HomeAppBarActionIcon(
              onClick: () {
                ModalHelper.showModalMax(
                    context,
                    QuizProgressModal(
                      quiz: QuizEntity.forexQuizQuestions,
                      currentIndex: _currentQuestionIndex,
                      answered: _selectedOptions,
                    ));
              },
              child: const Icon(
                Icons.menu,
                size: 18,
              ),
            ),
          ],
        )
      ],
    );
  }
}
