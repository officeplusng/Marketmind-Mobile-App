import 'package:marketmind/core/components/scaffold/gradient_scaffold.dart';
import 'package:marketmind/core/export/export.core.dart';
import 'package:marketmind/features/root/_ai_chat/presentation/screens/ai_chat.root.dart';
import 'package:marketmind/features/root/component/app_bottom_nav.dart';
import 'package:marketmind/features/root/home/home.root.dart';
import 'package:marketmind/features/root/learning/presentation/learning.root.dart';
import 'package:marketmind/features/root/marketAnalysis/market_analysis.root.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
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
        horizontalPadding: 0,
        child: IndexedStack(
          index: _currentIndex,
          children: [
            HomeRoot(),
            MarketAnalysis(),
            LearningRoot(),
            AiChatScreen(),
            SizedBox()
          ],
        ));
  }
}
