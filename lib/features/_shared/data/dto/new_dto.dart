class NewsDto {
  final String title;
  final String content;
  final String? source;
  final String? url;
  final DateTime? time;
  final String? category;

  const NewsDto(
      {required this.title,
      required this.content,
      this.source,
      this.category,
      this.url,
      this.time});

  static final List<NewsDto> dummyNews = [
    NewsDto(
      title: 'Bitcoin Hits New All-Time High',
      content:
          'Bitcoin surged past \$70,000 today, reaching a new all-time high amid strong institutional demand.',
      source: 'CoinDesk',
      url: 'https://www.coindesk.com/bitcoin-all-time-high',
      time: DateTime.now().subtract(const Duration(hours: 2)),
      category: 'crypto',
    ),
    NewsDto(
      title: 'Apple to Announce New MacBooks',
      content:
          'Apple is expected to unveil its new line of M4-powered MacBooks at next week’s WWDC.',
      source: 'TechCrunch',
      url: 'https://techcrunch.com/apple-macbook-m4',
      time: DateTime.now().subtract(const Duration(days: 1)),
      category: 'tech',
    ),
    NewsDto(
      title: 'Ethereum Gaining Developer Attention',
      content:
          'Ethereum continues to attract the largest number of blockchain developers, outpacing competitors.',
      source: 'The Block',
      url: 'https://www.theblock.co/ethereum-developer-growth',
      time: DateTime.now().subtract(const Duration(hours: 5)),
      category: 'crypto',
    ),
    NewsDto(
      title: 'US Fed Keeps Interest Rates Steady',
      content:
          'The Federal Reserve decided to hold interest rates steady, citing inflation concerns and labor market conditions.',
      source: 'Reuters',
      url: 'https://www.reuters.com/fed-interest-rates-june',
      time: DateTime.now().subtract(const Duration(days: 2)),
      category: 'economy',
    ),
    NewsDto(
      title: 'Tesla Stock Drops After Earnings Miss',
      content:
          'Tesla shares fell 6% after reporting weaker-than-expected quarterly earnings and lower vehicle deliveries.',
      source: 'CNBC',
      url: 'https://www.cnbc.com/tesla-earnings-q2',
      time: DateTime.now().subtract(const Duration(hours: 12)),
      category: 'stock',
    ),
  ];
}

class GenericNewsResponse {
  final bool success;
  final Map<String, dynamic> data;

  GenericNewsResponse({
    required this.success,
    required this.data,
  });

  factory GenericNewsResponse.fromJson(Map<String, dynamic> json) {
    return GenericNewsResponse(
      success: json['success'] ?? false,
      data: json['data'],
    );
  }
}


class NewsData {
  final String symbol;
  final List<Article> combinedArticles;

  NewsData({
    required this.symbol,
    required this.combinedArticles,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      symbol: json['symbol'] ?? '',
      combinedArticles: (json['combined_articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList(),
    );
  }

}

class FinancialNewsData {
  final int totalResults;
  final List<Article> combinedArticles;

  FinancialNewsData({
    required this.totalResults,
    required this.combinedArticles,
  });

  factory FinancialNewsData.fromJson(Map<String, dynamic> json) {
    return FinancialNewsData(
      totalResults: json['symbol'] ?? 0,
      combinedArticles: (json['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList(),
    );
  }

}

class Article {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;
  final String? sourceApi;
  final bool hasSentiment;

  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
    this.sourceApi,
    required this.hasSentiment,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      sourceApi: json['source_api'],
      hasSentiment: json['has_sentiment'] ?? false,
    );
  }

}

class Source {
  final String? id;
  final String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

}
