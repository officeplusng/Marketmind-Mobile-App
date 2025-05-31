import 'package:marketmind/core/export/export.core.dart';

import '../components/auth_logo_component.dart';
import '../components/continue_with.dart';
import '../components/have_an_account_component.dart';
import '../components/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   bool value = false;

  @override
  Widget build(BuildContext context) {
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
                AuthLogoComponent(),
                40.verticalSpace,
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcom back to\nMarketMind account',
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
                      InputField.filled(
                        label: 'Email address',
                        hint: 'Enter email address',
                      ),
                      20.verticalSpace,
                      PasswordInputField(
                        label: 'Password',
                        hint: 'Enter password',
                        onChange: (String) {},
                      ),
                      20.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Switch(
                                  value: value,
                                  onChanged: (result) => setState(() {
                                    value = result;
                                  })),
                            ),
                          ),
                          5.horizontalSpace,
                          Text('Keep me signed in',style: context.textTheme.bodyMedium?.copyWith(color: AppColors.white),),

                          Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Forgot password?',
                              style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white),
                            ),
                          )
                        ],
                      ),
                      40.verticalSpace,
                      PrimaryButton.primary(
                        text: 'Continue',
                        enabled: false,
                        onPressed: () {},
                      ),
                      20.verticalSpace,
                      ContinueWith(),
                      30.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SignInOption.google(onPress: () {}),
                          10.horizontalSpace,
                          SignInOption.apple(onPress: () {}),
                          10.horizontalSpace,
                          SignInOption.face(onPress: () {}),
                        ],
                      ),
                      30.verticalSpace,
                      HaveAnAccountComponent(
                        actionText: "Sign up",
                        contentText: "Don't have an account",
                        onClick: () {},
                      ),
                      30.verticalSpace,
                    ],
                  ),
                ))
              ],
            )
          ],
        ));
  }
}
