import 'package:flutter/material.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/learning/root.dart';
import 'package:marketmind/splash_screen.dart';

import 'bootstrap.dart';
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
            home: const RootScreen()));
  }
}
