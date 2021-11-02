import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/daftar.dart';

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Welcome> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

void _showtoas () {
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text('WELCOME TO',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: Text('ESHIER',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 50),
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Container(
                        width: 250.0,
                        height: 200.0,
                        decoration: new BoxDecoration(
                            // shape: BoxShape.box,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage("assets/logo.jpeg")
                            )
                        )),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text('Aplikasi untuk menghimpun atau menghitung transaksi penjualan dengna memanfaatkan teknologi informasi sehingga proses penjualan menjadi lebih cepat dan akurat',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                
                Container(
                    height: 65,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Sign In'),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                    )),
                Container(
                    height: 65,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.black,
                      child: Text('Sign Up'),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return DaftarScreen();
                        }));
                      },
                    )),
              ],
            )));
  }
}
