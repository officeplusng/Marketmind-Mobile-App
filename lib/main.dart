import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/learning/root.dart';
import 'bootstrap.dart';
import 'features/_shared/utils/providers.dart';

void main() {
  configureDependencies();
  bootstrap(() {
    return MultiBlocProvider(providers: providers, child: const MyApp());
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
