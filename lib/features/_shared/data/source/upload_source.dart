import 'dart:io';
import 'package:dio/dio.dart';
import 'package:marketmind/core/network/base_url.dart';
import 'package:retrofit/retrofit.dart';
part 'upload_source.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class UploadSource {
  factory UploadSource(Dio dio, {String baseUrl}) = _UploadSource;

  @POST("/upload")
  @MultiPart()
  Future<dynamic> uploadFile(
      @Part(name: 'file' ) File file,
  );
}
