import 'package:flutter/material.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/component/app_bottom_nav.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        bottomWidget: AppBottomNav(
            items: [
              'home_unselected'.svg,
              'page2'.svg,
              'page3'.svg,
              'page5'.svg,
              'page4'.svg,
            ],
            currentIndex: _currentIndex,
            onItemChange: (value) => setState(() {
                  _currentIndex = value;
                })),
        backgroundAsset: Assets.homeGradient,
        child: const Column(
          children: [],
        ));
  }
}
