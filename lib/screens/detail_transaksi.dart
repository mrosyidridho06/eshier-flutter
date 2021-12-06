import 'package:flutter/material.dart';
import 'package:flutter_application_1/retrofit_generate.dart';
import 'package:dio/dio.dart';

import 'package:flutter_application_1/screens/route.dart' as route;

class DetailTransaksiScreen extends StatefulWidget {
  final int id;
  const DetailTransaksiScreen({Key? key, required this.id}) : super(key: key);

  @override
  _DetailTransaksiScreenState createState() => _DetailTransaksiScreenState();
}

class _DetailTransaksiScreenState extends State<DetailTransaksiScreen> {
  var halaman = 1;
  var maxHalaman = 1;
  late final Future<Transaksi> detailTransaksi;
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final client = RestClient(dio);
    this.detailTransaksi = client.getTransaksiById(widget.id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Detail Transaksi"),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder<Transaksi>(
          future: detailTransaksi,
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              Transaksi? transaksi = snapshot.data;
              print(transaksi?.barang);
              return Scaffold(
                body: Padding(
                  padding:
                  EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      children:[
                        Row(
                          children:[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Id Transaksi"),
                                Text("Tanggal Transaksi"),
                                Text("Total Transaksi")
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[
                                  Text(
                                      transaksi!.id.toString()??""
                                  ),
                                  Text(
                                      transaksi!.waktu.toString()??""
                                  ),
                                  Text(
                                      transaksi!.totalTransaksi.toString()??""
                                  )
                                ]
                            )
                          ]
                        ),

                        BarangList(
                        barangList: transaksi!.barang??[],)
                      ]
                    )
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
  final List<DetailTransaksi> barangList;
  const BarangList({Key? key, this.barangList=const []}) : super(key: key);
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

  Widget _buildPlayerModelList(DetailTransaksi items) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        title: Text(
          items.transaksi_detail.namaBarang,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        collapsedTextColor: Colors.black,
        textColor: Colors.black,
        subtitle: Text("Id Barang " + items.transaksi_detail.id.toString()),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Nama Barang"),
                        Text("Harga Barang"),
                        Text("Jumlah"),
                        Text("Total Harga")
                      ]
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(items.transaksi_detail.namaBarang),
                      Text(items.transaksi_detail.hargaBarang.toString()),
                      Text(items.jumlah.toString()),
                      Text((items.jumlah*items.transaksi_detail.hargaBarang).toString())
                    ],
                  )
                ]),

              ]))
        ],
      ),
    );
  }
}
