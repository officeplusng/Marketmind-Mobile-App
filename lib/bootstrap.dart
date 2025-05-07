
import 'dart:async';
import 'package:flutter/cupertino.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  //await dotenv.load();
  runApp(await builder());
}