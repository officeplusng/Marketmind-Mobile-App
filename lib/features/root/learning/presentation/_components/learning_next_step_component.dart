import 'package:marketmind/core/export/export.core.dart';

class LearningNextStepComponent extends StatelessWidget {
  const LearningNextStepComponent(
      {super.key,
      required this.assetName,
      required this.title,
      required this.actionText,
      required this.description});

  final String assetName;
  final String title;
  final String description;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return WrapperContainer.rectangular(
        useHeight: false,
        useWidth: false,
        backgroundColor: AppColors.white,
        borderRadius: 12,
        borderColor: const Color(0XFFEAECF0),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.simulation),
                  15.horizontalSpace,
                 Expanded(child:  Column(
                   mainAxisSize: MainAxisSize.min,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       title,
                       style: context.textTheme.titleMedium
                           ?.copyWith(color: AppColors.textBlack),
                     ),
                     15.verticalSpace,
                     Text(
                       description,
                       style: context.textTheme.bodyMedium
                           ?.copyWith(color: AppColors.textGray1),
                     )
                   ],
                 ))
                ],
              ),
            ),
            10.verticalSpace,
            const Divider(
              color: Color(0xFFEAECF0),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: EdgeInsets.only(left: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    actionText,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: const Color(0XFF2D53DD),fontWeight: FontWeight.bold),
                  ),
                  10.horizontalSpace,
                  const Icon(
                    Icons.arrow_forward,
                    color: Color(0XFF2D53DD),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
