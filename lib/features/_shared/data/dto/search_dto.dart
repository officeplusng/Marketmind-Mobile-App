class SearchResponse {
  final bool? success;
  final SearchData? data;
  final String? error;
  final String? timestamp;
  final Metadata? metadata;

  SearchResponse({
    this.success,
    this.data,
    this.error,
    this.timestamp,
    this.metadata,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      success: json['success'],
      data: json['data'] != null ? SearchData.fromJson(json['data']) : null,
      error: json['error'],
      timestamp: json['timestamp'],
      metadata:
      json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
      'error': error,
      'timestamp': timestamp,
      'metadata': metadata?.toJson(),
    };
  }
}

class SearchData {
  final List<BestMatch>? bestMatches;

  SearchData({this.bestMatches});

  factory SearchData.fromJson(Map<String, dynamic> json) {
    return SearchData(
      bestMatches: json['bestMatches'] != null
          ? List<BestMatch>.from(
          json['bestMatches'].map((x) => BestMatch.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bestMatches': bestMatches?.map((x) => x.toJson()).toList(),
    };
  }
}

class BestMatch {
  final String? symbol;
  final String? name;
  final String? type;
  final String? region;
  final String? marketOpen;
  final String? marketClose;
  final String? timezone;
  final String? currency;
  final String? matchScore;

  BestMatch({
    this.symbol,
    this.name,
    this.type,
    this.region,
    this.marketOpen,
    this.marketClose,
    this.timezone,
    this.currency,
    this.matchScore,
  });

  factory BestMatch.fromJson(Map<String, dynamic> json) {
    return BestMatch(
      symbol: json['1. symbol'],
      name: json['2. name'],
      type: json['3. type'],
      region: json['4. region'],
      marketOpen: json['5. marketOpen'],
      marketClose: json['6. marketClose'],
      timezone: json['7. timezone'],
      currency: json['8. currency'],
      matchScore: json['9. matchScore'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '1. symbol': symbol,
      '2. name': name,
      '3. type': type,
      '4. region': region,
      '5. marketOpen': marketOpen,
      '6. marketClose': marketClose,
      '7. timezone': timezone,
      '8. currency': currency,
      '9. matchScore': matchScore,
    };
  }
}

class Metadata {
  final String? keywords;
  final String? type;

  Metadata({this.keywords, this.type});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      keywords: json['keywords'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'keywords': keywords,
      'type': type,
    };
  }
}
