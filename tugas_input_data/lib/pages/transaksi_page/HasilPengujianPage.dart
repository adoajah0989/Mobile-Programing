import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'dart:math'; // For generating random unique IDs

class HasilPengujianPage extends StatefulWidget {
  @override
  _HasilPengujianPageState createState() => _HasilPengujianPageState();
}

class _HasilPengujianPageState extends State<HasilPengujianPage> {
  final _formKey = GlobalKey<FormState>();
  final _hasilUjiRef = FirebaseFirestore.instance.collection('hasil_uji');

  // Input field controllers
  final _kodeHasilUjiController = TextEditingController();
  final _namaPelangganController = TextEditingController();
  final _diterimaTanggalController = TextEditingController();
  // Add other controllers as needed...

  @override
  void initState() {
    super.initState();
    _generateKodeHasilUji();
  }

  void _generateKodeHasilUji() {
    final uniqueId =
        'H' + (1000000000 + Random().nextInt(999999999)).toString();
    setState(() {
      _kodeHasilUjiController.text = uniqueId;
    });
  }

  void _saveHasilUjiData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final hasilUjiData = {
      'kodeHasilUji': _kodeHasilUjiController.text,
      'namaPelanggan': _namaPelangganController.text,
      'diterimaTanggal': _diterimaTanggalController.text,
      // Add other data fields as needed...
    };

    await _hasilUjiRef.add(hasilUjiData);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Data hasil uji berhasil disimpan'),
    ));
    _resetForm(); // Clear the form after saving
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _generateKodeHasilUji(); // Generate new Kode Hasil Uji
    setState(() {
      _namaPelangganController.text = '';
      _diterimaTanggalController.text = '';
      // Reset other controllers as needed...
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Pengujian'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodeHasilUjiController,
                readOnly: true,
                decoration: InputDecoration(labelText: 'Kode Hasil Uji'),
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
                readOnly: true,
                controller: _diterimaTanggalController,
                decoration: InputDecoration(
                  labelText: 'Tanggal diterima',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2025),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _diterimaTanggalController.text =
                              DateFormat('dd MMMM yyyy').format(pickedDate);
                        });
                      }
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal diterima tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _saveHasilUjiData,
                child: Text('Simpan Hasil Uji'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
