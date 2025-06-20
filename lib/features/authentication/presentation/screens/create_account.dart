import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/authentication/presentation/components/auth_logo_component.dart';
import 'package:marketmind/features/authentication/presentation/components/continue_with.dart';
import '../components/have_an_account_component.dart';
import '../components/social_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                      InputField.filled(
                        label: 'Full name',
                        hint: 'Enter full name',
                      ),
                      20.verticalSpace,
                      InputField.filled(
                        label: 'Email address',
                        hint: 'Enter email address',
                      ),
                      20.verticalSpace,
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
                        ],
                      ),
                      30.verticalSpace,
                      HaveAnAccountComponent(
                        actionText: 'Already have an account?',
                        contentText: 'Sign in here',
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
