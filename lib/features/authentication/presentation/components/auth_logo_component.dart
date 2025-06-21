import 'package:marketmind/core/export/export.core.dart';

class AuthLogoComponent extends StatelessWidget {
  const AuthLogoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppLogo.dark(),
        5.horizontalSpace,
        Text(
          'MarketMind',
          style: context.textTheme.headlineMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        )
      ],
    );
  }
}
