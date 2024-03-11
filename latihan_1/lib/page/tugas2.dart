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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Tugas 2',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'kamu menekan tombol $counter x',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: Text('Tambah'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('contoh text :'),
                const Text(
                  'Ini TEXT',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('contoh Gambar :'),
                Image.asset('assets/wallpaper.jpg'),
                SizedBox(
                  height: 20,
                ),
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
                            Text('Alamr',style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.phone, color: Colors.white),
                            Text('Phone',style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.book, color: Colors.white),
                            Text('Book',style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
