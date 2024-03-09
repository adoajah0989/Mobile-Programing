import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './page/tugas1.dart';
import './page/tugas2.dart';
import './page/tugas3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 29, 104, 81)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tugas Mobile Programming'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> namaAnggotaKelompok = [
    'Nurmansyah',
    'Gilang',
    'Teguh',
    'Tegar',
    'Sofwan'
  ];
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              elevation: 5,
              child: SizedBox(
                height: 200,
                width: 300,
                child: Image.network(
                  'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=872&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Card.filled(
                margin: EdgeInsets.only(top: 20.0),
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text('Nama Anggota kelompok :',
                            style: TextStyle(fontSize: 30.0)),
                      ],
                    ))),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 16),
                for (var i = 0; i < namaAnggotaKelompok.length; i++)
                  Text(
                    '- ${namaAnggotaKelompok[i]}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                SizedBox(height: 20.0),
              ],
            ),
            Row(children: <Widget>[
              SizedBox(
                width: 15.0,
              ),
              Text('daftar tugas :',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),
            ]),
            Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tugas1()),
                    );
                  },
                  child: Text('tugas modul 01'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tugas2()),
                    );
                  },
                  child: Text('tugas modul 02'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tugas3()),
                    );
                  },
                  child: Text('tugas modul 03'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _counter--;
              });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
