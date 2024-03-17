import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Tugas2(),
  ));
}

class Tugas2 extends StatefulWidget {
  @override
  _Tugas2State createState() => _Tugas2State();
}

class _Tugas2State extends State<Tugas2> {
  int counter = 0;
  TextEditingController _controller = TextEditingController();
  String _nama = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MODUL 2',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(11, 56, 102, 1), // Warna atas
                          Color(0xFF95F9C3), // Warna bawah
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Contoh Body :'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'kamu menekan tombol $counter x',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                counter++;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Atur sesuai kebutuhan
                              ),
                            ),
                            child: const Text(
                              'Tambah',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 249, 255, 255)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(11, 56, 102, 1), // Warna atas
                          Color(0xFF95F9C3), // Warna bawah
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Contoh text :'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'contoh text berwarna kuning',
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 150,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(11, 56, 102, 1), // Warna atas
                          Color(0xFF95F9C3), // Warna bawah
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(

                    children: [
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Contoh Textfield :'),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _controller,
                                    decoration: InputDecoration(
                                        hintText: "Masukan Nama"),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        10), // Jarak antara TextField dan tombol
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _nama = _controller.text;
                                    });
                                  },
                                  child: Text('Simpan',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                            SizedBox(
                                    height:
                                        30),
                            Text('Nama : $_nama',style: TextStyle(fontSize: 20),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      const Text('contoh Gambar :'),
                      Image.asset(
                        'assets/wallpaper.jpg',
                        height: 200,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('contoh Icon :'),
                      Center(
                        child: Container(
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0)), // Disertakan dalam objek BoxDecoration
                          ),
                          padding: EdgeInsets.all(16.0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Icon(Icons.access_alarm, color: Colors.white),
                                  Text(
                                    'Alamr',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Icon(Icons.phone, color: Colors.white),
                                  Text(
                                    'Phone',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Icon(Icons.book, color: Colors.white),
                                  Text(
                                    'Book',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
