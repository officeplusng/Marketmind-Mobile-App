import 'package:flutter/material.dart';
import 'package:marketmind/core/components/export.core.component.dart';

import '../../core/assets/assets.dart';
import '../../core/theme/app_colors.dart';

class CompleteOnboardingScreen extends StatefulWidget {
  const CompleteOnboardingScreen({super.key});

  @override
  State<CompleteOnboardingScreen> createState() =>
      _CompleteOnboardingScreenState();
}

class _CompleteOnboardingScreenState extends State<CompleteOnboardingScreen> {
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

            ],
          )))
        ],
      ),
    );
  }
}
