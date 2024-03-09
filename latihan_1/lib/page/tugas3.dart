import 'dart:html';

import 'package:flutter/material.dart';

class tugas3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('halaman 1'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0), child: Text('data'))
        ],
      )),
    );
  }
}
