import 'package:marketmind/core/export/export.core.dart';

import 'input_field2.dart';

class TpSlConfiguration extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;

  const TpSlConfiguration(
      {super.key,
      this.hint,
      required this.controller,
      required this.descriptionTrailing,
      required this.riskAmount,
      this.sliderColor,
      required this.profit,
      required this.price,
      required this.pips,
      required this.title});

  final String title;
  final String price;
  final String pips;
  final String riskAmount;
  final String profit;
  final String descriptionTrailing;
  final Color? sliderColor;

  @override
  State<TpSlConfiguration> createState() => _TpSlConfigurationState();
}

class _TpSlConfigurationState extends State<TpSlConfiguration> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return _container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: context.textTheme.titleSmall
                  ?.copyWith(color: AppColors.textGray1),
            ),
            const Spacer(),
            const Icon(
              Icons.info_outline,
              color: AppColors.primaryDark,
            ),
            5.horizontalSpace,
            Text(
              '${_currentValue.round()} pips',
              style: context.textTheme.titleSmall,
            )
          ],
        ),
        10.verticalSpace,
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: CustomBorderThumb(
                thumbRadius: 12, color: widget.sliderColor ?? AppColors.red),
            activeTrackColor: widget.sliderColor ?? AppColors.red,
            trackHeight: 8,
            padding: const EdgeInsets.all(0),
            inactiveTrackColor: AppColors.white,
          ),
          child: Slider(
            value: _currentValue,
            min: 0,
            max: 100,
            divisions: 100,
            onChanged: (value) => setState(() => _currentValue = value),
          ),
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price: ${widget.price}',
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.textGray1),
            ),
            Text(
              'Price: ${widget.profit}',
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppColors.textGray1),
            ),
          ],
        ),
        10.verticalSpace,
        InputField2(
          controller: widget.controller,
          hint: widget.hint,
          onChange: (value){
            int intValue = int.tryParse(value.trim())??1;
            setState(() {
              _currentValue=intValue.toDouble();
            });
          },
          inputType: TextInputType.number,
        ),
        10.verticalSpace,
        Text(
          'Number of pips for ${widget.descriptionTrailing}',
          style: context.textTheme.bodyMedium,
        )
      ],
    ));
  }

  Widget _container({required Widget child}) {
    return WrapperContainer.rectangular(
        bordered: true,
        useHeight: false,
        useWidth: false,
        backgroundColor: const Color(0XFFFCFCFD),
        borderColor: const Color(0XFFF2F4F7),
        padding: const EdgeInsets.all(8),
        borderRadius: 8,
        child: child);
  }
}

class CustomBorderThumb extends SliderComponentShape {
  final double thumbRadius;

  final Color color;

  CustomBorderThumb({required this.thumbRadius, required this.color});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      Size.fromRadius(thumbRadius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // White filled circle
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Blue border
    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}
