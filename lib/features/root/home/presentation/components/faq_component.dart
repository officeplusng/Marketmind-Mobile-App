import 'package:flutter/cupertino.dart';
import 'package:marketmind/core/assets/assets.dart';
import 'package:marketmind/core/export/export.core.dart';

class FaqComponent extends StatefulWidget {
  const FaqComponent({super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  State<FaqComponent> createState() => _FaqComponentState();
}

class _FaqComponentState extends State<FaqComponent> {
  bool viewing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Text(
              widget.title,
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: AppColors.textBlack1),
            )),
            20.horizontalSpace,
            InkWell(
              onTap: () => setState(() {
                viewing = !viewing;
              }),
              child: Icon(
                viewing ? Icons.remove : Icons.add,
              ),
            )
          ],
        ),
        10.verticalSpace,
        if (viewing) ...[
          Text(
            widget.content,
            style: context.textTheme.bodyMedium
                ?.copyWith(color: AppColors.textGray1),
          ),
          10.verticalSpace
        ],
       const Divider(color: AppColors.textGray12,),
        10.verticalSpace
      ],
    );
  }
}
