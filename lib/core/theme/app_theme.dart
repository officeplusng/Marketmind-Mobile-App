import 'package:google_fonts/google_fonts.dart';
import '../export/export.core.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.black),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(AppColors.containerColor1),
      trackOutlineColor: MaterialStateProperty.resolveWith((value) {
        if (value.contains(WidgetState.selected)) {
          return AppColors.borderGray;
        }
        return AppColors.transparent;
      }),
      thumbColor: MaterialStateProperty.resolveWith((value) {
        if (value.contains(WidgetState.selected)) {
          return AppColors.blue;
        }
        return AppColors.primary;
      }),
    ),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: AppColors.black),
    textTheme: TextTheme(
      bodyMedium: _textStyle(fontSize: 14, fontWeight: FontWeight.w400),
      titleLarge: _textStyle(fontSize: 32, fontWeight: FontWeight.w700),
      titleMedium: _textStyle(fontSize: 18, fontWeight: FontWeight.bold),
      titleSmall: _textStyle(fontSize: 16, fontWeight: FontWeight.w500),
      headlineMedium: _textStyle(fontSize: 30, fontWeight: FontWeight.w600),
      headlineLarge: _textStyle(fontSize: 42, fontWeight: FontWeight.w700),
      headlineSmall: _textStyle(fontSize: 24,fontWeight: FontWeight.bold),
      bodyLarge: _textStyle(
        fontSize: 18,
      ),
      bodySmall: _textStyle(
        fontSize: 12,
      ),
    ),
    fontFamily: GoogleFonts.interTight().fontFamily,
  );

  static TextStyle _textStyle({
    required double fontSize,
    double? letterSpacing,
    Color? color,
    FontWeight? fontWeight,
  }) =>
      GoogleFonts.interTight(
          fontSize: fontSize,
          color: color,
          letterSpacing: letterSpacing ?? .2,
          fontWeight: fontWeight ?? FontWeight.w500);
}
