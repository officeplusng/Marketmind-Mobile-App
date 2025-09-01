import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/core/helper/notify_helper.dart';
import 'package:marketmind/features/authentication/_controller/cubit/onboarding_questions_cubit.dart';
import 'package:marketmind/features/onboarding/complete_onboarding_screen.dart';
import 'package:marketmind/src/state_management/cubit_state.dart';

import '../authentication/data/dto/onboarding_questions_dto.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  void initState() {
    super.initState();
  }

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
            children: [
              _logoHeader(context),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(Assets.completeTradingProfile),
                  40.verticalSpace,
                  Text(
                    'Complete Your Trading \nProfile',
                    style: context.textTheme.headlineMedium,
                  ),
                  10.verticalSpace,
                  Text(
                    'Get personalized AI insights tailored to your\nstrategy.',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontSize: 18, color: AppColors.textGray1),
                  ),
                  30.verticalSpace,
                  BlocConsumer<OnboardingQuestionsCubit,
                          BaseState<List<OnboardingQuestionDto>>>(
                      listener: (_, state) {
                    if (state.isSuccess) {
                      context.push( CompleteOnboardingScreen(pages: state.data??[],));
                    }
                    if (state.isError) {
                      NotifyHelper.showErrorToast(state.error ?? '');
                    }
                  }, builder: (_, state) {
                    return PrimaryButton.primary(
                      loading: state.isLoading,
                      onPressed: () {
                        context
                            .read<OnboardingQuestionsCubit>()
                            .fetchOnboardingQuestions();
                      },
                      text: 'Start',
                    );
                  }),
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
