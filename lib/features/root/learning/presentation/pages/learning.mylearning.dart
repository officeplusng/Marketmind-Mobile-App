import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';

import '../_components/course_item_component.dart';
import '../_components/learning_video_item_component.dart';
import '../_components/recommended_course.dart';

class MyLearningScreen extends StatefulWidget {
  const MyLearningScreen({super.key});

  @override
  State<MyLearningScreen> createState() => _MyLearningScreenState();
}

class _MyLearningScreenState extends State<MyLearningScreen> {
  @override
  Widget build(BuildContext context) {
    return PagePadding(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Continue where you left off',
          style:
              context.textTheme.titleMedium?.copyWith(color: AppColors.white),
        ),
        5.verticalSpace,
        Text(
          'Your personal AI trading mentor is ready to continue your journey today',
          style: context.textTheme.bodyMedium?.copyWith(color: AppColors.white),
        ),
        10.verticalSpace,
       Container(
         constraints: BoxConstraints(
           maxHeight: 250
         ),
         child:  ListView(
           shrinkWrap: true,
           scrollDirection: Axis.horizontal,
           children: [

             LearningVideoItemComponent(
                 thumbnail: 'thumbnail',
                 title: 'Technical Analysis: Support & Resistance',
                 timeRemaining: '17:43 remaining'),
             LearningVideoItemComponent(
                 thumbnail: 'thumbnail',
                 title: 'Technical Analysis: Support & Resistance',
                 timeRemaining: '17:43 remaining'),
             LearningVideoItemComponent(
                 thumbnail: 'thumbnail',

                 title: 'Technical Analysis: Support & Resistance',
                 timeRemaining: '17:43 remaining'),
           ],
         ),
       ),
        20.verticalSpace,
        Text('Your active courses',style: context.textTheme.titleSmall,),
        10.verticalSpace,
        ...[

          CourseItemComponent(buttonText: 'Start Course',),
          CourseItemComponent(buttonText: 'Start Course',),
          CourseItemComponent(buttonText: 'Start Course',),
        ],
        20.verticalSpace,
        RecommendedCourses(),
      ],
    ));
  }
}
