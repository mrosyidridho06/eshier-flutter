import 'package:flutter_application_1/models/barang.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'retroapi.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:3000/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("/barang")
  Future<ResponseData> getBarang();
}