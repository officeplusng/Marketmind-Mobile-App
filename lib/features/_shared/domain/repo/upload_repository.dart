import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:marketmind/core/network/api_result.dart';
import 'package:marketmind/core/network/api_result_wrapper.dart';
import 'package:marketmind/features/_shared/data/source/upload_source.dart';

@lazySingleton
class UploadRepository {
  final UploadSource _source;

  UploadRepository(this._source);

  Future<ApiResult<dynamic>> uploadFile(File file) =>
      ApiResultWrapper.wrap(() => _source.uploadFile(file));
}
