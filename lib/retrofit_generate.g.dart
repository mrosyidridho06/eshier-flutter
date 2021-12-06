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

Transaksi _$TransaksiFromJson(Map<String, dynamic> json) {
  return Transaksi(
    id: json['id'] as int,
    waktu: DateTime.parse(json['waktu'] as String),
    totalTransaksi: json['totalTransaksi'] as int,
    barang: (json['barang']   as List<dynamic>?)
        ?.map((e) => DetailTransaksi.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TransaksiToJson(Transaksi instance) => <String, dynamic>{
      'id': instance.id,
      'waktu': instance.waktu.toIso8601String(),
      'totalTransaksi': instance.totalTransaksi,
      'barang': instance.barang,
    };

DetailTransaksi _$DetailTransaksiFromJson(Map<String, dynamic> json) {
  return DetailTransaksi(
    jumlah: json['jumlah'] as int,
    transaksi_detail:
        Barang.fromJson(json['transaksi_detail'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DetailTransaksiToJson(DetailTransaksi instance) =>
    <String, dynamic>{
      'jumlah': instance.jumlah,
      'transaksi_detail': instance.transaksi_detail,
    };

Success _$SuccessFromJson(Map<String, dynamic> json) {
  return Success(
    success: json['success'] as bool,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$SuccessToJson(Success instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
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

  @override
  Future<Success> addBarang(barang) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(barang.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Success>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/barang',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Success.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Transaksi>> getTransaksi() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Transaksi>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/transaksi',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Transaksi.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Transaksi> getTransaksiById(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Transaksi>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/transaksi/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Transaksi.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Success> addTransaksi(transaksi) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(transaksi.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Success>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/transaksi',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Success.fromJson(_result.data!);
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
