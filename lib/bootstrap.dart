
import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  //await dotenv.load();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //       apiKey: "AIzaSyAGjq3vEQxuXhCQuKwkx_UXC5kBrBKd0cc",
  //       authDomain: "marketmind-1d553.firebaseapp.com",
  //       projectId: "marketmind-1d553",
  //       storageBucket: "marketmind-1d553.firebasestorage.app",
  //       messagingSenderId: "236579319826",
  //       appId: Platform.isAndroid?'1:236579319826:android:87cb899954310189d368cb':'1:236579319826:ios:c4f703add19cca73d368cb',
  //       measurementId: "G-EQQPWP25XT"),
  //   name: 'market-mind'
  // );
  runApp(await builder());
}