import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flutter_application_1/utils/constants.dart';
class MockAdapter extends HttpClientAdapter {
  static const String mockHost = Constant.API;
  static const String mockBase = "http://$mockHost";
  DefaultHttpClientAdapter _adapter = DefaultHttpClientAdapter();

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<Uint8List>? requestStream, Future? cancelFuture) async {
    Uri uri = options.uri;
    if (uri.host == mockHost) {
      switch (uri.path) {
        case "/barang":
          return ResponseBody.fromString(
            jsonEncode(["tag1", "tag2"]),
            200,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );
        default:
          return ResponseBody.fromString("", 404);
      }
    }
    return _adapter.fetch(options, requestStream, cancelFuture);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}