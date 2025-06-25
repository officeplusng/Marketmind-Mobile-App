import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/_shared/data/source/search_asset_source.dart';
import 'package:marketmind/features/_shared/data/dto/search_dto.dart';
import 'package:marketmind/features/_shared/enum/asset_category.dart';

@lazySingleton
class SearchAssetRepository {
  final SearchAssetSource _source;

  SearchAssetRepository(this._source);

  Future<ApiResult<SearchResponse>> searchStock(String keyword,
          {AssetCategory? category}) =>
      ApiResultWrapper.wrap(() {
        switch (category) {
          case AssetCategory.stock:
            return _source.searchStock(keyword);
          case AssetCategory.crypto:
            return _source.searchCrypto(keyword);
          case AssetCategory.forex:
            return _source.searchForex(keyword);
          default:
            return _source.searchStock(keyword);
        }
      });
}
