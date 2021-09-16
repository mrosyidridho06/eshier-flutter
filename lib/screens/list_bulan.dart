import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/bulan.dart';

class ListBulanScreen extends StatefulWidget {
  const ListBulanScreen({Key? key}) : super(key: key);

  @override
  _ListBulanScreenState createState() => _ListBulanScreenState();
}

class _ListBulanScreenState extends State<ListBulanScreen> {
  var halaman = 1;
  var maxHalaman = 1;
  @override
  Widget build(BuildContext context) {
    var bulanService = BulanService();
    var generateAduan = [];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("List Bulan"),
      ),
      body: FutureBuilder<List<dynamic>>(
          future: bulanService.fetchBulanList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              generateAduan = generateItems(snapshot.data ?? <dynamic>[]);
              maxHalaman = (generateAduan.length / 10).ceil();
              return Scaffold(
                body: Padding(
                  padding:
                      EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 25),
                  child: SingleChildScrollView(
                    child: BulanList(
                        aduanList: generateAduan.sublist(
                            (halaman - 1) * 10,
                            halaman * 10 > generateAduan.length
                                ? generateAduan.length
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

class Item {
  int id_aduan;
  String perihal;
  String perusahaan;
  bool isExpanded;
  String nama_departemen;
  String nama_unit;
  int level;
  String status;
  bool merah;
  Item(
      {required this.id_aduan,
      required this.perihal,
      required this.perusahaan,
      this.isExpanded = false,
      required this.nama_departemen,
      required this.nama_unit,
      required this.level,
      required this.status,
      this.merah = false});
}

List<Item> generateItems(List<dynamic> listAduan) {
  var hasil = <Item>[];
  listAduan.forEach((element) {
    hasil.add(Item(
        id_aduan: int.parse(element['id_aduan']),
        perihal: element['perihal'] ?? "",
        perusahaan: element["nama_perusahaan"] ?? "",
        nama_departemen: element['nama_departemen'] ?? "",
        nama_unit: element['nama_unit'] ?? "",
        status: element['status'] ?? "",
        level: int.parse(element['level']),
        merah: element['merah'] == null ? false : true));
  });
  return hasil;
}

class BulanList extends StatefulWidget {
  final List<dynamic> aduanList;
  const BulanList({Key? key, required this.aduanList}) : super(key: key);
  @override
  _BulanListState createState() => _BulanListState();
}

class _BulanListState extends State<BulanList> {
  @override
  Widget build(BuildContext context) {
    var data = widget.aduanList;
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
          items.perihal,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        collapsedTextColor: Colors.black,
        textColor: Colors.black,
        subtitle: Text("Id aduan " + items.id_aduan.toString()),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Status"), Text("Nama Perusahaan")]),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text(items.status), Text(items.perusahaan)],
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
