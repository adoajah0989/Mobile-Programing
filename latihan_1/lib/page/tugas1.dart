import 'dart:html';

import 'package:flutter/material.dart';

class tugas1 extends StatelessWidget {
  List<String> namaAnggotaKelompok = [
    'Nurmansyah',
    'Gilang',
    'Teguh',
    'Tegar',
    'Sofwan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Tugas 01',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Card(
                  margin: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          Text('Nama Anggota kelompok :',
                              style: TextStyle(
                                fontSize: 30,
                              )),
                        ],
                      ))),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < namaAnggotaKelompok.length; i++)
                      Card(
                        elevation: 3,
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading:
                              Icon(Icons.person), // Logo person di sisi kiri
                          title: Text(
                            namaAnggotaKelompok[i],
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
