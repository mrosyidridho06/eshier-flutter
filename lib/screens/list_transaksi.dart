import 'package:flutter/material.dart';
import 'package:flutter_application_1/retrofit_generate.dart';
import 'package:dio/dio.dart';

import 'package:flutter_application_1/screens/route.dart' as route;

class ListTransaksiScreen extends StatefulWidget {
  const ListTransaksiScreen({Key? key}) : super(key: key);

  @override
  _ListTransaksiScreenState createState() => _ListTransaksiScreenState();
}

class _ListTransaksiScreenState extends State<ListTransaksiScreen> {
  var halaman = 1;
  var maxHalaman = 1;
  late final listTransaksi;
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final client = RestClient(dio);
    this.listTransaksi = client.getTransaksi();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("List Transaksi"),
      ),
      body: FutureBuilder<List<Transaksi>>(
          future: listTransaksi,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Transaksi> generateTransaksi = snapshot.data??[];
              if(generateTransaksi==null){
                maxHalaman=1;
              }else{
                maxHalaman = (generateTransaksi.length / 10).ceil();
              }
              return Scaffold(
                body: Padding(
                  padding:
                  EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 25),
                  child: SingleChildScrollView(
                    child: TransaksiList(
                        transaksiList: generateTransaksi.sublist(
                            (halaman - 1) * 10,
                            halaman * 10 > generateTransaksi.length
                                ? generateTransaksi.length
                                : halaman * 10)),
                  ),
                ),
                backgroundColor: Colors.white10,
                bottomNavigationBar: BottomAppBar(
                  color: Colors.cyan,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Icon(Icons.arrow_left),
                        style: TextButton.styleFrom(primary: Colors.white),
                        onPressed: halaman == 1
                            ? null
                            : () {
                          setState(() {
                            halaman--;
                          });
                        },
                      ),
                      Text(
                        halaman.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      TextButton(
                        child: Icon(Icons.arrow_right),
                        style: TextButton.styleFrom(primary: Colors.white),
                        onPressed: halaman + 1 > maxHalaman
                            ? null
                            : () {
                          setState(() {
                            halaman++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton:FloatingActionButton.extended(
          onPressed: () => Navigator.pushReplacementNamed(context, route.barangAddPage),
          label: const Icon(Icons.add_circle_outline),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TransaksiList extends StatefulWidget {
  final List<Transaksi> transaksiList;
  const TransaksiList({Key? key, required this.transaksiList}) : super(key: key);
  @override
  _TransaksiListState createState() => _TransaksiListState();
}

class _TransaksiListState extends State<TransaksiList> {
  @override
  Widget build(BuildContext context) {
    var data = widget.transaksiList;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildPlayerModelList(data[index]);
      },
    );
  }

  Widget _buildPlayerModelList(items) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        title: Text(
          items.id.toString(),
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        collapsedTextColor: Colors.black,
        textColor: Colors.black,
        subtitle: Text("Id Transaksi " + items.id.toString()),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Waktu Transaksi"),
                        Text("Total Transaksi"),

                      ]),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text(items.waktu.toString()), Text(items.totalTransaksi.toString())],
                  ),

                ]),
                Row(children:[
                  ElevatedButton(
                    child: Text('Detail'),
                    onPressed: () => Navigator.pushReplacementNamed(context, route.transaksiDetailPage),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrangeAccent
                    )
                  ),
                ])
              ]))
        ],
      ),
    );
  }
}
