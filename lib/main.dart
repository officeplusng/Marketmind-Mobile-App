import 'package:flutter/material.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/root.dart';
import 'package:marketmind/splash_screen.dart';

import 'bootstrap.dart';
import 'features/authentication/screens/create_account.dart';
import 'features/authentication/screens/create_account_referral_code.dart';
import 'features/authentication/screens/enter_authentication_code_screen.dart';
import 'features/authentication/screens/login_screen.dart';
import 'features/authentication/screens/use_backup_code_screen.dart';
import 'features/onboarding/landing_page1.dart';

void main() {
  configureDependencies();
  bootstrap(() {
    return const MyApp();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(390, 844),
        child: MaterialApp(
            title: '',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: AppTheme.light,
            home: const LandingPage1()));
  }
}
