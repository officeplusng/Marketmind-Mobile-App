import 'package:flutter/material.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/src/presentation/copied_snackbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppSnackBarHelper {
  static void showErrorSnackBar(BuildContext context, {String? message}) =>
      _showSuccessSnackBar(context, true, message: message);

  static void showSuccessSnackBar(BuildContext context, {String? message}) =>
      _showSuccessSnackBar(context, false, message: message);

  static void showCopiedSnackBar(BuildContext context, {String? message}) {
    showToast('Text copied', color: AppColors.textBlack.withValues(alpha: .4));
  }

  static void showToast(String message, {Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showSnackBar(BuildContext context, {String? message}) =>
      _showSuccessSnackBar(context, false, message: message);

  static void _showSuccessSnackBar(BuildContext context, bool error,
      {String? message, Widget? child}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 8, // Adjust as needed
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: child,
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 5)).then((value) {
      overlayEntry.remove();
    });
  }
}
