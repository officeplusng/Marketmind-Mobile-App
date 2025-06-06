import 'package:marketmind/core/export/export.core.dart';

class ExpandableInfoComponent extends StatefulWidget {
  const ExpandableInfoComponent(
      {super.key, required this.child, required this.title,this.divide=true});

  final String title;

  final Widget child;
  final bool divide;

  @override
  State<ExpandableInfoComponent> createState() =>
      _ExpandableInfoComponentState();
}

class _ExpandableInfoComponentState extends State<ExpandableInfoComponent> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Padding(padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: context.textTheme.titleSmall,
              ),
              SvgPicture.asset(_expanded ? Assets.close : Assets.plus)
            ],
          ),),
        ),
        if(_expanded)
        ...[
        10.verticalSpace,
        widget.child],
        if(widget.divide)
          ...[
            5.verticalSpace,
            const Divider(
              color: Color(0XFFF2F4F7),
            )
          ]
      ],
    );
  }
}
