import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/route.dart' as route;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
                    // height: 50,
                    // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    // child: RaisedButton(
                    //   textColor: Colors.white,
                    //   color: Colors.blue,
                    //   child: Text('Log out'),
                    //   onPressed: () {
                    //     Navigator.pushReplacement(context,
                    //         MaterialPageRoute(builder: (context) {
                    //       return Welcome();
                    //     }));
                    //   },
                    // )),
              
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.black, size: 50.0),
                  new Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage("assets/ridho.jpg")
                        )
                    )),
                  // Image.asset(
                  //   "assets/ridho.jpg",
                  //   width: 50.0,
                    
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
              "Eshier",
                style: TextStyle(color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
                ),
              textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    SizedBox(
                      width: 160.0,
                      height: 160.0, 
                      child: Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/stock.png",
                                  width: 100.0,
                                ),
                                SizedBox(height: 10.0),
                                Text("Input barang",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/dashboard.png",
                                  width: 100.0,
                                ),
                                SizedBox(height: 10.0),
                                Text("Input Penjualan",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/report.png",
                                  width: 100.0,
                                ),
                                SizedBox(height: 10.0),
                                Text("Laporan",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/chart.png",
                                  width: 100.0,
                                ),
                                SizedBox(height: 10.0),
                                Text("Monitoring",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}
