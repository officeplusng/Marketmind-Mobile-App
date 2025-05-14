import 'package:flutter/gestures.dart';

import '../../../core/export/export.core.dart';

class HaveAnAccountComponent extends StatelessWidget {
  const HaveAnAccountComponent({super.key,required this.actionText,required this.contentText,this.onClick});

  final String actionText;
  final String contentText;
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    final style =
    context.textTheme.bodyMedium?.copyWith(color: AppColors.white);
    return  Align(
      alignment: Alignment.center,
      child:
      Text.rich(TextSpan(
          text: '$contentText\t\t',
          style: style?.copyWith(color: AppColors.gray),
          children: [
            TextSpan(
                text: actionText,
                style: style?.copyWith(
                    fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = onClick)
          ])),
    );
  }
}
