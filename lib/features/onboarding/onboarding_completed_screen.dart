import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';

import '../../core/assets/assets.dart';
import '../../core/theme/app_colors.dart';

class OnboardingCompletedScreen extends StatefulWidget {
  const OnboardingCompletedScreen({super.key});

  @override
  State<OnboardingCompletedScreen> createState() =>
      _OnboardingCompletedScreenState();
}

class _OnboardingCompletedScreenState extends State<OnboardingCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Image.asset(
            Assets.bgGradient,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
              child: PagePadding(
                  child: Column(
            children: [
              Text(
                'Welcome to MarketMind.',
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              10.verticalSpace,
              Text(
                'Personalizing your MarketMind experience',
                style: context.textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
              50.verticalSpace,
              PrimaryButton.primary(
                text: 'Explore dashboard',
              )
            ],
          )))
        ],
      ),
    );
  }
}
