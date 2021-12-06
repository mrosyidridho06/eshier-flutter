import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/daftar.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/welcome.dart';
import 'package:flutter_application_1/screens/list_barang.dart';
import 'package:flutter_application_1/screens/add_barang.dart';
import 'package:flutter_application_1/screens/list_transaksi.dart';
import 'package:flutter_application_1/screens/detail_transaksi.dart';
const String loginPage = 'login';
const String daftarPage = 'daftar';
const String welcomePage = 'welcome';
const String homePage = 'home';
const String barangPage = 'listbarang';
const String barangAddPage = 'addbarang';
const String transaksiPage = 'listTransaksi';
const String transaksiDetailPage = 'detailTransaksi';
void login() {}


class ScreenArguments{
  final int id;
  ScreenArguments(this.id);
}
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case welcomePage:
      return MaterialPageRoute(builder: (context) => Welcome());
    case daftarPage:
      return MaterialPageRoute(builder: (context) => DaftarScreen());
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case homePage:
      return MaterialPageRoute(builder: (context) => Home());
    case barangPage:
      return MaterialPageRoute(builder: (context) => ListBarangScreen());
    case barangAddPage:
      return MaterialPageRoute(builder: (context)=> AddBarangScreen());
    case transaksiPage:
      return MaterialPageRoute(builder: (context)=> ListTransaksiScreen());
    case transaksiDetailPage:
      final args = settings.arguments as ScreenArguments;
      return MaterialPageRoute(
          builder: (context){
            return DetailTransaksiScreen(
              id:args.id
            );
          }
      );
    default:
      throw ('Route Tidak ada');
  }
}
