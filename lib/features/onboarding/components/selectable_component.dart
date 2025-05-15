import 'package:marketmind/core/export/export.core.dart';

class SelectionEntity {
  final String title;
  final String? subtitle;
  final Widget? child;
  const SelectionEntity({required this.title, this.subtitle,this.child});
}

class SelectableComponent extends StatelessWidget {
  const SelectableComponent(
      {super.key,
      required this.title,
      required this.selected,
      this.onSelect,
      this.subtitle,
        this.child,
      this.radio = false});

  final String title;
  final String? subtitle;
  final bool selected;
  final Widget? child;
  final bool radio;
  final void Function(bool?)? onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: subtitle == null
            ?  const EdgeInsets.symmetric(vertical: 5)
            : (const EdgeInsets.symmetric(horizontal: 12, vertical: 2)),
        decoration: subtitle == null
            ? null
            : ShapeDecoration(
          color:selected? AppColors.white:AppColors.transparent,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
                side: BorderSide(
                    width: 1,
                    color: selected
                        ? AppColors.containerBackground1
                        : Colors.transparent),
              )),
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            3.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CheckOrRadio(
                  selected: selected,
                  radio: radio,
                ),
                10.horizontalSpace,
                Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: context.textTheme.titleSmall
                        ),
                        if (subtitle != null) ...[
                          5.verticalSpace,
                          Text(
                            subtitle!,
                            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          5.verticalSpace
                        ]
                      ],
                    ))
              ],
            ),
            if(selected&& child!=null)
              ...[
                10.verticalSpace,
                child!
              ]
          ],
        ),
      ),
      onTap: () {
        onSelect?.call(!selected);
      },
    );
  }
}

class SelectableOptionComponent extends StatefulWidget {
  const SelectableOptionComponent(
      {super.key,
       this.title,
      this.limit,
      required this.options,
      this.onSelect,
        this.subtitle,
      this.radio = false});

  final String? title;
  final String? subtitle;
  final bool radio;
  final int? limit;
  final List<SelectionEntity> options;
  final void Function(List<SelectionEntity>)? onSelect;

  @override
  State<SelectableOptionComponent> createState() =>
      _SelectableOptionComponentState();
}

class _SelectableOptionComponentState extends State<SelectableOptionComponent> {
  Set<SelectionEntity> selected = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if(widget.title!=null)
          ...[
        Text(
          widget.title!,
          style: context.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        20.verticalSpace],
        if(widget.subtitle!=null)
          ...[
            Text(
              widget.subtitle!,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.textGray1),
            ),
            15.verticalSpace
          ],
        ...List.generate(widget.options.length, (index) {
          final option = widget.options[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: SelectableComponent(
              title: option.title,
              radio: widget.radio,
              subtitle: option.subtitle,
              selected: selected.contains(option),
              onSelect: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  if (selected.contains(option)) {
                    selected.remove(option);
                    widget.onSelect?.call(selected.toList());
                    return;
                  }
                  if (widget.radio) {
                    selected = {option};
                    return;
                  }
                  if (widget.limit == selected.length) {
                    return;
                  }
                  selected.add(option);
                  widget.onSelect?.call(selected.toList());
                });
              },
              child: option.child,
            ),
          );
        })
      ],
    );
  }
}

class CheckOrRadio extends StatelessWidget {
  const CheckOrRadio({super.key, this.radio = false, required this.selected});

  final bool radio;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(_getIcon());
  }

  String _getIcon() {
    if (selected) {
      return radio ? Assets.radioCheck : Assets.checkBoxCheck;
    }
    return radio ? Assets.radioUnChecked : Assets.checkBoxUncheck;
  }
}
