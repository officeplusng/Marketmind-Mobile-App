import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/core/components/export.core.component.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/_shared/controllers/cubit/account_cubit.dart';
import 'package:marketmind/features/onboarding/components/onboarding_text_caption_component.dart';
import 'package:marketmind/features/onboarding/components/selectable_component.dart';
import 'package:marketmind/features/onboarding/landing_page1.dart';
import 'package:marketmind/features/root/learning/root.dart';

import 'features/authentication/presentation/components/continue_with.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool selected = false;

  Timer? _timer;
  @override
  void initState() {
    context.read<AccountCubit>().init();
    super.initState();

  _timer =   Timer.periodic(const Duration(seconds: 2), (result)async{
      final isLoggedIn = await context.read<AccountCubit>().userAvailable();
      if(isLoggedIn){
        context.pushRemoveUntil(RootScreen());
      }else{
        context.pushReplace(LandingPage1());
      }
    });

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroundColor: AppColors.coolGray,
        verticalPadding: 0,
        horizontalPadding: 20,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppLogo(assetName: Assets.appLogo,width: 45,height: 45,),
              5.horizontalSpace,
              Text(AppConstants.appName,style: context.textTheme.bodySmall?.copyWith(fontSize: 30,color: AppColors.white,fontWeight: FontWeight.bold),)
            ],
          ),
        ));
  }
}
