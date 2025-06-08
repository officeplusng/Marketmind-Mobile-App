import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/onboarding/components/selectable_component.dart';
import 'package:marketmind/features/onboarding/onboarding_completed_screen.dart';

import 'components/onboarding_text_caption_component.dart';

class OnboardingOptionEntity {
  final String title;
  final String? subtitle;
  final int? limit;
  final bool radio;
  final void Function(List<SelectionEntity>)? onSelect;
  final String heading;
  final List<SelectionEntity> options;

  const OnboardingOptionEntity(
      {required this.title,
      this.subtitle,
      this.limit,
      this.onSelect,
      required this.heading,
      this.radio = false,
      required this.options});
}

class CompleteOnboardingScreen extends StatefulWidget {
  const CompleteOnboardingScreen({super.key});

  @override
  State<CompleteOnboardingScreen> createState() =>
      _CompleteOnboardingScreenState();
}

class _CompleteOnboardingScreenState extends State<CompleteOnboardingScreen> {
  final controller = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnboardingOptionEntity(
          heading: 'Experience',
          title: "How would you describe your trading experience?",
          radio: true,
          onSelect: (value) {},
          options: const [
            SelectionEntity(title: "Beginner (New to trading)"),
            SelectionEntity(
                title: "Intermediate (Some experience with trading)"),
            SelectionEntity(title: "Advanced (Experienced trader)"),
            SelectionEntity(title: "Professional (Industry professional)"),
          ]),
      OnboardingOptionEntity(
          title: "Which markets are you most interested in following?",
          subtitle: "Select all that apply",
          heading: 'Interest',
          onSelect: (value) {},
          options: [
            const SelectionEntity(
              title: "US Stocks",
            ),
            const SelectionEntity(
              title: "Global Stocks",
            ),
            const SelectionEntity(
              title: "Cryptocurrencies",
            ),
            SelectionEntity(
                title: "Forex",
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SelectableOptionComponent(
                      onSelect: (value) {},
                      subtitle:
                          "Would you like to access our AI-powered Forex Learning System?",
                      radio: true,
                      options: const [
                        SelectionEntity(title: 'Yes'),
                        SelectionEntity(title: 'No'),
                      ]),
                )),
            const SelectionEntity(
              title: "Commodities",
            ),
            const SelectionEntity(
              title: "Deriv",
            ),
          ]),
      OnboardingOptionEntity(
          heading: 'Risk tolerance',
          title: "How would you describe your risk tolerance?",
          subtitle: "Select all that apply",
          onSelect: (value) {},
          options: const [
            SelectionEntity(
                title: "Conservative",
                subtitle: 'Prioritize capital preservation'),
            SelectionEntity(title: "Moderate", subtitle: 'Balanced approach'),
            SelectionEntity(
                title: "Aggressive",
                subtitle: 'Higher risk for higher returns'),
            SelectionEntity(
                title: "Very aggressive", subtitle: 'Maximum growth potential'),
          ]),
      OnboardingOptionEntity(
          title: "What are your primary trading objectives?",
          subtitle: "Select up to 2",
          heading: 'Trading objectives',
          onSelect: (value) {},
          limit: 2,
          options: const [
            SelectionEntity(title: "Short-term gains"),
            SelectionEntity(title: "Long-term growth"),
            SelectionEntity(title: "Income generation"),
            SelectionEntity(title: "Portfolio diversification"),
            SelectionEntity(title: "Retirement planning"),
          ]),
      OnboardingOptionEntity(
          heading: 'Analysis approach',
          title: "Which analysis approaches do you prefer?",
          onSelect: (value) {},
          options: const [
            SelectionEntity(
                title: "Technical analysis",
                subtitle: 'Charts, patterns, indicators'),
            SelectionEntity(
                title: "Fundamental analysis",
                subtitle: 'Company financials, economic data'),
            SelectionEntity(
                title: "News and sentiment",
                subtitle: 'Market news, social sentiment'),
            SelectionEntity(
                title: "Algorithmic signals",
                subtitle: 'AI-powered trading signals'),
          ]),
      OnboardingOptionEntity(
          title: "How would you like to receive market alerts?",
          heading: 'Market alerts',
          onSelect: (value) {},
          options: const [
            SelectionEntity(
                title: "Real-time alerts for significant movements"),
            SelectionEntity(title: "Daily summary updates"),
            SelectionEntity(title: "Weekly market recap"),
            SelectionEntity(title: "Only critical alerts"),
          ]),
      OnboardingOptionEntity(
          heading: 'AI Learning',
          title: "Get personalized education based on your experience level",
          radio: true,
          onSelect: (value) {},
          options: const [
            SelectionEntity(title: "Enable"),
            SelectionEntity(title: "Skip for now"),
          ]),
      OnboardingOptionEntity(
          heading: 'Learning goals?',
          title: "What are your Forex learning goals?",
          subtitle: "Select up to 2",
          limit: 2,
          onSelect: (value) {},
          options: const [
            SelectionEntity(
              title: "Learn terminology and basics",
            ),
            SelectionEntity(
              title: "Master technical analysis for forex",
            ),
            SelectionEntity(
              title:
                  "Understand fundamental factors affecting currency markets",
            ),
            SelectionEntity(
              title: "Practice with risk-free simulations",
            ),
          ]),
    ];
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: LinearProgressIndicator(
                  value: (_currentPage * pages.length / 100),
                  color: AppColors.primary,
                  backgroundColor: AppColors.white,
                  borderRadius:
                      BorderRadius.circular(Dimens.defaultBorderRadius),
                ),
              ),
              OnboardingDataPage(data: pages[_currentPage]),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  40.verticalSpace,
                  PrimaryButton.primary(
                    text: 'Next',
                    onPressed: () {
                      if (_currentPage < pages.length - 1) {
                        setState(() {
                          _currentPage++;
                        });
                        // controller.nextPage(
                        //     duration: Duration(milliseconds: 500),
                        //     curve: Curves.linear);
                        return;
                      }
                    },
                    iconEnd: const Icon(
                      Icons.arrow_forward,
                      color: AppColors.white,
                    ),
                  ),
                  10.verticalSpace,
                  PrimaryButton.light(
                    text: 'Back',
                    onPressed: () {
                      context.push(OnboardingCompletedScreen());
                      return;
                      if (_currentPage > 0) {
                        setState(() {
                          _currentPage--;
                        });
                        // controller.previousPage(
                        //     duration: const Duration(milliseconds: 500),
                        //     curve: Curves.linear);
                        return;
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ],
              )
            ],
          )))
        ],
      ),
    );
  }
}

class OnboardingDataPage extends StatelessWidget {
  const OnboardingDataPage({super.key, required this.data});

  final OnboardingOptionEntity data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardingTextCaptionComponent(title: data.heading),
          30.verticalSpace,
          SelectableOptionComponent(
            options: data.options,
            radio: data.radio,
            title: data.title,
            subtitle: data.subtitle,
            limit: data.limit,
            onSelect: data.onSelect,
          )
        ],
      ),
    );
  }
}
