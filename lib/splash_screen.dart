import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/authentication/components/continue_with.dart';
import 'package:marketmind/features/authentication/components/social_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroundColor: AppColors.coolGray,
        verticalPadding: 0,
        horizontalPadding: 20,
        child: Stack(
          children: [
            Image.asset(
              Assets.splashGraphics,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton.primary(
                  text: 'Get Started',
                  iconEnd: Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.white,
                  ),
                ),
                20.verticalSpace,
                PrimaryButton.light(
                  text: 'Create Account',
                  iconEnd: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                ),
                20.verticalSpace,
                PrimaryButton.outlined(
                    text: 'Back',
                    iconStart: Icon(
                      Icons.keyboard_arrow_left,
                    )),
                20.verticalSpace,
                InputField.filled(
                  label: 'Full name',
                  hint: 'Enter full name',
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SocialButton.google(onPress: () {}),
                    10.horizontalSpace,
                    SocialButton.apple(onPress: () {}),
                  ],
                ),
                10.verticalSpace,
                ContinueWith()
              ],
            )
          ],
        ));
  }
}
