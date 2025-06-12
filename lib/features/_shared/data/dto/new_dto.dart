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
      content: 'Bitcoin surged past \$70,000 today, reaching a new all-time high amid strong institutional demand.',
      source: 'CoinDesk',
      url: 'https://www.coindesk.com/bitcoin-all-time-high',
      time: DateTime.now().subtract(const Duration(hours: 2)),
      category: 'crypto',
    ),
    NewsDto(
      title: 'Apple to Announce New MacBooks',
      content: 'Apple is expected to unveil its new line of M4-powered MacBooks at next week’s WWDC.',
      source: 'TechCrunch',
      url: 'https://techcrunch.com/apple-macbook-m4',
      time: DateTime.now().subtract(const Duration(days: 1)),
      category: 'tech',
    ),
    NewsDto(
      title: 'Ethereum Gaining Developer Attention',
      content: 'Ethereum continues to attract the largest number of blockchain developers, outpacing competitors.',
      source: 'The Block',
      url: 'https://www.theblock.co/ethereum-developer-growth',
      time: DateTime.now().subtract(const Duration(hours: 5)),
      category: 'crypto',
    ),
    NewsDto(
      title: 'US Fed Keeps Interest Rates Steady',
      content: 'The Federal Reserve decided to hold interest rates steady, citing inflation concerns and labor market conditions.',
      source: 'Reuters',
      url: 'https://www.reuters.com/fed-interest-rates-june',
      time: DateTime.now().subtract(const Duration(days: 2)),
      category: 'economy',
    ),
    NewsDto(
      title: 'Tesla Stock Drops After Earnings Miss',
      content: 'Tesla shares fell 6% after reporting weaker-than-expected quarterly earnings and lower vehicle deliveries.',
      source: 'CNBC',
      url: 'https://www.cnbc.com/tesla-earnings-q2',
      time: DateTime.now().subtract(const Duration(hours: 12)),
      category: 'stock',
    ),
  ];

}
