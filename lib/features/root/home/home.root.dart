import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        backgroundAsset: '',
        child: Column(
          children: [],
        ));
  }
}
