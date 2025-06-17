import 'package:marketmind/core/export/export.core.dart';

class CopiedSnackBar extends StatelessWidget {
  const CopiedSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 25,
        decoration: ShapeDecoration(shape: RoundedRectangleBorder(),
        color:  AppColors.textBlack.withValues(alpha: .4)),
        );
  }
}
