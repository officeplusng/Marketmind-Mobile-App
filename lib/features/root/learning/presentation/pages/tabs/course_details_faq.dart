import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';

class CourseDetailsFaq extends StatefulWidget {
  const CourseDetailsFaq({super.key});

  @override
  State<CourseDetailsFaq> createState() => _CourseDetailsFaqState();
}

final faqContent = [
  (
    'Do I need prior experience with technical analysis to take this course?',
    "While some familiarity with basic technical analysis concepts would be helpful, this course is designed to be accessible to traders with minimal experience. We start with the fundamentals and gradually progress to more advanced techniques. If you're completely new to technical analysis, we recommend taking our Introduction to Technical Analysis course first, but it's not required."
  ),
  (
    'How long will I have access to the course materials?',
    "While some familiarity with basic technical analysis concepts would be helpful, this course is designed to be accessible to traders with minimal experience. We start with the fundamentals and gradually progress to more advanced techniques. If you're completely new to technical analysis, we recommend taking our 'Introduction to Technical Analysis' course first, but it's not required."
  ),
  (
    'Do I need to purchase any specific software or tools for this course?',
    "While some familiarity with basic technical analysis concepts would be helpful, this course is designed to be accessible to traders with minimal experience. We start with the fundamentals and gradually progress to more advanced techniques. If you're completely new to technical analysis, we recommend taking our Introduction to Technical Analysis course first, but it's not required."
  ),
  (
    'How do the practical assignments work?',
    "While some familiarity with basic technical analysis concepts would be helpful, this course is designed to be accessible to traders with minimal experience. We start with the fundamentals and gradually progress to more advanced techniques. If you're completely new to technical analysis, we recommend taking our Introduction to Technical Analysis course first, but it's not required."
  ),
];

class _CourseDetailsFaqState extends State<CourseDetailsFaq> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        Text(
          'Frequently Asked Questions',
          style: context.textTheme.titleMedium
              ?.copyWith(color: AppColors.textBlack),
        ),
        20.verticalSpace,
        ListView.separated(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final item = faqContent[index];
              return CourseDetailsFaqComponent(
                  title: item.$1, content: item.$2);
            },
            separatorBuilder: (_, index) => 10.verticalSpace,
            itemCount: faqContent.length),
        20.verticalSpace,

        Text(
          'Related courses to learn',
          style: context.textTheme.titleMedium
              ?.copyWith(color: AppColors.textBlack),
        ),
      ],
    );
  }
}

class CourseDetailsFaqComponent extends StatefulWidget {
  final String title;

  const CourseDetailsFaqComponent(
      {super.key, required this.title, required this.content});

  final String content;

  @override
  State<CourseDetailsFaqComponent> createState() =>
      _CourseDetailsFaqComponentState();
}

class _CourseDetailsFaqComponentState extends State<CourseDetailsFaqComponent> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        padding: const EdgeInsets.all(0),
        borderRadius: 12,
        useHeight: false,
        useWidth: false,
        borderColor: const Color(0XFFF2F4F7),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  _expanded=!_expanded;
                });
              },
              child:
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: ShapeDecoration(
                    color: Color(0XFFF2F4F7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                          widget.title,
                          style: context.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.textBlack),
                        )),
                    20.horizontalSpace,
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AppColors.textBlack,
                    )
                  ],
                ),
              ),
            ),
            if (_expanded) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Text(
                  widget.content,
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.textGray1),
                ),
              )
            ]
          ],
        ));
  }
}
