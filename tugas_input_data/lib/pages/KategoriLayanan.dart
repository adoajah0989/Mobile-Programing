import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String kodeKategori;
  String namaLayanan;
  String referensi;
  String ukuran;
  int harga;

  Task({
    required this.kodeKategori,
    required this.namaLayanan,
    required this.referensi,
    required this.ukuran,
    required this.harga,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        kodeKategori: json['kodeKategori'] as String,
        namaLayanan: json['namaLayanan'] as String,
        referensi: json['referensi'] as String,
        ukuran: json['ukuran'] as String,
        harga: json['harga'] as int,
      );

  Map<String, dynamic> toJson() => {
        'kodeKategori': kodeKategori,
        'namaLayanan': namaLayanan,
        'referensi': referensi,
        'ukuran': ukuran,
        'harga': harga,
      };

  factory Task.fromMap(Map<String, dynamic> map) => Task(
        kodeKategori: map['kodeKategori'] as String,
        namaLayanan: map['namaLayanan'] as String,
        referensi: map['referensi'] as String,
        ukuran: map['ukuran'] as String,
        harga: map['harga'] as int,
      );

  Map<String, dynamic> toMap() => {
        'kodeKategori': kodeKategori,
        'namaLayanan': namaLayanan,
        'referensi': referensi,
        'ukuran': ukuran,
        'harga': harga,
      };
}

class KategoriLayanan extends StatefulWidget {
  @override
  _KategoriLayananState createState() => _KategoriLayananState();
}

class _KategoriLayananState extends State<KategoriLayanan> {
  List<Task> kategori_layanan = [];
  final TextEditingController _namaLayananController = TextEditingController();
  final TextEditingController _referensiController = TextEditingController();
  final TextEditingController _ukuranController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  String? _selectedKodeKategori;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> _loadData() async {
    final snapshot = await db.collection('kategori_layanan').get();
    setState(() {
      kategori_layanan =
          snapshot.docs.map((doc) => Task.fromMap(doc.data())).toList();
    });
  }

  Future<void> _saveData(Task task) async {
    await db.collection('kategori_layanan').add(task.toMap());
  }

  Future<void> _deleteData(String kodeKategori) async {
    final snapshot = await db
        .collection('kategori_layanan')
        .where('kodeKategori', isEqualTo: kodeKategori)
        .get();
    for (var doc in snapshot.docs) {
      await db.collection('kategori_layanan').doc(doc.id).delete();
    }
  }

  void addTask() {
    final String namaLayanan = _namaLayananController.text;
    final String referensi = _referensiController.text;
    final String ukuran = _ukuranController.text;
    final int harga = int.tryParse(_hargaController.text) ?? 0;

    if (_selectedKodeKategori == null ||
        namaLayanan.isEmpty ||
        referensi.isEmpty ||
        ukuran.isEmpty ||
        harga == 0) {
      showToast('Semua field harus diisi');
      return;
    }

    final newTask = Task(
      kodeKategori: _selectedKodeKategori!,
      namaLayanan: namaLayanan,
      referensi: referensi,
      ukuran: ukuran,
      harga: harga,
    );

    setState(() {
      kategori_layanan.add(newTask);
    });

    _namaLayananController.clear();
    _referensiController.clear();
    _ukuranController.clear();
    _hargaController.clear();

    showToast('Data berhasil ditambahkan');
    _saveData(newTask);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void onChangedFunction(value) {
    setState(() {
      if (value != null) {
        _selectedKodeKategori = value;
      } else {
        showToast('Nilai tidak boleh kosong');
      }
    });
  }

  void deleteTask(int index) {
    final task = kategori_layanan[index];
    setState(() {
      kategori_layanan.removeAt(index);
    });

    showToast('Data berhasil dihapus');
    _deleteData(task.kodeKategori);
  }

  @override
  void initState() {
    super.initState();
    _loadData(); // Load data saat aplikasi dimulai
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Jenis Layanan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: kategori_layanan.length,
              itemBuilder: (context, index) {
                final task = kategori_layanan[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Kode Kategori: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          TextSpan(
                            text: task.kodeKategori,
                          ),
                        ],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama Layanan: ${task.namaLayanan}'),
                        Text('Referensi: ${task.referensi}'),
                        Text('Ukuran: ${task.ukuran}'),
                        Text('Harga: ${task.harga}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Hapus Data'),
                              content: Text(
                                  'Apakah Anda yakin ingin menghapus data ini?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    deleteTask(index);
                                  },
                                  child: Text('Hapus'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Batal'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Tambah Data'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      value: _selectedKodeKategori,
                      items: ["K001", "K002", "K003"]
                          .map((kode) => DropdownMenuItem<String>(
                                value: kode,
                                child: Text(kode),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          onChangedFunction(value);
                        });
                      },
                      decoration:
                          InputDecoration(labelText: 'Kode Kategori Layanan'),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _namaLayananController,
                      decoration: InputDecoration(
                        labelText: 'Nama Layanan',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _referensiController,
                      decoration: InputDecoration(
                        labelText: 'Referensi',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _ukuranController,
                      decoration: InputDecoration(
                        labelText: 'Ukuran',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _hargaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Harga',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      addTask();
                      Navigator.pop(context);
                    },
                    child: Text('Tambah'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Batal',
                      style: TextStyle(color: Colors.red[400]),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: KategoriLayanan(),
  ));
}
