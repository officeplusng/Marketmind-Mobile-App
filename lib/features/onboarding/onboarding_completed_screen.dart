import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/onboarding/components/onboarding_text_caption_component.dart';

import '../root/learning/root.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: LinearProgressIndicator(
                  value: .9,
                  color: AppColors.primary,
                  backgroundColor: AppColors.white,
                  borderRadius:
                      BorderRadius.circular(Dimens.defaultBorderRadius),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            value: .5,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: Image.asset(Assets.loadingState),
                        )
                      ],
                    ),
                  ),
                  50.verticalSpace,
                  OnboardingTextCaptionComponent(
                    title: 'hurray!!',
                    angle: 0,
                    backgroundColor:
                        AppColors.containerBackground1.withOpacity(.2),
                  ),
                  20.verticalSpace,
                  Text(
                    'Welcome to MarketMind.',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  5.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    "Thanks for sharing your preferences! I've personalized your MarketMind dashboard based on your profile. You can update these preferences anytime in settings.",
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontSize: 16, color: AppColors.textGray1),
                  ),
                  50.verticalSpace,
                  PrimaryButton.primary(
                    onPressed: (){
                      context.push(const RootScreen());
                    },
                    text: 'Explore dashboard',
                  ),
                  20.verticalSpace,
                ],
              )
            ],
          )))
        ],
      ),
    );
  }
}
