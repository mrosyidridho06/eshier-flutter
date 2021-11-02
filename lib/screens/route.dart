import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/daftar.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/welcome.dart';
import 'package:flutter_application_1/screens/list_barang.dart';

const String loginPage = 'login';
const String daftarPage = 'daftar';
const String welcomePage = 'welcome';
const String homePage = 'home';
const String barangPage = 'listbarang';

void login() {}

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
    default:
      throw ('Route Tidak ada');
  }
}
