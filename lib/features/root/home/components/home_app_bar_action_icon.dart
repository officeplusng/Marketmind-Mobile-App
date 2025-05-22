import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/export/export.core.dart';

class HomeAppBarActionIcon extends StatelessWidget {
  const HomeAppBarActionIcon({super.key,  this.asset='',this.child,this.onClick});

  final String asset;
  final Widget? child;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration:
        const ShapeDecoration(shape: CircleBorder(), color: AppColors.white),
        child: child??SvgPicture.asset(
          asset,
        ),
      ),
    );
  }
}
