import '../export/export.core.dart';

class DialogHelper {
  static Future<Widget?> _showBlankDialog({
    required BuildContext context,
    required Widget child,
    bool transparent = false,
    EdgeInsets? insetPadding,
  }) {
    return showDialog<Widget?>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: transparent ? AppColors.transparent : Colors.white,
        surfaceTintColor: transparent ? AppColors.transparent : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius)),
        insetPadding:
            insetPadding ?? const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      ),
    );
  }

  static Future<void> show(BuildContext context,
      {required Widget child, bool transparent = false,
      EdgeInsets? insetPadding,}) async {
    await _showBlankDialog(
        context: context, child: child, transparent: transparent,insetPadding: insetPadding);
  }
}
