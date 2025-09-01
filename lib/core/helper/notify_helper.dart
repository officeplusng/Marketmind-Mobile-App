import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:marketmind/core/theme/app_colors.dart';

class NotifyHelper {
  static void showErrorSnackBar(BuildContext context, {String? message}) =>
      _showSuccessSnackBar(context, true, message: message);

  static void showSuccessSnackBar(BuildContext context, {String? message}) =>
      _showSuccessSnackBar(context, false, message: message);

  static void showCopiedSnackBar(BuildContext context, {String? message}) {
    showToast('Text copied', color: AppColors.black.withValues(alpha: .4));
  }

  static void showErrorToast(String message) => showToast(message,color: AppColors.red);
  static void showSuccessToast(String message) => showToast(message,color: AppColors.greenDark);

  static void showToast(String message, {Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity ?? ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void showSnackBar(BuildContext context, {required Widget child}) =>
      _showSuccessSnackBar(context, false, child: child);

  static void _showSuccessSnackBar(BuildContext context, bool error,
      {String? message, Widget? child}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 5, // Adjust as needed
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