import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/onboarding/landing_page2.dart';

class LandingPageViewComponent extends StatelessWidget {
  const LandingPageViewComponent({super.key, required this.entity});

  final PageViewEntity entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        40.verticalSpace,
       Center(
         child:  SizedBox(
           height: 308,
           width: 308,
           child: Image.asset(entity.asset),
         ),
       ),
        20.verticalSpace,

        Text(
          entity.title,
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge?.copyWith(
              fontSize: 30,
              color: AppColors.white,
              fontWeight: FontWeight.w500),
        ),
        10.verticalSpace,
        Text(
          entity.subtitle,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium
              ?.copyWith(fontSize: 18, color: AppColors.white),
        ),
      ],
    );
  }
}
