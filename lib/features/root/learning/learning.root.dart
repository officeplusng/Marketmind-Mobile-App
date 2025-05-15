import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';

class LearningRoot extends StatefulWidget {
  const LearningRoot({super.key});

  @override
  State<LearningRoot> createState() => _LearningRootState();
}

class _LearningRootState extends State<LearningRoot> {
  @override
  Widget build(BuildContext context) {
    return  GradientScaffold(child: Column(), backgroundAsset: '');
  }
}
