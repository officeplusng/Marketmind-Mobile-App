class WatchListDto {
  final String asset;
  final String assetName;
  final double price;
  final double move;
  final String? priceSymbol;

  const WatchListDto(
      {required this.asset,
      required this.assetName,
      required this.price,
      this.priceSymbol,
      required this.move});
  static final List<WatchListDto> dummyWatchList = [
    WatchListDto(
      asset: 'BTC/USD',
      assetName: 'Bitcoin',
      price: 67850.5,
      move: 2.35,
      priceSymbol: '\$',
    ),
    WatchListDto(
      asset: 'AAPL',
      assetName: 'Apple Inc.',
      price: 195.4,
      move: -0.75,
      priceSymbol: '\$',
    ),
    WatchListDto(
      asset: 'ETH/USD',
      assetName: 'Ethereum',
      price: 3750.0,
      move: 1.12,
      priceSymbol: '\$',
    ),
    WatchListDto(
      asset: 'TSLA',
      assetName: 'Tesla Inc.',
      price: 222.75,
      move: -1.50,
      priceSymbol: '\$',
    ),
    WatchListDto(
      asset: 'EUR/USD',
      assetName: 'Euro/US Dollar',
      price: 1.085,
      move: 0.10,
      priceSymbol: null,
    ),
  ];

}
