import 'package:marketmind/core/export/export.core.dart';

enum QuizStatus { done, pending, locked }

class QuizData {
  final String title;
  final String description;
  final QuizStatus status;

  const QuizData(
      {required this.status, required this.description, required this.title});
}

final List<QuizData> dummyQuizzes = [
  QuizData(
    title: "Introduction to Flutter",
    description: "Learn the basics of Flutter framework.",
    status: QuizStatus.done,
  ),
  QuizData(
    title: "State Management",
    description: "Understand different ways to manage state in Flutter.",
    status: QuizStatus.pending,
  ),
  QuizData(
    title: "Animations in Flutter",
    description: "Explore implicit and explicit animations.",
    status: QuizStatus.locked,
  ),
  QuizData(
    title: "Dart Basics",
    description: "Review variables, loops, and functions in Dart.",
    status: QuizStatus.done,
  ),
  QuizData(
    title: "Networking",
    description: "Learn how to fetch data from APIs in Flutter.",
    status: QuizStatus.pending,
  ),
  QuizData(
    title: "Firebase Integration",
    description: "Connect your Flutter app to Firebase services.",
    status: QuizStatus.locked,
  ),
];

class CourseDetailsQuiz extends StatefulWidget {
  const CourseDetailsQuiz({super.key});

  @override
  State<CourseDetailsQuiz> createState() => _CourseDetailsQuizState();
}

class _CourseDetailsQuizState extends State<CourseDetailsQuiz> {
  @override
  Widget build(BuildContext context) {
    var copyWith = context.textTheme.bodyMedium?.copyWith(color: AppColors.primary);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(
             'Quiz (12)',
             style: context.textTheme.titleMedium
                 ?.copyWith(color: AppColors.textBlack),
           ),
           WrapperContainer.rectangular(
             useHeight: false,
               useWidth: false,
               borderRadius: 100,
               padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
               backgroundColor:const Color(0XFFEAEDFE) ,
               child: Row(

                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('4 Completed ',style: copyWith),
                   Text('\t\t|\t\t',style: copyWith,),
                   Text('8 Remaining',style: copyWith),
                 ],
               ))

         ],
       ),
        20.verticalSpace,
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final item = dummyQuizzes[index];
              return QuizItemComponent(
                  status: item.status,
                  title: item.title,
                  description: item.description);
            },
            separatorBuilder: (_, a) => 10.verticalSpace,
            itemCount: dummyQuizzes.length)
      ],
    );
  }
}

class QuizItemComponent extends StatelessWidget {
  const QuizItemComponent(
      {super.key,
      required this.status,
      required this.title,
      required this.description});

  final QuizStatus status;
  final String title;
  final String description;

  String icon() {
    if (status == QuizStatus.done) {
      return Assets.quizDone;
    }
    if (status == QuizStatus.locked) {
      return Assets.quizLock;
    }
    return Assets.quizPending;
  }

  Color getColor() {
    if (status == QuizStatus.done) {
      return const Color(0XFFECFDF3);
    }
    if (status == QuizStatus.locked) {
      return const Color(0XFFF9FAFB);
    }
    return const Color(0XFFFFFAEB);
  }

  Color getBorder() {
    if (status == QuizStatus.done) {
      return const Color(0XFFDCFAE6);
    }
    if (status == QuizStatus.locked) {
      return const Color(0XFFEAECF0);
    }
    return const Color(0XFFFEF0C7);
  }

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        useWidth: false,
        useHeight: false,
        borderColor: getBorder(),
        borderRadius: 12,
        backgroundColor: getColor(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(icon()),
                10.horizontalSpace,
                Text(
                  title,
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.textBlack),
                )
              ],
            ),
            15.verticalSpace,
            Text(
              description,
              style: context.textTheme.titleSmall?.copyWith(
                  color: AppColors.textGray1, fontWeight: FontWeight.w500),
            ),
            15.verticalSpace,
            Row(
              spacing: 10,
              children: [
                ...['Score: 92/100', 'Feedback: 2 comments'].map((e) => Text(
                      e,
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.textGray1),
                    ))
              ],
            ),
            15.verticalSpace,
            if (status == QuizStatus.locked)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.access_time_outlined,
                    size: 14,
                    color: AppColors.textGray1,
                  ),
                  10.horizontalSpace,
                  Text(
                    'Complete Lesson 6 to unlock this assignment',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: AppColors.textGray1),
                  )
                ],
              )
            else
              InkWell(
                onTap: () {},
                child: Text(
                  'View Submission',
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.primary),
                ),
              )
          ],
        ));
  }
}
