import 'package:flutter/material.dart';
import 'package:flutter_application_1/retrofit_generate.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/screens/route.dart' as route;
import 'package:fluttertoast/fluttertoast.dart';

class AddBarangScreen extends StatefulWidget {
  const AddBarangScreen({Key? key}) : super(key: key);

  @override
  _AddBarangScreenState createState() => _AddBarangScreenState();
}

class _AddBarangScreenState extends State<AddBarangScreen> {

  TextEditingController namaBarangController = TextEditingController();
  TextEditingController hargaBarangController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final client = RestClient(dio);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("List Barang"),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: namaBarangController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama Barang',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    obscureText: true,
                    controller: hargaBarangController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Harga Barang',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton(
                      child: Text('Tambahkan Barang'),
                      onPressed: ()
                      async {
                        String namaBarang = namaBarangController.text;
                        int hargaBarang = int.parse(hargaBarangController.text);
                        Barang barang = new Barang(id:0,namaBarang: namaBarang, hargaBarang: hargaBarang);
                        Success hasil = await client.addBarang(barang);
                        if(hasil.success){
                          Navigator.pushReplacementNamed(context, route.barangPage);
                        }else{
                          Fluttertoast.showToast(
                            msg:hasil.message,
                            toastLength:Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                    )),
              ],
            )
        )
    );
  }
}


