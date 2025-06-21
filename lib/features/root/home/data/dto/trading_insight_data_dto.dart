// MODEL FILE WITH NULLABLE FIELDS AND MANUAL fromJson/toJson
class MarketAnalysisData {
  final List<AiSignalSpotlight>? aiSignalSpotlights;
  final List<AiPatternDetection>? aiPatternDetections;
  final List<MarketAnomaly>? marketAnomalies;
  final List<MarketSentiment>? marketSentiments;
  final List<UpcomingCatalyst>? upcomingCatalysts;
  final List<SeniorRotationAnalysis>? seniorRotationAnalyses;
  final List<AssetToWatch>? assetsToWatch;

  MarketAnalysisData({
    this.aiSignalSpotlights,
    this.aiPatternDetections,
    this.marketAnomalies,
    this.marketSentiments,
    this.upcomingCatalysts,
    this.seniorRotationAnalyses,
    this.assetsToWatch,
  });

  factory MarketAnalysisData.fromJson(Map<String, dynamic> json) {
    return MarketAnalysisData(
      aiSignalSpotlights: (json['ai_signal_spotlight'] as List?)
          ?.map((e) => AiSignalSpotlight.fromJson(e))
          .toList(),
      aiPatternDetections: (json['ai_pattern_detection'] as List?)
          ?.map((e) => AiPatternDetection.fromJson(e))
          .toList(),
      marketAnomalies: (json['market_anomalies'] as List?)
          ?.map((e) => MarketAnomaly.fromJson(e))
          .toList(),
      marketSentiments: (json['market_sentiment'] as List?)
          ?.map((e) => MarketSentiment.fromJson(e))
          .toList(),
      upcomingCatalysts: (json['upcoming_catalysts'] as List?)
          ?.map((e) => UpcomingCatalyst.fromJson(e))
          .toList(),
      seniorRotationAnalyses:[],
      // (json['senior_rotation_analysis'] as List?)
      //     ?.map((e) => SeniorRotationAnalysis.fromJson(e))
      //     .toList(),
      assetsToWatch: (json['assets_to_watch'] as List?)
          ?.map((e) => AssetToWatch.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'ai_signal_spotlights': aiSignalSpotlights?.map((e) => e.toJson()).toList(),
    'ai_pattern_detections': aiPatternDetections?.map((e) => e.toJson()).toList(),
    'market_anomalies': marketAnomalies?.map((e) => e.toJson()).toList(),
    'market_sentiments': marketSentiments?.map((e) => e.toJson()).toList(),
    'upcoming_catalysts': upcomingCatalysts?.map((e) => e.toJson()).toList(),
    'senior_rotation_analyses': seniorRotationAnalyses?.map((e) => e.toJson()).toList(),
    'assets_to_watch': assetsToWatch?.map((e) => e.toJson()).toList(),
  };
}

class AiSignalSpotlight {
  final String? pair;
  final String? signal;
  final num? confidence;
  final num? price;
  final String? trend;
  final String? riskLevel;
  final String? timestamp;
  final String? conflictNote;

  AiSignalSpotlight({
    this.pair,
    this.signal,
    this.confidence,
    this.price,
    this.trend,
    this.riskLevel,
    this.timestamp,
    this.conflictNote,
  });

  factory AiSignalSpotlight.fromJson(Map<String, dynamic> json) => AiSignalSpotlight(
    pair: json['pair'],
    signal: json['signal'],
    confidence: json['confidence'],
    price: json['price'],
    trend: json['trend'],
    riskLevel: json['risk_level'],
    timestamp: json['timestamp'],
    conflictNote: json['conflict_note'],
  );

  Map<String, dynamic> toJson() => {
    'pair': pair,
    'signal': signal,
    'confidence': confidence,
    'price': price,
    'trend': trend,
    'risk_level': riskLevel,
    'timestamp': timestamp,
    'conflict_note': conflictNote,
  };
}

class AiPatternDetection {
  final String? pattern;
  final String? pair;
  final String? signal;
  final num? confidence;
  final String? strength;
  final String? patternType;
  final String? detectedAt;
  final num? startPrice;
  final num? targetPrice;
  final num? stopLoss;

  AiPatternDetection({
    this.pattern,
    this.pair,
    this.signal,
    this.confidence,
    this.strength,
    this.patternType,
    this.detectedAt,
    this.startPrice,
    this.targetPrice,
    this.stopLoss,
  });

  factory AiPatternDetection.fromJson(Map<String, dynamic> json) => AiPatternDetection(
    pattern: json['pattern'],
    pair: json['pair'],
    signal: json['signal'],
    confidence: json['confidence'],
    strength: json['strength'],
    patternType: json['pattern_type'],
    detectedAt: json['detected_at'],
    startPrice: json['start_price'],
    targetPrice: json['target_price'],
    stopLoss: json['stop_loss'],
  );

  Map<String, dynamic> toJson() => {
    'pattern': pattern,
    'pair': pair,
    'signal': signal,
    'confidence': confidence,
    'strength': strength,
    'pattern_type': patternType,
    'detected_at': detectedAt,
    'start_price': startPrice,
    'target_price': targetPrice,
    'stop_loss': stopLoss,
  };
}

class MarketAnomaly {
  final String? type;
  final String? description;
  final String? impact;
  final List<String>? pairsAffected;
  final String? detectedAt;
  final String? severity;
  final String? recommendation;

  MarketAnomaly({
    this.type,
    this.description,
    this.impact,
    this.pairsAffected,
    this.detectedAt,
    this.severity,
    this.recommendation,
  });

  factory MarketAnomaly.fromJson(Map<String, dynamic> json) => MarketAnomaly(
    type: json['type'],
    description: json['description'],
    impact: json['impact'],
    pairsAffected: (json['pairs_affected'] as List?)?.cast<String>(),
    detectedAt: json['detected_at'],
    severity: json['severity'],
    recommendation: json['recommendation'],
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'description': description,
    'impact': impact,
    'pairs_affected': pairsAffected,
    'detected_at': detectedAt,
    'severity': severity,
    'recommendation': recommendation,
  };
}

class MarketSentiment {
  final String? pair;
  final String? sentiment;
  final num? confidence;
  final String? source;
  final String? summary;
  final String? title;
  final String? url;
  final String? publishedAt;
  final SentimentAnalysisDetails? analysisDetails;

  MarketSentiment({
    this.pair,
    this.sentiment,
    this.confidence,
    this.source,
    this.summary,
    this.title,
    this.url,
    this.publishedAt,
    this.analysisDetails,
  });

  factory MarketSentiment.fromJson(Map<String, dynamic> json) => MarketSentiment(
    pair: json['pair'],
    sentiment: json['sentiment'],
    confidence: json['confidence'],
    source: json['source'],
    summary: json['summary'],
    title: json['title'],
    url: json['url'],
    publishedAt: json['published_at'],
    analysisDetails: json['analysis_details'] != null
        ? SentimentAnalysisDetails.fromJson(json['analysis_details'])
        : null,
  );

  Map<String, dynamic> toJson() => {
    'pair': pair,
    'sentiment': sentiment,
    'confidence': confidence,
    'source': source,
    'summary': summary,
    'title': title,
    'url': url,
    'published_at': publishedAt,
    'analysis_details': analysisDetails?.toJson(),
  };
}

class SentimentAnalysisDetails {
  final String? finbertSentiment;
  final num? finbertConfidence;
  final String? gptSentiment;
  final String? titleSentiment;
  final bool? consensus;

  SentimentAnalysisDetails({
    this.finbertSentiment,
    this.finbertConfidence,
    this.gptSentiment,
    this.titleSentiment,
    this.consensus,
  });

  factory SentimentAnalysisDetails.fromJson(Map<String, dynamic> json) => SentimentAnalysisDetails(
    finbertSentiment: json['finbert_sentiment'],
    finbertConfidence: json['finbert_confidence'],
    gptSentiment: json['gpt_sentiment'],
    titleSentiment: json['title_sentiment'],
    consensus: json['consensus'],
  );

  Map<String, dynamic> toJson() => {
    'finbert_sentiment': finbertSentiment,
    'finbert_confidence': finbertConfidence,
    'gpt_sentiment': gptSentiment,
    'title_sentiment': titleSentiment,
    'consensus': consensus,
  };
}

class UpcomingCatalyst {
  final String? event;
  final String? country;
  final String? currency;
  final String? impact;
  final String? forecast;
  final String? previous;
  final String? actual;
  final String? date;

  UpcomingCatalyst({
    this.event,
    this.country,
    this.currency,
    this.impact,
    this.forecast,
    this.previous,
    this.actual,
    this.date,
  });

  factory UpcomingCatalyst.fromJson(Map<String, dynamic> json) => UpcomingCatalyst(
    event: json['event'],
    country: json['country'],
    currency: json['currency'],
    impact: json['impact'],
    forecast: json['forecast'],
    previous: json['previous'],
    actual: json['actual'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'event': event,
    'country': country,
    'currency': currency,
    'impact': impact,
    'forecast': forecast,
    'previous': previous,
    'actual': actual,
    'date': date,
  };
}

class SeniorRotationAnalysis {
  final String? primaryTrend;
  final num? rotationStrength;
  final List<String>? sectorsInFavor;
  final List<String>? sectorsOutOfFavor;
  final String? recommendation;
  final num? confidence;
  final String? volatilityEnvironment;
  final num? volatilityIndex;
  final SignalDistribution? signalDistribution;
  final String? fixedModeNote;

  SeniorRotationAnalysis({
    this.primaryTrend,
    this.rotationStrength,
    this.sectorsInFavor,
    this.sectorsOutOfFavor,
    this.recommendation,
    this.confidence,
    this.volatilityEnvironment,
    this.volatilityIndex,
    this.signalDistribution,
    this.fixedModeNote,
  });

  factory SeniorRotationAnalysis.fromJson(Map<String, dynamic> json) => SeniorRotationAnalysis(
    primaryTrend: json['primary_trend'],
    rotationStrength: json['rotation_strength'],
    sectorsInFavor: (json['sectors_in_favor'] as List?)?.cast<String>(),
    sectorsOutOfFavor: (json['sectors_out_of_favor'] as List?)?.cast<String>(),
    recommendation: json['recommendation'],
    confidence: json['confidence'],
    volatilityEnvironment: json['volatility_environment'],
    volatilityIndex: json['volatility_index'],
    signalDistribution: json['signal_distribution'] != null
        ? SignalDistribution.fromJson(json['signal_distribution'])
        : null,
    fixedModeNote: json['fixed_mode_note'],
  );

  Map<String, dynamic> toJson() => {
    'primary_trend': primaryTrend,
    'rotation_strength': rotationStrength,
    'sectors_in_favor': sectorsInFavor,
    'sectors_out_of_favor': sectorsOutOfFavor,
    'recommendation': recommendation,
    'confidence': confidence,
    'volatility_environment': volatilityEnvironment,
    'volatility_index': volatilityIndex,
    'signal_distribution': signalDistribution?.toJson(),
    'fixed_mode_note': fixedModeNote,
  };
}

class SignalDistribution {
  final int? buySignals;
  final int? sellSignals;
  final int? holdSignals;
  final num? buyPercentage;
  final num? sellPercentage;
  final num? holdPercentage;

  SignalDistribution({
    this.buySignals,
    this.sellSignals,
    this.holdSignals,
    this.buyPercentage,
    this.sellPercentage,
    this.holdPercentage,
  });

  factory SignalDistribution.fromJson(Map<String, dynamic> json) => SignalDistribution(
    buySignals: json['buy_signals'],
    sellSignals: json['sell_signals'],
    holdSignals: json['hold_signals'],
    buyPercentage: json['buy_percentage'],
    sellPercentage: json['sell_percentage'],
    holdPercentage: json['hold_percentage'],
  );

  Map<String, dynamic> toJson() => {
    'buy_signals': buySignals,
    'sell_signals': sellSignals,
    'hold_signals': holdSignals,
    'buy_percentage': buyPercentage,
    'sell_percentage': sellPercentage,
    'hold_percentage': holdPercentage,
  };
}

class AssetToWatch {
  final String? symbol;
  final double? price;
  final double? change24h;
  final double? changePercent;
  final double? volume;
  final String? trend;
  final String? signal;
  final double? volatility;
  final String? volatilityClass;
  final double? supportLevel;
  final double? resistanceLevel;

  AssetToWatch({
    this.symbol,
    this.price,
    this.change24h,
    this.changePercent,
    this.volume,
    this.trend,
    this.signal,
    this.volatility,
    this.volatilityClass,
    this.supportLevel,
    this.resistanceLevel,
  });

  factory AssetToWatch.fromJson(Map<String, dynamic> json) => AssetToWatch(
    symbol: json['symbol'],
    price: json['price'],
    change24h: json['change_24h'],
    changePercent: json['change_percent'],
    volume: json['volume'],
    trend: json['trend'],
    signal: json['signal'],
    volatility: json['volatility'],
    volatilityClass: json['volatility_class'],
    supportLevel: json['support_level'],
    resistanceLevel: json['resistance_level'],
  );

  Map<String, dynamic> toJson() => {
    'symbol': symbol,
    'price': price,
    'change_24h': change24h,
    'change_percent': changePercent,
    'volume': volume,
    'trend': trend,
    'signal': signal,
    'volatility': volatility,
    'volatility_class': volatilityClass,
    'support_level': supportLevel,
    'resistance_level': resistanceLevel,
  };
}
