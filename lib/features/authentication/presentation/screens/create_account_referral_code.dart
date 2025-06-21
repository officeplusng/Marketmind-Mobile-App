import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/authentication/_controller/cubit/onboarding_cubit.dart';
import 'package:marketmind/features/authentication/_controller/state/auth_state.dart';
import 'package:marketmind/features/authentication/data/dto/register_dto.dart';
import 'package:marketmind/features/authentication/presentation/components/have_an_account_component.dart';
import 'package:marketmind/features/onboarding/components/selectable_component.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/authentication/presentation/components/auth_logo_component.dart';
import 'package:marketmind/features/onboarding/landing_page2.dart';
import 'package:marketmind/features/onboarding/onboarding_screen1.dart';
import 'package:marketmind/src/presentation/snack_bar_helper.dart';

class CreateAccountReferralCode extends StatefulWidget {
  final RegisterDto data;

  const CreateAccountReferralCode({super.key, required this.data});

  @override
  State<CreateAccountReferralCode> createState() =>
      _CreateAccountReferralCodeState();
}

class _CreateAccountReferralCodeState extends State<CreateAccountReferralCode> {
  bool accepted = false;

  final _passwordController = TextEditingController();
  final _referralCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final countryCode = '+234';
    final style =
        context.textTheme.bodyMedium?.copyWith(color: AppColors.white);
    return BlocConsumer<AuthenticationCubit, AuthState>(builder: (_, state) {
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
                                PasswordInputField(
                                  label: 'Password',
                                  controller: _passwordController,
                                  validator: InputValidators.passwordValidation,
                                  hint: '❋❋❋❋❋❋❋❋❋',
                                  onChange: (value) {},
                                ),
                                20.verticalSpace,
                                InputField.filled(
                                  label: 'Phone number',
                                  keyboardType: TextInputType.number,
                                  letterSpacing: 2,
                                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                                  validator:
                                      InputValidators.required,
                                  hint: 'Enter your phone number',
                                  prefixIcon: IconButton(onPressed: (){}, icon: Text(
                                    countryCode,
                                    style: context.textTheme.bodyMedium?.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                  controller: _phoneNumberController,
                                ),
                                20.verticalSpace,
                                InputField.filled(
                                  label: 'Referral code (Optional)',
                                  controller: _referralCodeController,
                                  hint: 'Enter invite code',
                                ),
                                20.verticalSpace,
                                _tAndCs(),
                                20.verticalSpace,
                                PrimaryButton.primary(
                                  text: 'Sign Up',
                                  enabled: accepted,
                                  loading: state is AuthLoading,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      final phone = '$countryCode${_phoneNumberController.text.trim()}';
                                      final data = widget.data.copyWith(
                                        phone: phone,
                                          password: _passwordController.text.trim(),
                                          inviteCode:
                                          _referralCodeController.text.isEmpty
                                              ? null
                                              : _referralCodeController.text);
                                      context
                                          .read<AuthenticationCubit>()
                                          .register(data);
                                    }
                                  },
                                ),
                                20.verticalSpace,
                                HaveAnAccountComponent(
                                  actionText: 'Already have an account?',
                                  contentText: 'Sign in here',
                                  onClick: () {
                                    context
                                      ..pop()
                                      ..pop();
                                  },
                                ),
                                40.verticalSpace,
                              ],
                            )),
                      ))
                ],
              )
            ],
          ));
    }, listener: (_, state) {
      if (state is RegistrationSuccess) {
        AppSnackBarHelper.showToast(state.message,
            color: AppColors.greenDark);
        context.read<AccountCubit>().refresh();
        context.push(const OnboardingScreen1());
      }
      if (state is AuthError) {
        AppSnackBarHelper.showToast(state.message, color: AppColors.red);
      }
    });
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
