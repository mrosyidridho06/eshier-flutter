import 'package:dio/dio.dart' hide Headers;
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_application_1/utils/constants.dart';

part 'retrofit_generate.g.dart';

Barang deserializeBarang(Map<String, Barang> json) =>Barang.fromJson(json);
List<Barang> deserializeBarangList(List<Map<String, Barang>> json)=>json.map((e)=>Barang.fromJson(e)).toList();
Map<String,dynamic> serializeBarang(Barang object)=>object.toJson();
List<Map<String, dynamic>> serializeBarangList(List<Barang> objects)=>objects.map((e)=>e.toJson()).toList();

Transaksi deserializeTransaksi(Map<String, Transaksi> json) => Transaksi.fromJson(json);
List<Transaksi> deserializeTransaksiList(List<Map<String, Transaksi>> json)=>json.map((e)=>Transaksi.fromJson(e)).toList();
Map<String, dynamic> serializeTransaksi(Transaksi transaksi)=>transaksi.toJson();
List<Map<String, dynamic>> serializeTransaksiList(List<Transaksi> transaksis)=>transaksis.map((e)=>e.toJson()).toList();


@RestApi(baseUrl: Constant.API)
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl})=_RestClient;

  @GET('/barang')
  Future<List<Barang>> getBarangs();

  @GET('/barang/{id}')
  Future<Barang> getBarang(@Path() int id);

  @POST('/barang')
  Future<Success> addBarang(@Body() Barang barang);

  @GET('/transaksi')
  Future<List<Transaksi>> getTransaksi();

  @GET('/transaksi/{id}')
  Future<Transaksi> getTransaksiById(@Path() int id);

  @POST('/transaksi')
  Future<Success> addTransaksi(@Body() Transaksi transaksi);

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

@JsonSerializable()
class Transaksi{
  Transaksi({required this.id, required this.waktu, required this.totalTransaksi, this.barang=const []});
  final int id;
  final DateTime waktu;
  final int totalTransaksi;
  final List<DetailTransaksi>? barang;
  factory Transaksi.fromJson(Map<String, dynamic> json)=> _$TransaksiFromJson(json);
  Map<String, dynamic> toJson()=>_$TransaksiToJson(this);
}

@JsonSerializable()
class DetailTransaksi{
  DetailTransaksi({required this.jumlah, required this.transaksi_detail});
  final int jumlah;
  final Barang transaksi_detail;
  factory DetailTransaksi.fromJson(Map<String, dynamic> json)=>_$DetailTransaksiFromJson(json);
  Map<String, dynamic> toJson()=>_$DetailTransaksiToJson(this);
}


@JsonSerializable()
class Success{
  Success({required this.success, required this.message});
  final bool success;
  final String message;

  factory Success.fromJson(Map<String, dynamic> json)=>_$SuccessFromJson(json);
}