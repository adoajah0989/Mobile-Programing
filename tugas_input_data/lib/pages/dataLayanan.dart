import 'dart:convert'; // Tambahkan baris ini untuk mengimpor dart:convert

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Task {
  String kodeLayanan;
  String Layanan;

  Task({
    required this.kodeLayanan,
    required this.Layanan,
  });

  factory Task.fromJson(String json) => Task(
        kodeLayanan: jsonDecode(json)['kodeLayanan'] as String,
        Layanan: jsonDecode(json)['Layanan'] as String,
      );

  String toJson() => jsonEncode({
        'kodeLayanan': kodeLayanan,
        'Layanan': Layanan,
      });
}

class DataJenisPage extends StatefulWidget {
  @override
  _DataJenisPageState createState() => _DataJenisPageState();
}

class _DataJenisPageState extends State<DataJenisPage> {
  List<Task> tasks = [];
  final TextEditingController _LayananController = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  String? _selectedKodeLayanan;

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = prefs.getStringList('tasks');
    if (encodedData != null) {
      setState(() {
        tasks = encodedData.map((data) => Task.fromJson(data)).toList();
      });
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = tasks.map((task) => task.toJson()).toList();
    prefs.setStringList('tasks', encodedData);
  }

  void addTask() {
    final String Layanan = _LayananController.text;

    if (_selectedKodeLayanan == null || Layanan.isEmpty) {
      showToast('Kode layanan dan nama layanan tidak boleh kosong');
      return;
    }

    final newTask = Task(
      kodeLayanan: _selectedKodeLayanan!,
      Layanan: Layanan,
    );

    setState(() {
      tasks.add(newTask);
    });

    _LayananController.clear();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
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

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
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
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.white, // Ganti dengan warna yang sesuai
                          fontSize: 16, // Ganti dengan ukuran font yang sesuai
                        ),
                        children: [
                          const TextSpan(
                            text: 'Kode Layanan: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              // Ganti dengan gaya font yang sesuai
                            ),
                          ),
                          TextSpan(
                            text: task.kodeLayanan,
                            style: const TextStyle(
                                // Gaya font untuk kode layanan bisa berbeda di sini
                                ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text('Nama Layanan: ${task.Layanan}'),
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
                                    _saveData(); // Simpan perubahan setelah menghapus data
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
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       title: Text('Tambah Data'),
          //       content: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           DropdownButtonFormField<String>(
          //             value: _selectedKodeLayanan,
          //             items: ["A001", "A002", "A003"]
          //                 .map((kode) => DropdownMenuItem<String>(
          //                       value: kode,
          //                       child: Text(kode),
          //                     ))
          //                 .toList(),
          //             onChanged: (value) {
          //               setState(() {
          //                 onChangedFunction(value);
          //               });
          //             },
          //             decoration: InputDecoration(labelText: 'Kode Layanan'),
          //           ),
          //           SizedBox(height: 10),
          //           TextFormField(
          //             controller: _LayananController,
          //             decoration: InputDecoration(
          //               labelText: 'Nama Layanan',
          //             ),
          //           ),
          //         ],
          //       ),
          //       actions: [
          //         TextButton(
          //           onPressed: () {
          //             addTask();
          //             Navigator.pop(context);
          //             _saveData(); // Simpan perubahan setelah menambahkan data
          //           },
          //           child: Text('Tambah'),
          //         ),
          //         TextButton(
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //           child: Text(
          //             'Batal',
          //             style: TextStyle(color: Colors.red[400]),
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // );
          // Create a new user with a first and last name
          final user = <String, dynamic>{
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
          };

// Add a new document with a generated ID
          db.collection("users").add(user).then((DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DataJenisPage(),
  ));
}
