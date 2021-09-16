import 'package:shared_preferences/shared_preferences.dart';

class Service{
  Future<String> getToken() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var refreshToken = pref.getString('refresh_token');
    return refreshToken??"";
  }
}