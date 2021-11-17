import 'package:flutter/material.dart';
import 'package:flutter_application_1/retrofit_generate.dart';
import 'package:dio/dio.dart';

class ListBarangScreen extends StatefulWidget {
  const ListBarangScreen({Key? key}) : super(key: key);

  @override
  _ListBarangScreenState createState() => _ListBarangScreenState();
}

class _ListBarangScreenState extends State<ListBarangScreen> {
  var halaman = 1;
  var maxHalaman = 1;
  late final listBarang;
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final client = RestClient(dio);
    this.listBarang = client.getBarangs();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("List Barang"),
      ),
      body: FutureBuilder<List<Barang>>(
          future: listBarang,
          builder: (context, snapshot) {
            print("tes");
            print(snapshot);
            if (snapshot.hasData) {
              List<Barang> generateBarang = snapshot.data??[];
              if(generateBarang==null){
                maxHalaman=1;
              }else{
                maxHalaman = (generateBarang.length / 10).ceil();
              }
              return Scaffold(
                body: Padding(
                  padding:
                      EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 25),
                  child: SingleChildScrollView(
                    child: BarangList(
                        barangList: generateBarang.sublist(
                            (halaman - 1) * 10,
                            halaman * 10 > generateBarang.length
                                ? generateBarang.length
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
    );
  }
}

class BarangList extends StatefulWidget {
  final List<dynamic> barangList;
  const BarangList({Key? key, required this.barangList}) : super(key: key);
  @override
  _BarangListState createState() => _BarangListState();
}

class _BarangListState extends State<BarangList> {
  @override
  Widget build(BuildContext context) {
    var data = widget.barangList;
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
          items.namaBarang,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        collapsedTextColor: Colors.black,
        textColor: Colors.black,
        subtitle: Text("Id Barang " + items.id.toString()),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Nama Barang")]),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text(items.namaBarang), Text(items.hargaBarang.toString())],
                  )
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Detail"),
                      style: ElevatedButton.styleFrom(primary: Colors.orange))
                ])
              ]))
        ],
      ),
    );
  }
}
