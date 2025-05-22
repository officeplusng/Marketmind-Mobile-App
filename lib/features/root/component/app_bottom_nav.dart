import 'package:marketmind/core/export/export.core.dart';


class AppBottomNav extends StatelessWidget {
  const AppBottomNav(
      {super.key,
      required this.items,
      required this.currentIndex,
      required this.onItemChange});

  final int currentIndex;
  final List<String> items;

  final void Function(int) onItemChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(bottom: 40,right: 60,left: 60,top: 10),
      decoration: ShapeDecoration(
        color: AppColors.bottomNavColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(999))),
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              items.length,
              (e) => InkWell(
                    onTap: () {
                      onItemChange(e);
                    },
                    child: AppBottomNavItemComponent(
                      selected: currentIndex == e,
                      child: SvgPicture.asset(
                        items[e],
                        color: currentIndex == e
                            ? AppColors.white
                            : null,
                      ),
                    ),
                  ))),
    );
  }
}

class AppBottomNavItemComponent extends StatelessWidget {
  const AppBottomNavItemComponent(
      {super.key, required this.child, this.selected = false});

  final Widget child;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    if (!selected) {
      return Padding(padding: const EdgeInsets.all(10),child: child,);
    }
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: const ShapeDecoration(
          shape: CircleBorder(),
          gradient: LinearGradient(colors: [
            Color(0xFFAD00FE),
            Color(0xFF00E0EE),
          ])),
      child: child,
    );
  }
}
