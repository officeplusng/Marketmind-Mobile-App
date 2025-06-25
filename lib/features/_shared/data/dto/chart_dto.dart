class ForexTimeSeriesResponse {
  final MetaData? metaData;
  final Map<String, CandleChartData>? timeSeriesFxDaily;

  ForexTimeSeriesResponse({
    this.metaData,
    this.timeSeriesFxDaily,
  });

  factory ForexTimeSeriesResponse.fromJson(Map<String, dynamic> json) {
    final keys = json.keys.toList();
    var timeSeriesFxDaily = json[keys.lastOrNull??'Time Series FX (Daily)'] != null
          ? (json[keys.lastOrNull??'Time Series FX (Daily)'] as Map<String, dynamic>)
              .map((key, value) => MapEntry(key, CandleChartData.fromJson(value)))
          : null;
    return ForexTimeSeriesResponse(
      metaData: json['Meta Data'] != null
          ? MetaData.fromJson(json['Meta Data'])
          : null,
      timeSeriesFxDaily: timeSeriesFxDaily,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Meta Data': metaData?.toJson(),
      'Time Series FX (Daily)': timeSeriesFxDaily?.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
    };
  }
}

class MetaData {
  final String? information;
  final String? fromSymbol;
  final String? toSymbol;
  final String? outputSize;
  final String? lastRefreshed;
  final String? timeZone;

  MetaData({
    this.information,
    this.fromSymbol,
    this.toSymbol,
    this.outputSize,
    this.lastRefreshed,
    this.timeZone,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      information: json['1. Information'],
      fromSymbol: json['2. From Symbol'],
      toSymbol: json['3. To Symbol'],
      outputSize: json['4. Output Size'],
      lastRefreshed: json['5. Last Refreshed'],
      timeZone: json['6. Time Zone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '1. Information': information,
      '2. From Symbol': fromSymbol,
      '3. To Symbol': toSymbol,
      '4. Output Size': outputSize,
      '5. Last Refreshed': lastRefreshed,
      '6. Time Zone': timeZone,
    };
  }
}

class CandleChartData {
  final double? open;
  final double? high;
  final double? low;
  final double? close;

  CandleChartData({
    this.open,
    this.high,
    this.low,
    this.close,
  });

  factory CandleChartData.fromJson(Map<String, dynamic> json) {
    return CandleChartData(
      open: double.tryParse(json['1. open'].toString()),
      high: double.tryParse(json['2. high'].toString()),
      low: double.tryParse(json['3. low'].toString()),
      close: double.tryParse(json['4. close'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '1. open': open,
      '2. high': high,
      '3. low': low,
      '4. close': close,
    };
  }
}
