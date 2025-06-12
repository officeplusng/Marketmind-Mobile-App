class TradingInsightDto {
  final String asset;
  final String signal;
  final int confidence;
  final String info;
  final double? sl;
  final double? entryPrice;
  final String? category; //eg stock, forex, deriv, crypto
  final double? tp;

  const TradingInsightDto(
      {required this.asset,
      required this.confidence,
      this.category,
      required this.signal,
      required this.info,
      this.entryPrice,
      this.sl,
      this.tp});

  bool get buy => signal.toLowerCase().contains('buy');

  bool get sell => signal.toLowerCase().contains('sell');

   static List<TradingInsightDto> dummyTradingInsights = const  [
    TradingInsightDto(
      asset: 'BTC/USD',
      signal: 'Strong Buy',
      confidence: 85,
      info: 'Bitcoin is showing bullish momentum with increased volume.',
      entryPrice: 67850.5,
      sl: 67000.0,
      tp: 69000.0,
      category: 'crypto',
    ),
    TradingInsightDto(
      asset: 'AAPL',
      signal: 'Buy',
      confidence: 75,
      info: 'Apple stock expected to rise after positive earnings report.',
      entryPrice: 195.4,
      sl: 190.0,
      tp: 202.0,
      category: 'stock',
    ),
    TradingInsightDto(
      asset: 'EUR/USD',
      signal: 'Sell',
      confidence: 60,
      info: 'EUR/USD shows weakness as USD gains strength.',
      entryPrice: 1.085,
      sl: 1.09,
      tp: 1.075,
      category: 'forex',
    ),
    TradingInsightDto(
      asset: 'Gold',
      signal: 'Hold',
      confidence: 50,
      info: 'Gold is consolidating; wait for a breakout.',
      category: 'commodity',
    ),
    TradingInsightDto(
      asset: 'ETH/USD',
      signal: 'Sell',
      confidence: 70,
      info: 'Ethereum facing resistance at \$3,800.',
      entryPrice: 3750.0,
      sl: 3850.0,
      tp: 3600.0,
      category: 'crypto',
    ),
  ];

}
