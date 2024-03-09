import 'dart:html';

import 'package:flutter/material.dart';

class tugas1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('halaman tugas 01'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0), child: Text('test halaman'))
        ],
      )),
    );
  }
}
