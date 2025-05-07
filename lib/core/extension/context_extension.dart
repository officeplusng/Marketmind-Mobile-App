import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext{

  TextTheme get textTheme => Theme.of(this).textTheme;

  InputDecorationTheme get inputTheme => Theme.of(this).inputDecorationTheme;
  void popDialog()=>Navigator.pop(this);

  void pushReplace(Widget route) {
    Navigator.pushReplacement(
      this,
      CupertinoPageRoute(builder: (context) => route),
    );
  }


  void popRoute({dynamic result}) {
    // if(kIsWeb){
    //
    //   html.window.history.back();
    //   return;
    // }
    Navigator.pop(this, result);
  }

  void pop() {
    Navigator.pop(this);
  }

  dynamic push(Widget route) async {
    final result = await Navigator.push(
      this,
      CupertinoPageRoute(builder: (context) => route),
    );
    return result;
  }
  Future<void> pushRemoveUntil(Widget route, {dynamic argument}) async {
    await Navigator.pushAndRemoveUntil(
        this,
        CupertinoPageRoute(builder: (context) => route),
            (Route<dynamic> route) => false);
  }
}