import 'package:flutter/material.dart';

import 'package:tugas_input_data/pages/KategoriLayanan.dart';
import 'package:tugas_input_data/pages/dataLayanan.dart';
import 'package:tugas_input_data/pages/dataProyek.dart';
import 'package:tugas_input_data/pages/datapelanggan.dart';

class MenuMaster extends StatelessWidget {
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
                leading: Icon(Icons.person, color: Colors.teal[700]),
                title: Text('data jenis layanan'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataJenisPage(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.note_add_outlined, color: Colors.teal[700]),
                title: Text('data proyek'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataProyek(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.people, color: Colors.teal[700]),
                title: Text('kategori layanan'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KategoriLayanan(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.verified_rounded, color: Colors.teal[700]),
                title: Text('Data pelanggan'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPelanggan(),
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
