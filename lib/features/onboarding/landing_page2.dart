import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';

class LandingPage2 extends StatefulWidget {
  const LandingPage2({super.key});

  @override
  State<LandingPage2> createState() => _LandingPage2State();
}

class _LandingPage2State extends State<LandingPage2> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroundColor: AppColors.coolBlack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Real-time Market\nIntelligence",
          style: context.textTheme.titleLarge?.copyWith(
              fontSize: 36,
              color: AppColors.white,
              fontWeight: FontWeight.w600),
        ),
        10.verticalSpace,
        Text(
          "Access AI-driven insights and analytics for informed trading decisions",
          style: context.textTheme.bodyMedium
              ?.copyWith(fontSize: 18, color: AppColors.white),
        ),
        20.verticalSpace,
        Image.asset('assets/pngs/onboarding_background1.png'),
        20.verticalSpace,
        PrimaryButton.primary(
          text: 'Get started',
          iconEnd: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.white,
            size: 12,
          ),
        ),
        15.verticalSpace,
        PrimaryButton.light(
          text: 'Create Account',
          iconEnd: Icon(
            Icons.arrow_forward_ios,
            size: 12,
          ),
        ),
      ],
    ));
  }
}
