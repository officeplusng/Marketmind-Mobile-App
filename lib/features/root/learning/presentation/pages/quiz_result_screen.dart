import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/home/components/home_app_bar_action_icon.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({super.key});

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: SafeArea(child: Column(
          children: [


            20.verticalSpace,
            _header(context),
          ],
        )));
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
        Text(
          'Quiz Result',
          style: context.textTheme.titleMedium
              ?.copyWith(color: const Color(0XFF101828)),
        ),
        GestureDetector(
          child: Container(
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            decoration: ShapeDecoration(
                color: const Color(0XFF315BF3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999))),
            child: Text(
              'Continue',
              style: context.textTheme.titleSmall
                  ?.copyWith(color: AppColors.white),
            ),
          ),
        )
      ],
    );
  }
}
