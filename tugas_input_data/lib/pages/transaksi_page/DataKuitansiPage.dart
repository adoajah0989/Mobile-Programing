import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'dart:math'; // For generating random unique IDs

class DataKuitansiPage extends StatefulWidget {
  @override
  _DataKuitansiPageState createState() => _DataKuitansiPageState();
}

class _DataKuitansiPageState extends State<DataKuitansiPage> {
  final _formKey = GlobalKey<FormState>();
  final _kuitansiRef = FirebaseFirestore.instance.collection('kuitansi');

  // Input field controllers
  final _noKuitansiController = TextEditingController();
  final _namaPelangganController = TextEditingController();
  final _totalBiayaController = TextEditingController();
  final _untukPembayaranController = TextEditingController();
  final _caraBayarController = TextEditingController();
  final _jumlahBayarController = TextEditingController();
  final _terbilangController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateKodeTransaksi();
  }

  void _generateKodeTransaksi() {
    final now = DateTime.now();
    final formattedDate = DateFormat('yy/MM/dd').format(now);
    final uniqueId =
        'KW' + (10000 + Random().nextInt(9999)).toString().padLeft(5, '0');
    setState(() {
      _noKuitansiController.text = uniqueId;
    });
  }

  void _saveKuitansiData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final kuitansiData = {
      'noKuitansi': _noKuitansiController.text,
      'kodeTransaksi':
          _noKuitansiController.text, // Kode Transaksi is same as No. Kuitansi
      'namaPelanggan': _namaPelangganController.text,
      'totalBiaya': double.parse(_totalBiayaController.text),
      'untukPembayaran': _untukPembayaranController.text,
      'caraBayar': _caraBayarController.text,
      'jumlahBayar': double.parse(_jumlahBayarController.text),
      'terbilang': _terbilangController
          .text, // Terbilang field is not auto-generated anymore
      'tanggal': DateTime.now(), // Timestamp for sorting/filtering
    };

    await _kuitansiRef.add(kuitansiData);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Data kuitansi berhasil disimpan'),
    ));
    _resetForm(); // Clear the form after saving
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _generateKodeTransaksi(); // Generate new Kode Transaksi
    setState(() {
      _jumlahBayarController.text = '';
      _terbilangController.text = ''; // Clear terbilang amount
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Kuitansi'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _noKuitansiController,
                readOnly: true,
                decoration: InputDecoration(labelText: 'No. Kuitansi'),
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
                controller: _totalBiayaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Total Biaya'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Total biaya tidak boleh kosong';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Total biaya harus berupa angka';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _untukPembayaranController,
                decoration: InputDecoration(labelText: 'Untuk Pembayaran'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Keterangan pembayaran tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              DropdownButtonFormField<String>(
                value: _caraBayarController.text.isEmpty
                    ? null
                    : _caraBayarController.text,
                decoration: InputDecoration(labelText: 'Cara Bayar'),
                items: ['Cash', 'Kredit'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _caraBayarController.text = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Cara bayar tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _jumlahBayarController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Jumlah Bayar'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah bayar tidak boleh kosong';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Jumlah bayar harus berupa angka';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: _terbilangController,
                decoration: InputDecoration(labelText: 'Terbilang'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Terbilang tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _saveKuitansiData,
                child: Text('Simpan Data Kuitansi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
