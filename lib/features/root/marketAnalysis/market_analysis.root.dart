import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/components/scaffold/base_scaffold.dart';
import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';
import 'package:marketmind/core/export/export.core.dart';

class MarketAnalysis extends StatefulWidget {
  const MarketAnalysis({super.key});

  @override
  State<MarketAnalysis> createState() => _MarketAnalysisState();
}

class _MarketAnalysisState extends State<MarketAnalysis> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        child: Column(
      children: [
        60.verticalSpace,
        Text(
          'Market Analysis',
          style: context.textTheme.titleMedium
              ?.copyWith(fontSize: 30, fontWeight: FontWeight.w600),
        )
      ],
    ));
  }
}
