import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './list_page.dart';
import 'package:latihan_1/components/item.dart';

class tugas3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MODUL 3'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('contoh Expanded :'),
              Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.amber,
                    height: 100,
                    child: const Center(
                      child: Text(
                        'Kotak 1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                
                Container(
                  color: Colors.blue,
                  height: 100,
                  width: 100,
                  child: const Center(
                    child: Text(
                      'Kotak 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    child: const Center(
                      child: Text(
                        'Kotak 3',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
              SizedBox(height: 10,),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'Flutter widget : Penggunaan ListView Class',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'dan ini adalah contoh text dibawahnya',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )),
                        SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(15),
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Klik tombol untuk melihat :'),
                            SizedBox(height: 5,),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.blue)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ListPage(),
                                    ),
                                  );
                                },
                                child: Text('Contoh list View Builder')),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
