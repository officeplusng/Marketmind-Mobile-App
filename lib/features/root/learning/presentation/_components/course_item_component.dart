import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/learning/presentation/pages/course_details_screen.dart';

class CourseItemComponent extends StatelessWidget {
  const CourseItemComponent({super.key, this.buttonText});

  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        width: double.infinity,
        useHeight: false,

        backgroundColor: AppColors.white,
        bordered: true,
        borderColor: AppColors.secondaryCardBorder,
        borderRadius: 12,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 74,
                  height: 74,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8)),
                      image: DecorationImage(
                          image: AssetImage(Assets.learningThumbNail))),
                ),
                20.horizontalSpace,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                      decoration: ShapeDecoration(
                          color: AppColors.purpleTransparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      child: Center(
                        child: Text(
                          'TRADING MASTERY',
                          style: context.textTheme.bodySmall
                              ?.copyWith(color: AppColors.purpleDark),
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      'Intermediate Forex Trading',
                      maxLines: 1,
                      style: context.textTheme.titleMedium,
                    ),
                    20.verticalSpace,
                    Text.rich(TextSpan(
                        text: '13/',
                        style: context.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: '20 Lessons',
                              style: context.textTheme.bodySmall)
                        ]))
                  ],
                )
              ],
            ),
            20.verticalSpace,
            InkWell(
              onTap: (){
                context.push(const CourseDetailsScreen());
              },
              child: Container(
                height: 36,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                decoration: ShapeDecoration(
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      buttonText??'Continue Course',
                      style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                    5.horizontalSpace,
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
