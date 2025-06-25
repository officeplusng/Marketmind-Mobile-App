import '../export/export.core.dart';

class BaseDialogParent extends StatelessWidget {
  final double? height;
  final double? verticalMargin;
  final Widget child;

  final bool transparent;

  const BaseDialogParent(
      {super.key,
      this.height,
      this.verticalMargin,
      required this.child,
      this.transparent = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: ShapeDecoration(
        color: transparent ? AppColors.transparent : AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius)),
      ),
      constraints: BoxConstraints(
        maxHeight: height ?? 600,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: child,
    );
  }
}
