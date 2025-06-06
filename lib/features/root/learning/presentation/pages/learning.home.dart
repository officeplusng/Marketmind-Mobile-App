part of '../learning.root.dart';

class LearningHome extends StatefulWidget {
  const LearningHome({super.key});

  @override
  State<LearningHome> createState() => _LearningHomeState();
}

class _LearningHomeState extends State<LearningHome> {
  @override
  Widget build(BuildContext context) {
    return PagePadding(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your personal AI trading mentor is ready to continue your journey today',
          style: context.textTheme.bodyMedium?.copyWith(color: AppColors.white),
        ),
        20.verticalSpace,
        UpgradeLearningComponent(),
        20.verticalSpace,
        CourseItemComponent(),
        20.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your roadmap to trading success',
              style: context.textTheme.titleSmall,
            ),
            10.horizontalSpace,
            Icon(Icons.info_outline)
          ],
        ),
        15.verticalSpace,
        LearningProgressComponent(),
        20.verticalSpace,
        rectangleContainer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Center(
              child: Image.asset(
                Assets.illustration31,
                width: 135,
                height: 100,
              ),
            ),
            20.verticalSpace,
            Center(
              child: Text(
                'Ready to master forex trading?',
                style: context.textTheme.titleSmall?.copyWith(
                    fontSize: 20,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            10.verticalSpace,
            Center(
              child: Text(
                'Start your AI-powered learning journey and become a confident trader',
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.textGray1),
                textAlign: TextAlign.center,
              ),
            ),
            30.verticalSpace,
            Text(
              'Start with these popular courses',
              style: context.textTheme.titleSmall,
            ),
            10.verticalSpace,
          ],
        )),
        20.verticalSpace,
        container(
            title: 'Forex Fundamentals',
            subtitle: 'Perfect for beginners • 12 lessons',
            primaryColor: const Color(0xFF17B26A),
            secondaryColor: const Color(0xFF47CD89),
            endIcon: const Icon(
              Icons.play_arrow,
              color: AppColors.white,
            ),
            startIcon: SvgPicture.asset(
              Assets.chart,
              color: AppColors.white,
            )),
        10.verticalSpace,
        container(
            title: 'AI Trading Basics',
            subtitle: 'Learn with AI assistance • 8 lessons',
            primaryColor: const Color(0xFF7A5AF8),
            secondaryColor: const Color(0xFF9B8AFB),
            endIcon: const Icon(
              Icons.play_arrow,
              color: AppColors.white,
            ),
            startIcon: Icon(
              Icons.star_border,
              color: AppColors.white,
            )),
        20.verticalSpace,
        WrapperContainer.rectangular(
            width: double.infinity,
            useHeight: false,
            backgroundColor: AppColors.white,
            borderColor: const Color(0xFFF2F4F7),
            borderRadius: 8,
            padding: const EdgeInsets.all(16),
            bordered: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why learn with MarketMind?',
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: AppColors.textBlack1),
                ),
                15.verticalSpace,
                ...[
                  ('AI-powered personalized learning paths', AppColors.primary),
                  ('Risk-free trading simulations', AppColors.purpleLight),
                  ('Real-time market insights', AppColors.textGreenLight),
                ].map((e) => _infoComponent(text: e.$1, color: e.$2)),
              ],
            )),
        20.verticalSpace,
        AiRecommendedLesson(),
        50.verticalSpace,
        Center(
          child: _startLearningButton(context),
        )
      ],
    ));
  }

  Widget _infoComponent({Color? color, required String text}) => Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 10,
              color: color ?? AppColors.primary,
            ),
            10.horizontalSpace,
            Text(
              text,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontSize: 16, color: AppColors.textGray1),
            )
          ],
        ),
      );

  Widget _startLearningButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
        height: 44,
        decoration: ShapeDecoration(
            shadows: [
              BoxShadow(color: const Color(0x1018280D).withOpacity(.05))
            ],
            color: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(999),
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'page3'.svg,
              color: AppColors.white,
            ),
            15.horizontalSpace,
            Text(
              'Start Your Learning Journey',
              style: context.textTheme.titleSmall?.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget container(
      {required String title,
      required String subtitle,
      required Widget startIcon,
      required Widget endIcon,
      VoidCallback? onClick,
      required Color primaryColor,
      required Color secondaryColor}) {
    return WrapperContainer.rectangular(
        width: double.infinity,
        useHeight: false,
        onClick: onClick,
        backgroundColor: primaryColor,
        borderRadius: 20,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        bordered: true,
        child: Row(
          children: [
            WrapperContainer(
                width: 40,
                height: 40,
                backgroundColor: secondaryColor,
                child: startIcon),
            10.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: AppColors.white),
                ),
                5.verticalSpace,
                Text(
                  subtitle,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.white),
                ),
              ],
            ),
            const Spacer(),
            WrapperContainer(
                width: 32,
                height: 32,
                backgroundColor: secondaryColor,
                child: endIcon)
          ],
        ));
  }
}
