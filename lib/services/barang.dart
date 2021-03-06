import 'dart:io';

import 'package:flutter_application_1/utils/constants.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/services/service.dart';

class BarangService extends Service {
  BarangService();
  Dio dio = Dio();
  Future<List<dynamic>> get fetchBarangList async {
    dio.options.headers['content-Type'] = 'application/json';
    print(Constant.API + "barang");
    var result =
        await dio.get(Constant.API + "barang").catchError((error, stackTrace) {
      print(error);
    });
    var hasil = result.data;
    if (hasil['responseCode'] != 200) {
      return [];
    }
    return hasil["responseData"];
  }

  Future<List<dynamic>> fetchBarangId(int id) async {
    dio.options.headers['content-Type'] = 'application/json';
    var result = await dio
        .get(Constant.API + "barang/" + id.toString())
        .catchError((error, stackTrace) {
      print(error);
    });
    var hasil = result.data;
    if (hasil['responseCode'] != 200) {
      return [];
    }
    return hasil["responseData"];
  }
}
