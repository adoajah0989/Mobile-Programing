import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'dart:math'; // For generating random unique IDs

class DataTransaksiPengujianPage extends StatefulWidget {
  @override
  _DataTransaksiPengujianPageState createState() =>
      _DataTransaksiPengujianPageState();
}

class _DataTransaksiPengujianPageState
    extends State<DataTransaksiPengujianPage> {
  final _formKey = GlobalKey<FormState>();
  final _transaksiRef =
      FirebaseFirestore.instance.collection('transaksi_pengujian');

  // Input field controllers
  final _kodeTransaksiController = TextEditingController();
  final _namaPelangganController = TextEditingController();
  final _namaProjekController = TextEditingController();
  final _namaPengirimController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _namaLayananController = TextEditingController();
  final _namaKategoriLayananController = TextEditingController();
  final _ukuranController = TextEditingController();
  final _jumlahController = TextEditingController();
  final _catatanController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateKodeTransaksi();
  }

  void _generateKodeTransaksi() {
    final now = DateTime.now();
    final formattedDate = DateFormat('yy/LLL/EEE/M/yyyy').format(now);
    final uniqueId = '01/IIIB/ABS/I/2024'; // Assuming this part is constant
    setState(() {
      _kodeTransaksiController.text = uniqueId;
    });
  }

  void _saveTransaksiData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final transaksiData = {
      'kodeTransaksi': _kodeTransaksiController.text,
      'namaPelanggan': _namaPelangganController.text,
      'namaProjek': _namaProjekController.text,
      'namaPengirim': _namaPengirimController.text,
      'tanggal':
          _tanggalController.text, // Assuming you're storing date as string
      'namaLayanan': _namaLayananController.text,
      'namaKategoriLayanan': _namaKategoriLayananController.text,
      'ukuran': _ukuranController.text,
      'jumlah': int.parse(_jumlahController.text), // Assuming jumlah is integer
      'catatan': _catatanController.text,
    };

    await _transaksiRef.add(transaksiData);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Data transaksi berhasil disimpan'),
    ));
    _resetForm(); // Clear the form after saving
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _generateKodeTransaksi(); // Generate new Kode Transaksi
    setState(() {
      _jumlahController.text = '';
      _catatanController.text = ''; // Clear catatan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Transaksi Pengujian'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodeTransaksiController,
                readOnly: true,
                decoration: InputDecoration(labelText: 'Kode Transaksi'),
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
                controller: _namaProjekController,
                decoration: InputDecoration(labelText: 'Nama Projek'),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _namaPengirimController,
                decoration: InputDecoration(labelText: 'Nama Pengirim'),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                readOnly: true,
                controller: _tanggalController,
                decoration: InputDecoration(
                  labelText: 'Tanggal',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2025),
                      );
                      if (pickedDate != null &&
                          pickedDate != _tanggalController.text) {
                        setState(() {
                          _tanggalController.text =
                              DateFormat('dd MMMM yyyy').format(pickedDate);
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _namaLayananController,
                decoration: InputDecoration(labelText: 'Nama Layanan'),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _namaKategoriLayananController,
                decoration: InputDecoration(labelText: 'Nama Kategori Layanan'),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _ukuranController,
                decoration: InputDecoration(labelText: 'Ukuran'),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _jumlahController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Jumlah'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Jumlah harus berupa angka';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _catatanController,
                decoration: InputDecoration(labelText: 'Catatan'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _saveTransaksiData,
                child: Text('Simpan Data Transaksi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
