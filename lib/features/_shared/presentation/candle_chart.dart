import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:marketmind/core/export/export.core.dart';

import 'mock_data.dart';


class CandleChart extends StatefulWidget {
  const CandleChart({Key? key}) : super(key: key);

  @override
  State<CandleChart> createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  final List<CandleData> _data = MockDataTesla.candles;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child:SizedBox(
        height: 280,
        width: double.infinity,
        child:  InteractiveChart(
          /** Only [candles] is required */

          candles: _data,
          /** Uncomment the following for examples on optional parameters */


          style: ChartStyle(
            priceGainColor: Color(0XFF17B26A),
            priceLossColor: Color(0XFFF04438),
            volumeColor: Colors.teal.withOpacity(0.8),
            priceGridLineColor: Color(0XFFF2F4F7),
            priceLabelStyle:context.textTheme.bodyMedium!.copyWith(color: AppColors.textGray1,fontWeight: FontWeight.w500),
            timeLabelStyle: context.textTheme.bodyMedium!.copyWith(color: AppColors.textGray1,fontWeight: FontWeight.w500),
            selectionHighlightColor: Colors.grey.withValues(alpha: 0.2),
            overlayBackgroundColor: Colors.grey[900]!.withValues(alpha: 0.6),
            overlayTextStyle: TextStyle(color: Colors.white),
            timeLabelHeight: 32,
            volumeHeightFactor: 0, // volume area is 20% of total height
          ),
          /** Customize axis labels */
          // timeLabel: (timestamp, visibleDataCount) => "📅",
          // priceLabel: (price) => "${price.round()} 💎",
          /** Customize overlay (tap and hold to see it)
           ** Or return an empty object to disable overlay info. */
          // overlayInfo: (candle) => {
          //   "💎": "🤚    ",
          //   "Hi": "${candle.high?.toStringAsFixed(2)}",
          //   "Lo": "${candle.low?.toStringAsFixed(2)}",
          // },
          /** Callbacks */
          // onTap: (candle) => print("user tapped on $candle"),
          // onCandleResize: (width) => print("each candle is $width wide"),
        ),
      ),
    );
  }

  void _computeTrendLines() {
    final ma7 = CandleData.computeMA(_data, 7);
    final ma30 = CandleData.computeMA(_data, 30);
    final ma90 = CandleData.computeMA(_data, 90);

    for (int i = 0; i < _data.length; i++) {
      _data[i].trends = [ma7[i], ma30[i], ma90[i]];
    }
  }

  void _removeTrendLines() {
    for (final data in _data) {
      data.trends = [];
    }
  }
}