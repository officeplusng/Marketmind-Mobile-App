import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';

class HomeAppBarActionIcon extends StatelessWidget {
  const HomeAppBarActionIcon({super.key,  this.asset='',this.child,this.onClick,this.color});

  final String asset;
  final Widget? child;
  final VoidCallback? onClick;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration:
          ShapeDecoration(shape: CircleBorder(), color:color?? AppColors.gray),
        child: child??SvgPicture.asset(
          asset,
        ),
      ),
    );
  }
}
