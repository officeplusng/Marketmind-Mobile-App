import 'package:marketmind/core/export/export.core.dart';

class SignInOption extends StatelessWidget {
  const SignInOption._({super.key, this.onPress, required this.asset});

  final VoidCallback? onPress;

  final String asset;

  factory SignInOption.apple({required VoidCallback onPress}) => SignInOption._(
        asset: Assets.apple,
        onPress: onPress,
      );

  factory SignInOption.face({required VoidCallback onPress}) => SignInOption._(
        asset: Assets.face,
        onPress: onPress,
      );

  factory SignInOption.google({required VoidCallback onPress}) =>
      SignInOption._(
        asset: Assets.google,
        onPress: onPress,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPress?.call();
      },
      minWidth: 56,
      height: 56,
      color: AppColors.socialGray,
      shape: const CircleBorder(),
      child: SvgPicture.asset(asset),
    );
  }
}
