import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Task {
  String kodeLayanan;
  String namaLayanan;

  Task({
    required this.kodeLayanan,
    required this.namaLayanan,
  });
}

class DataJenisPage extends StatefulWidget {
  @override
  _DataJenisPageState createState() => _DataJenisPageState();
}

class _DataJenisPageState extends State<DataJenisPage> {
  List<Task> tasks = [];
  final TextEditingController _namaLayananController = TextEditingController();
  String? _selectedKodeLayanan;

  void addTask() {
    final String namaLayanan = _namaLayananController.text;

    if (_selectedKodeLayanan == null || namaLayanan.isEmpty) {
      showToast('Kode layanan dan nama layanan tidak boleh kosong');
      return;
    }

    final newTask = Task(
      kodeLayanan: _selectedKodeLayanan!,
      namaLayanan: namaLayanan,
    );

    setState(() {
      tasks.add(newTask);
    });

    // Clear text field after adding task
    _namaLayananController.clear();
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
        // Jika value null, tampilkan notifikasi
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Jenis Layanan'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
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
                        fontWeight: FontWeight.w200
                            // Ganti dengan gaya font yang sesuai
                        // Apa pun gaya tambahan yang kamu inginkan untuk teks "Kode Layanan:"
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
              subtitle: Text('Nama Layanan: ${task.namaLayanan}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete Task'),
                        content:
                            Text('apa kamu yakin ingin menghapus data ini?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              deleteTask(index);
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.red[300],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Task'),
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
                      controller: _namaLayananController,
                      decoration: InputDecoration(
                        labelText: 'Nama Layanan',
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
                    child: Text('Add'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
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
    home: DataJenisPage(),
  ));
}
