
import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/features/onboarding/landing_page2.dart';

import '../../core/export/export.core.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroundColor: AppColors.coolBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "AI-Powered\nTrading\nIntelligence",
                  style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 36,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                ),
                CircleButton(
                  radius: 56,
                  onPress: (){
                    context.push(LandingPage2());
                  },
                  child: SvgPicture.asset(
                    Assets.doubleArrow,
                    width: 12,
                    height: 10,
                  ),
                )
              ],
            ),
            100.verticalSpace,
          ],
        ));
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton(
      {super.key, this.radius, required this.child, this.onPress, this.color});

  final double? radius;
  final Widget child;
  final Color? color;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPress?.call(),
      shape: const CircleBorder(),
      color: color ?? AppColors.primary,
      minWidth: radius,
      height: radius,
      child: child,
    );
  }
}
