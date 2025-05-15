import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/onboarding/complete_onboarding_screen.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
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
          SafeArea(child: PagePadding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _logoHeader(context),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(Assets.performingAnalysis),
                      40.verticalSpace,
                      Text(
                        'Complete Your Trading \nProfile',
                        style: context.textTheme.headlineMedium,),
                      10.verticalSpace,
                      Text(
                        'Get personalized AI insights tailored to your\nstrategy.',
                        style: context.textTheme.bodyMedium?.copyWith(
                            fontSize: 18, color: AppColors.textGray1),),
                      30.verticalSpace,
                      PrimaryButton.primary(
                        onPressed: (){
                          context.push(CompleteOnboardingScreen());
                        },
                        text: 'Start',
                      ),
                      40.verticalSpace,
                    ],
                  )
                ],
              )))
        ],
      ),
    );
  }

  Row _logoHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppLogo(
          assetName: Assets.appLogo,
          width: 32,
          height: 32,
        ),
        10.horizontalSpace,
        Text(
          'MarketMind',
          style: context.textTheme.bodyMedium
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
