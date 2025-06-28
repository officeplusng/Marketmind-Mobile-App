

import 'package:flutter/material.dart';

import '../export/export.core.dart';

class ModalHelper {
  static Future<void> showModalMax(BuildContext context, Widget modal,
      {bool transparent = false, bool dismissible = true,bool useRootNavigator=false}) async {
    final mediaQueryData = MediaQuery.of(context).size;
    const radius = Radius.circular(Dimens.defaultBorderRadius);
    await showModalBottomSheet(
        isDismissible: dismissible,
        useRootNavigator:useRootNavigator ,
        backgroundColor: transparent ? Colors.transparent : Colors.white,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: radius, topLeft: radius)),
        context: context,
        constraints: BoxConstraints(
          minWidth: mediaQueryData.width,
        ),
        builder: (context) => Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: modal,
        ));
  }

  static Future<void> showReplaceModal(BuildContext context, Widget modal)async{
    context.popDialog();
    showModal(context, modal);
  }
  static Future<void> showModal(BuildContext context, Widget modal) async {
    final mediaQueryData = MediaQuery.of(context).size;
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius)),
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        constraints: BoxConstraints(
            maxHeight: mediaQueryData.height,
            maxWidth: MediaQuery.of(context).size.width),
        builder: (context) => Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: modal,
        ));
  }
}