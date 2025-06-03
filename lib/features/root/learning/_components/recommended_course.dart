import 'package:marketmind/core/export/export.core.dart';

class RecommendedCourses extends StatelessWidget {
  const RecommendedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended for you',
          style: context.textTheme.titleSmall,
        ),
        5.verticalSpace,
        Text(
          'Based on your learning activity and goals',
          style: context.textTheme.bodyMedium
              ?.copyWith(color: AppColors.textGray1),
        ),
        5.verticalSpace,
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
            padding: EdgeInsets.all(0),
            itemCount: 3,
            itemBuilder: (context,index)=>
            RecommendedCourseComponent())
      ],
    );
  }
}

class RecommendedCourseComponent extends StatelessWidget {
  const RecommendedCourseComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var copyWith =
        context.textTheme.bodyMedium?.copyWith(color: AppColors.textGray1);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: ShapeDecoration(
            color: const Color(0XF667085),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: const ShapeDecoration(
                  shape: CircleBorder(), color: AppColors.primaryDark),
              child: SvgPicture.asset(
                Assets.chart,
                color: AppColors.white,
              ),
            ),
            10.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forex Trading Fundamentals',
                  style: context.textTheme.titleSmall,
                ),
                5.verticalSpace,
                Text(
                  'Complete introduction to forex markets',
                  style: copyWith,
                ),
                10.verticalSpace,
                Text(
                  'Beginner level • 15 lessons',
                  style: copyWith,
                ),
              ],
            )
          ],
        ));
  }
}
