import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latihan_1/components/item.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List _post = [
    'post 1',
    'post 2',
    'post 3',
    'post 4',
    'post 5',
  ];

  int _jumlah = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text(
          'contoh listView Builder',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(11, 56, 102, 1), // Warna atas
                      Color.fromRGBO(149, 249, 195, 1), // Warna bawah
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: const Text(
                'Ini adalah contoh dari listView.builder, component akan muncul jika anda menekan tombol yang ada di bawah halaman',
                style: TextStyle(fontSize: 18.0, shadows: [
                  Shadow(
                    color: Color.fromARGB(117, 0, 0, 0),
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    
                  )
                ]),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _jumlah,
              itemBuilder: (context, index) {
                return Item(
                  child: _post[index],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.cyan,
            onPressed: () {
              setState(() {
                if (_jumlah < 5) {
                  _jumlah++;
                }
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10), // Jarak antara dua FloatingActionButton
          FloatingActionButton(
            backgroundColor: Colors.cyan,
            onPressed: () {
              setState(() {
                if (_jumlah > 0) {
                  _jumlah--;
                }
              });
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
