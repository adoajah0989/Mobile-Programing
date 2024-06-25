import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'dart:math'; // For generating random unique IDs

class DataTerimaHasilTestPage extends StatefulWidget {
  @override
  _DataTerimaHasilTestPageState createState() =>
      _DataTerimaHasilTestPageState();
}

class _DataTerimaHasilTestPageState extends State<DataTerimaHasilTestPage> {
  final _formKey = GlobalKey<FormState>();
  final _terimaHasilRef = FirebaseFirestore.instance.collection('hasil_test');

  // Input field controllers
  final _kodeTandaTerimaController = TextEditingController();
  final _kodeTransaksiController = TextEditingController();
  final _tanggalTerimaController = TextEditingController();
  final _namaPelangganController = TextEditingController();
  final _namaProyekController = TextEditingController();
  final _namaPenerimaController = TextEditingController();
  final _namaPenyerahController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateKodeTandaTerima();
    _generateKodeTransaksi();
  }

  void _generateKodeTandaTerima() {
    setState(() {
      _kodeTandaTerimaController.text = 'H00000001';
    });
  }

  void _generateKodeTransaksi() {
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMMM yyyy').format(now);
    setState(() {
      _kodeTransaksiController.text = '58/IIIA/ABS/I/$formattedDate';
      _tanggalTerimaController.text = formattedDate;
    });
  }

  void _saveDataTerimaHasil() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final dataTerimaHasil = {
      'kodeTandaTerima': _kodeTandaTerimaController.text,
      'kodeTransaksi': _kodeTransaksiController.text,
      'tanggalTerima': _tanggalTerimaController.text,
      'namaPelanggan': _namaPelangganController.text,
      'namaProyek': _namaProyekController.text,
      'namaPenerima': _namaPenerimaController.text,
      'namaPenyerah': _namaPenyerahController.text,
    };

    await _terimaHasilRef.add(dataTerimaHasil);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Data terima hasil berhasil disimpan'),
    ));
    _resetForm(); // Clear the form after saving
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _generateKodeTandaTerima(); // Generate new Kode Tanda Terima
    _generateKodeTransaksi(); // Generate new Kode Transaksi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Terima Hasil Test'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodeTandaTerimaController,
                readOnly: true,
                decoration: InputDecoration(labelText: 'Kode Tanda Terima'),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _kodeTransaksiController,
                readOnly: true,
                decoration: InputDecoration(labelText: 'Kode Transaksi'),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _tanggalTerimaController,
                readOnly: true,
                decoration:
                    InputDecoration(labelText: 'Tanggal Diterima Dokumen'),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _namaPelangganController,
                decoration: InputDecoration(labelText: 'Nama Pelanggan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama pelanggan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _namaProyekController,
                decoration: InputDecoration(labelText: 'Nama Proyek'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama proyek tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _namaPenerimaController,
                decoration: InputDecoration(labelText: 'Nama Penerima'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama penerima tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _namaPenyerahController,
                decoration: InputDecoration(labelText: 'Nama Penyerah'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama penyerah tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _saveDataTerimaHasil,
                child: Text('Simpan Data Terima Hasil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
