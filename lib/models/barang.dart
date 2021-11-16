import 'package:json_annotation/json_annotation.dart';
part 'barang.g.dart';

@JsonSerializable()
class Barang {
  int id;
  String namaBarang;
  String hargaBarang;
  String createdAt;
  String updateAt;

  Barang(
      {this.id,
      this.namaBarang,
      this.hargaBarang,
      this.createdAt,
      this.updateAt});

  factory Barang.fromJson(Map<String, dynamic> json) => _$BarangFromJson(json);
  Map<String, dynamic> toJson() => _$BarangToJson(this);
}

@JsonSerializable()
class ResponseData {
  int code;
  dynamic meta;
  List<dynamic> data;
  ResponseData({this.code, this.meta, this.data});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponeDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataFromJson(this);
}
