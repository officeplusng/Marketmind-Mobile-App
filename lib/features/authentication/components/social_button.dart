import 'package:marketmind/core/export/export.core.dart';

class SocialButton extends StatelessWidget {
  const SocialButton._({super.key, this.onPress, required this.asset});

  final VoidCallback? onPress;

  final String asset;

  factory SocialButton.apple({required VoidCallback onPress}) => SocialButton._(
        asset: Assets.apple,
        onPress: onPress,
      );

  factory SocialButton.google({required VoidCallback onPress}) =>
      SocialButton._(
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
