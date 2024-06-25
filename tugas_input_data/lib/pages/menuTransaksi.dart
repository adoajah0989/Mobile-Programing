import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugas_input_data/pages/transaksi_page/DataKuitansiPage.dart';
import 'package:tugas_input_data/pages/transaksi_page/DataTerimaHasilTestPage.dart';
import 'package:tugas_input_data/pages/transaksi_page/DataTransaksiPengujianPage.dart';
import 'package:tugas_input_data/pages/transaksi_page/HasilPengujianPage.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu Utama',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.archive, color: Colors.teal[700]),
                title: Text('Data Transaksi Pengujian'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataTransaksiPengujianPage(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.done, color: Colors.teal[700]),
                title: Text('Hasil Pengujian'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HasilPengujianPage(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.receipt, color: Colors.teal[700]),
                title: Text('Data Kuitansi'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataKuitansiPage(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.verified, color: Colors.teal[700]),
                title: Text('Data Terima Hasil Test'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataTerimaHasilTestPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
