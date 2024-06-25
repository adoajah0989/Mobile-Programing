import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:firebase_core/firebase_core.dart';

class Layanan {
  String kodeLayanan;
  String layanan;

  Layanan({
    required this.kodeLayanan,
    required this.layanan,
  });

  factory Layanan.fromJson(String json) => Layanan(
        kodeLayanan: jsonDecode(json)['kodeLayanan'] as String,
        layanan: jsonDecode(json)['layanan'] as String,
      );

  factory Layanan.fromMap(Map<String, dynamic> map) => Layanan(
        kodeLayanan: map['kodeLayanan'] as String,
        layanan: map['layanan'] as String,
      );

  Map<String, dynamic> toMap() => {
        'kodeLayanan': kodeLayanan,
        'layanan': layanan,
      };

  String toJson() => jsonEncode(toMap());
}

class DataJenisPage extends StatefulWidget {
  @override
  _DataJenisPageState createState() => _DataJenisPageState();
}

class _DataJenisPageState extends State<DataJenisPage> {
  List<Layanan> layananList = [];
  final TextEditingController _layananController = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  String? _selectedKodeLayanan;

  Future<void> _loadData() async {
    final snapshot = await db.collection('layanan').get();
    setState(() {
      layananList =
          snapshot.docs.map((doc) => Layanan.fromMap(doc.data())).toList();
    });
  }

  Future<void> _saveData(Layanan layanan) async {
    await db.collection('layanan').add(layanan.toMap());
  }

  Future<void> _deleteData(String kodeLayanan) async {
    final snapshot = await db
        .collection('layanan')
        .where('kodeLayanan', isEqualTo: kodeLayanan)
        .get();
    for (var doc in snapshot.docs) {
      await db.collection('layanan').doc(doc.id).delete();
    }
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      icon: const Icon(Icons.check),
      primaryColor: Colors.green,
      backgroundColor: Colors.white,
      context: context,
      title: const Text('Data telah dihapus'),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  void addLayanan() {
    final String layanan = _layananController.text;

    if (_selectedKodeLayanan == null || layanan.isEmpty) {
      showToast('Kode layanan dan nama layanan tidak boleh kosong');
      return;
    }

    final newLayanan = Layanan(
      kodeLayanan: _selectedKodeLayanan!,
      layanan: layanan,
    );

    setState(() {
      layananList.add(newLayanan);
    });

    _layananController.clear();
    _saveData(newLayanan);
  }

  void showToast(String message) {
    toastification.show(
      alignment: Alignment.bottomCenter,
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      icon: const Icon(Icons.cancel),
      context: context,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 3),
      showProgressBar: false,
      dragToClose: true,
    );
  }

  void onChangedFunction(value) {
    setState(() {
      if (value != null) {
        _selectedKodeLayanan = value;
      } else {
        showToast('Nilai tidak boleh kosong');
      }
    });
  }

  void deleteLayanan(int index) {
    final layanan = layananList[index];
    setState(() {
      layananList.removeAt(index);
    });
    _deleteData(layanan.kodeLayanan);
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
              itemCount: layananList.length,
              itemBuilder: (context, index) {
                final layanan = layananList[index];
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Kode Layanan: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          TextSpan(
                            text: layanan.kodeLayanan,
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text('Nama Layanan: ${layanan.layanan}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Hapus Data'),
                              content: Text(
                                'Apakah Anda yakin ingin menghapus data ini?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    deleteLayanan(index);
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
                      value: _selectedKodeLayanan,
                      items: ["A001", "A002", "A003"]
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
                      decoration: InputDecoration(labelText: 'Kode Layanan'),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _layananController,
                      decoration: InputDecoration(
                        labelText: 'Nama Layanan',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      addLayanan();
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: DataJenisPage(),
  ));
}
