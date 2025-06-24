class WatchListModel {
  final int? id;
  final String? category;
  final String? symbols;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;

  WatchListModel({
    this.id,
    this.category,
    this.symbols,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory WatchListModel.fromJson(Map<String, dynamic> json) {
    return WatchListModel(
      id: json['id'] ?? 0,
      category: json['category'] ?? '',
      symbols: json['symbols'] ?? '',
      userId: json['userId'] ?? 0,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'category': category, 'symbols': symbols};
  }
}

class DeleteWatchListModel {
  final int id;

  const DeleteWatchListModel({required this.id});

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
