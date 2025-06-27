import 'dart:async';

import 'package:flutter/foundation.dart';

class DeBouncer {
  static final Map<String, Timer?> _timers = {};

  static void run({required String key, required VoidCallback action, required int milliseconds}) {
    _timers[key]?.cancel(); // Cancel any previous timer for this key
    _timers[key] = Timer(Duration(milliseconds: milliseconds), () {
      action();
      _timers.remove(key); // Remove timer after execution
    });
  }
}