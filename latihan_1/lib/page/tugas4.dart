import 'dart:html';

import 'package:flutter/material.dart';
import 'package:latihan_1/components/button.dart';
import 'package:latihan_1/components/index.dart';
import 'package:latihan_1/page/tugas3.dart';

class tugas4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MODUL 4',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'ini adalah contoh untuk navigation push',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                Text(
                  "pada penggunaan navigation push, berfungsi untuk berpindah kesuatu halaman",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Button(
                    text_button: 'Navigation push',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Index()),
                      );
                    })
              ],
            ),
          )),
    );
  }
}
