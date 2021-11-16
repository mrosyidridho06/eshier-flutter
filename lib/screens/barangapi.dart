import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/services/retroapi.dart';
import 'package:flutter_application_1/models/barang.dart';

class BarangApi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<BarangApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Flutter - Retrofit Implementation"),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        },
        label:Icon(Icons.cancel),
        backgroundColor: Colors.green,
      ),
    );
  }
  FutureBuilder<ResponseData> _buildBody(BuildContext context) {
    final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<ResponseData>(
      future: client.getBarang(),
      builder: (context, snapshot){
        if snapshot.connectionState == ConnectionState.done) {
          final ResponseData barang = snapshot.data;
          return _BuildListView(context, barang);
        } else{
          return Center(
            child: CircularProgressIndicator(),
          )
        }
      },
    );
  }
  Widget _buildListView(BuildContext context, ResponseData barang){
    return
      ListView.builder(itemBuilder: (context, index)){
        return Card(
          child: ListTile(
            leading: Icon(Icons.)
          )
        )
      }
  }
}