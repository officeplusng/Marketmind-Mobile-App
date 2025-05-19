import '../../../core/export/export.core.dart';
import '../home/components/home_app_bar_action_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,this.action=const[],this.backgroundColor,this.iconColor});

  final Color? iconColor;
  final Color? backgroundColor;
  final List<Widget> action;
  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeAppBarActionIcon(
            color: backgroundColor,

            onClick: () {
              context.pop();
            },
            child:  Icon(
              Icons.arrow_back,
              color: iconColor,
              size: 18,
            ),
          ),
          ...action
        ],
      );
  }
}
