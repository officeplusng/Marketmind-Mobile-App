import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/authentication/_controller/cubit/onboarding_cubit.dart';
import 'package:marketmind/features/authentication/_controller/state/auth_state.dart';
import 'package:marketmind/features/authentication/data/dto/login_dto.dart';
import 'package:marketmind/features/root/learning/root.dart';
import 'package:marketmind/src/presentation/snack_bar_helper.dart';

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
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  child:Form(
                    key: formKey,
                      child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back to\nMarketMind account',
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
                        controller: _emailController,
                        validator: InputValidators.emailValidator,
                      ),
                      20.verticalSpace,
                      PasswordInputField(
                        label: 'Password',
                        controller: _passwordController,
                        validator: InputValidators.required,
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
                          Text(
                            'Keep me signed in',
                            style: context.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.white),
                          ),
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
                      BlocConsumer<AuthenticationCubit, AuthState>(
                          builder: (context, state) {
                            return PrimaryButton.primary(
                              text: 'Continue',
                              loading: state is AuthLoading,
                              onPressed: () {
                                if(formKey.currentState!.validate()) {
                                  final dto = LoginDto(email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                      isGoogleSignIn: false);
                                  context.read<AuthenticationCubit>().login(
                                      dto);
                                }
                              },
                            );
                          },
                          listener: (_, state) {
                            if(state is LoginSuccess){
                             context.read<AccountCubit>().setUser(state.user);
                              AppSnackBarHelper.showToast('Welcome back',color: AppColors.greenDark,gravity: ToastGravity.TOP);
                              context.pushRemoveUntil(RootScreen());
                            }
                            if(state is AuthError){
                              AppSnackBarHelper.showToast(state.message,gravity: ToastGravity.TOP,color: AppColors.red);
                            }
                          }),
                      20.verticalSpace,
                      ContinueWith(),
                      30.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SignInOption.google(onPress: () {
                            context.read<AuthenticationCubit>().oauth(OAuthType.google);
                          }),
                          if(Platform.isIOS)
                          ...[10.horizontalSpace,
                          SignInOption.apple(onPress: () {})],
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
                  )),
                ))
              ],
            )
          ],
        ));
  }
}
