import '../export/export.core.dart';

class DialogHelper {
  static Future<Widget?> _showBlankDialog({
    required BuildContext context,
    required Widget child,
    EdgeInsets? insetPadding,
  }) {
    return showDialog<Widget?>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius)),
        insetPadding: insetPadding ??
            const EdgeInsets.symmetric(horizontal: 20),
        child: child,
      ),
    );
  }

  static Future<void> show(BuildContext context,
      {required Widget child}) async {
    await _showBlankDialog(context: context, child: child);
  }
}
