import 'package:marketmind/core/export/export.core.dart';

class MarketAnalysisOption extends StatefulWidget {
  const MarketAnalysisOption(
      {super.key,
        this.initialSelected,
        this.options = const [],
        this.onSelected});

  final String? initialSelected;
  final List<String> options;
  final void Function(String)? onSelected;

  @override
  State<MarketAnalysisOption> createState() => _MarketAnalysisOptionState();
}

class _MarketAnalysisOptionState extends State<MarketAnalysisOption> {
  String? selected;

  @override
  void initState() {
    selected = widget.initialSelected ?? widget.options.firstOrNull;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseModalParent(
        horizontalPadding: 0,
        verticalPadding: 0,
        verticalMargin: 0,
        child: Column(
          children: [
            10.verticalSpace,
            Center(
              child: BaseModalParent.modalPin(margin: 5),
            ),
            20.verticalSpace,
            ...widget.options.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: InkWell(
                onTap: (){
                  setState(() {
                    selected = e;
                  });
                  widget.onSelected?.call(e);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.replaceAll('a_', '').capitalizeFirstWord(),
                      style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 18,
                          color: selected == e
                              ? AppColors.primary
                              : AppColors.textBlack1),
                    ),
                    if (selected == e)
                      Icon(
                        Icons.check,
                        color: AppColors.primary,
                      )
                  ],
                ),),
            )),
            30.verticalSpace
          ],
        ));
  }
}
