import 'package:flutter/gestures.dart';
import 'package:marketmind/features/authentication/presentation/components/have_an_account_component.dart';
import 'package:marketmind/features/onboarding/components/selectable_component.dart';

import 'package:marketmind/core/export/export.core.dart';
import '../components/auth_logo_component.dart';

class CreateAccountReferralCode extends StatefulWidget {
  const CreateAccountReferralCode({super.key});

  @override
  State<CreateAccountReferralCode> createState() =>
      _CreateAccountReferralCodeState();
}

class _CreateAccountReferralCodeState extends State<CreateAccountReferralCode> {
  bool accepted = false;

  @override
  Widget build(BuildContext context) {
    final style =
        context.textTheme.bodyMedium?.copyWith(color: AppColors.white);
    return BaseScaffold(
        backgroundColor: AppColors.coolGray,
        child: Stack(
          children: [
            Image.asset(
              Assets.splashGraphics,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                40.verticalSpace,
                const AuthLogoComponent(),
                40.verticalSpace,
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create your\nMarketMind account',
                        style: context.textTheme.headlineMedium?.copyWith(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                      ),
                      15.verticalSpace,
                      Text(
                        'Access your market insights',
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontSize: 18, color: AppColors.white),
                      ),
                      20.verticalSpace,
                      PasswordInputField(
                        label: 'Password',
                        hint: '❋❋❋❋❋❋❋❋❋',
                        onChange: (value) {},
                      ),
                      20.verticalSpace,
                      InputField.filled(
                        label: 'Referral code (Optional)',
                        hint: 'Enter email address',
                      ),
                      20.verticalSpace,
                      _tAndCs(),
                      20.verticalSpace,
                      PrimaryButton.primary(
                        text: 'Sign Up',
                        enabled: false,
                        onPressed: () {},
                      ),
                      20.verticalSpace,
                      HaveAnAccountComponent(actionText: 'Already have an account?', contentText: 'Sign in here',onClick: (){},),
                      40.verticalSpace,
                    ],
                  ),
                ))
              ],
            )
          ],
        ));
  }

  void _onClickTAndCs(String url) {}

  Widget _tAndCs() {
    final style = context.textTheme.bodyMedium
        ?.copyWith(fontSize: 14, color: AppColors.white);
    return InkWell(
      onTap: () => setState(() {
        accepted = !accepted;
      }),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckOrRadio(
            selected: accepted,
          ),
          5.horizontalSpace,
          Text.rich(
            TextSpan(
                text: "By creating an account, you agree to\nMarketMind's ",
                style: style,
                children: [
                  TextSpan(
                      text: 'Privacy Policy ',
                      style: style?.copyWith(color: AppColors.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            _onClickTAndCs(AppConstants.privacyPolicyUrl)),
                  TextSpan(text: 'and ', style: style),
                  TextSpan(
                      text: 'Terms of Service ',
                      style: style?.copyWith(color: AppColors.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            _onClickTAndCs(AppConstants.termsAndConditionUrl)),
                ]),
          )
        ],
      ),
    );
  }
}
