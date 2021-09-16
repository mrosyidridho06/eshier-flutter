import 'dart:io';

import 'package:flutter_application_1/utils/constants.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/services/service.dart';

class BulanService extends Service{
  BulanService();
  Dio dio = Dio();
  Future<List<dynamic>> get fetchBulanList async {
    dio.options.headers['content-Type'] = 'application/json';

    var result = await dio.get(Constant.API+"get_aduan.php").catchError((error, stackTrace){
      print(error);
    });
    var hasil = result.data;
    if(!hasil['success']){
      return [];
    }
    return hasil["result"];
  }
  Future<List<dynamic>> fetchBulanId(int id_bulan) async {
    dio.options.headers['content-Type'] = 'application/json';
    var result = await dio.get(Constant.API+"get_aduan_by_id.php?id_aduan="+id_bulan.toString()).catchError((error, stackTrace){
      print(error);
    });
    var hasil = result.data;
    if(!hasil['success']){
      return [];
    }
    return hasil["result"];
  }
}