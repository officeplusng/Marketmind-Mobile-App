import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/authentication/_controller/cubit/onboarding_cubit.dart';
import 'package:marketmind/features/authentication/data/dto/register_dto.dart';
import 'package:marketmind/features/authentication/presentation/components/auth_logo_component.dart';
import 'package:marketmind/features/authentication/presentation/components/continue_with.dart';
import 'package:marketmind/features/authentication/presentation/screens/create_account_referral_code.dart';
import '../components/have_an_account_component.dart';
import '../components/social_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                  child: Form(
                      key: formKey,
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
                            style: context.textTheme.bodyMedium?.copyWith(
                                fontSize: 18, color: AppColors.white),
                          ),
                          20.verticalSpace,
                          InputField.filled(
                            label: 'First Name',
                            validator: (value) =>
                                InputValidators.minLength(value),
                            hint: 'Enter First Name',
                            controller: _firstNameController,
                          ),
                          20.verticalSpace,
                          InputField.filled(
                            controller: _lastNameController,
                            label: 'Last Name',
                            validator: (value) =>
                                InputValidators.minLength(value),
                            hint: 'Enter Last Name',
                          ),
                          20.verticalSpace,
                          InputField.filled(
                            label: 'Email address',
                            controller: _emailController,
                            hint: 'Enter email address',
                            validator: InputValidators.emailValidator,
                          ),
                          20.verticalSpace,
                          PrimaryButton.primary(
                            text: 'Continue',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final registerDto = RegisterDto(
                                  fullname:
                                      '${_firstNameController.text} ${_lastNameController.text}',
                                  email: _emailController.text,
                                );
                                context.push(CreateAccountReferralCode(
                                    data: registerDto));
                              }
                            },
                          ),
                          20.verticalSpace,
                          ContinueWith(),
                          30.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SignInOption.google(onPress: () {
                                context
                                    .read<AuthenticationCubit>()
                                    .oauth(OAuthType.google);
                              }),
                              10.horizontalSpace,
                              SignInOption.apple(onPress: () {}),
                            ],
                          ),
                          30.verticalSpace,
                          HaveAnAccountComponent(
                            actionText: 'Already have an account?',
                            contentText: 'Sign in here',
                            onClick: () {
                              context.pop();
                            },
                          ),
                          30.verticalSpace,
                        ],
                      )),
                ))
              ],
            )
          ],
        ));
  }
}
