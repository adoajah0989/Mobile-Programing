import 'dart:html';

import 'package:flutter/material.dart';
import 'package:latihan_1/components/daftarTugas.dart';

class tugasPage extends StatelessWidget {
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Fungsi untuk kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          'Daftar tugas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: daftar_tugas(),
      ),
    );
  }
}
