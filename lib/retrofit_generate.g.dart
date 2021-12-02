// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit_generate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barang _$BarangFromJson(Map<String, dynamic> json) {
  return Barang(
    id: json['id'] as int,
    namaBarang: json['namaBarang'] as String,
    hargaBarang: json['hargaBarang'] as int,
  );
}

Map<String, dynamic> _$BarangToJson(Barang instance) => <String, dynamic>{
      'id': instance.id,
      'namaBarang': instance.namaBarang,
      'hargaBarang': instance.hargaBarang,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.0.2.2:3000/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Barang>> getBarangs() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Barang>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/barang',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Barang.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Barang> getBarang(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Barang>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/barang/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Barang.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
