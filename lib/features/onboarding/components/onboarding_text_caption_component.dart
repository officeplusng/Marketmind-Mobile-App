import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';

class OnboardingTextCaptionComponent extends StatelessWidget {
  const OnboardingTextCaptionComponent({super.key, required this.title,this.backgroundColor,this.angle});

  final String title;
  final double? angle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle:angle?? -.2,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(Dimens.defaultBorderRadius + 2)),
          color: backgroundColor??AppColors.containerBackground1),
      child: Text(
        title,
        style: context.textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.w600,color: AppColors.primaryLight,fontSize: 16),
      ),
    ),);
  }
}
