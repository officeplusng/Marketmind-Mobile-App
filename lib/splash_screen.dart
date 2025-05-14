import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/authentication/components/continue_with.dart';
import 'package:marketmind/features/authentication/components/social_button.dart';
import 'package:marketmind/features/onboarding/components/onboarding_text_caption_component.dart';
import 'package:marketmind/features/onboarding/components/selectable_component.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool selected = false;

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
           SingleChildScrollView(
             child:  Column(
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
                     SignInOption.google(onPress: () {}),
                     10.horizontalSpace,
                     SignInOption.apple(onPress: () {}),
                   ],
                 ),
                 10.verticalSpace,
                 ContinueWith(),
                 20.verticalSpace,
                 OnboardingTextCaptionComponent(title: 'Interest'),
                 20.verticalSpace,
                 PasswordInputField(
                     hint: 'enter your password', onChange: (_) {}),
                 20.verticalSpace,
                 SelectableOptionComponent(
                   radio: false,
                     title: 'How would you describe your trading experience?',
                     options: [
                       'Beginner (New to trading)',
                       'Intermediate (Some experience with trading)',
                       'Advanced (Experienced trader)',
                       'Professional (Industry professional)'
                     ].map((e) => SelectionEntity(title: e,subtitle: 'subtitle-sample')).toList())
               ],
             ),
           )
          ],
        ));
  }
}
