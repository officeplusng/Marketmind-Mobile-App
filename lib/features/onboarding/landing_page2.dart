import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/authentication/presentation/screens/login_screen.dart';
import 'package:marketmind/features/onboarding/components/landing_pageview_component.dart';
import 'package:marketmind/features/onboarding/onboarding_screen1.dart';

class PageViewEntity {
  final String title;
  final String subtitle;
  final String asset;

  const PageViewEntity(
      {required this.title, required this.subtitle, required this.asset});
}

class LandingPage2 extends StatefulWidget {
  const LandingPage2({super.key});

  @override
  State<LandingPage2> createState() => _LandingPage2State();
}

class _LandingPage2State extends State<LandingPage2> {
  int currentPage = 0;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    final pages = [
      PageViewEntity(
          title: "Real-time Market\nIntelligence",
          subtitle:
              "Access AI-driven insights and analytics for informed trading decisions",
          asset: Assets.marketIntelligence),
      PageViewEntity(
          title: "Personalized Trading \nInsights",
          subtitle:
              "Get customized trade recommendations based \non your preferences",
          asset: Assets.personalizedTrading),
      PageViewEntity(
          title: "Learn while you Trade",
          subtitle: "Enhance your skills with our AI Forex Learning \nSystem",
          asset: Assets.learnWhileYouTrade),
      PageViewEntity(
          title: "Earn with our Partner \nProgram",
          subtitle:
              "Refer friends and earn commission through our\nmulti-level marketing system",
          asset: Assets.earnWithPartner),
    ];
    return BaseScaffold(
        backgroundColor: AppColors.coolBlack,
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.white,
                    )),
                Expanded(
                    child: pageIndicator(
                        currentIndex: currentPage, pages: pages.length)),
                TextButton(
                    onPressed: () {
                      if (currentPage < pages.length - 1) {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                        return;
                      }
                    },
                    child: Text(
                      'Next',
                      style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500, color: AppColors.white),
                    ))
              ],
            ),
            Expanded(
                child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: pages
                  .map((e) => LandingPageViewComponent(entity: e))
                  .toList(),
            )),
            20.verticalSpace,
            PrimaryButton.primary(
              text: 'Get started',
              onPressed: () {
                context.push(const LoginScreen());
              },
              iconEnd: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
                size: 12,
              ),
            ),
            15.verticalSpace,
            PrimaryButton.light(
              onPressed: () {
                context.push(const OnboardingScreen1());
              },
              text: 'Create Account',
              iconEnd: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
            50.verticalSpace,
          ],
        )));
  }

  Widget pageIndicator({required int currentIndex, required int pages}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [...List.generate(pages, (e) => container(e == currentIndex))],
    );
  }

  Widget container(bool selected) => Expanded(
          child: Container(
        width: double.infinity,
        height: 2,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: ShapeDecoration(
            color: selected ? AppColors.white : AppColors.textGray1,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(Dimens.defaultBorderRadius))),
      ));
}
