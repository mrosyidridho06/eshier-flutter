import 'package:dio/dio.dart' hide Headers;
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_application_1/utils/constants.dart';

part 'retrofit_generate.g.dart';

Barang deserializeBarang(Map<String, Barang> json) =>Barang.fromJson(json);
List<Barang> deserializeBarangList(List<Map<String, Barang>> json)=>json.map((e)=>Barang.fromJson(e)).toList();
Map<String,dynamic> serializeBarang(Barang object)=>object.toJson();
List<Map<String, dynamic>> serializeBarangList(List<Barang> objects)=>objects.map((e)=>e.toJson()).toList();


@RestApi(baseUrl: Constant.API)
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl})=_RestClient;

  @GET('/barang')
  Future<List<Barang>> getBarangs();

  @GET('/barang/{id}')
  Future<Barang> getBarang(@Path() int id);

}

@JsonSerializable()
class Barang{
  Barang({required this.id, required this.namaBarang, required this.hargaBarang});
  final int id;
  final String namaBarang;
  final int hargaBarang;


  factory Barang.fromJson(Map<String, dynamic> json)=> _$BarangFromJson(json);
  Map<String, dynamic> toJson()=>_$BarangToJson(this);
}