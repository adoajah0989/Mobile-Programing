import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customer {
  String pelangganProyek;
  String Pelanggan;
  String telpFax;
  String email;

  Customer({
    required this.pelangganProyek,
    required this.Pelanggan,
    required this.telpFax,
    required this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        pelangganProyek: json['pelangganProyek'] as String,
        Pelanggan: json['Pelanggan'] as String,
        telpFax: json['telpFax'] as String,
        email: json['email'] as String,
      );

  Map<String, dynamic> toJson() => {
        'pelangganProyek': pelangganProyek,
        'Pelanggan': Pelanggan,
        'telpFax': telpFax,
        'email': email,
      };
}

class DataProyek extends StatefulWidget {
  @override
  _DataProyekState createState() => _DataProyekState();
}

class _DataProyekState extends State<DataProyek> {
  List<Customer> customers = [];
  final TextEditingController _PelangganController = TextEditingController();
  final TextEditingController _telpFaxController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _selectedpelangganProyek;

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = prefs.getStringList('customers');
    if (encodedData != null) {
      setState(() {
        customers = encodedData
            .map((data) => Customer.fromJson(jsonDecode(data)))
            .toList();
      });
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData =
        customers.map((customer) => jsonEncode(customer.toJson())).toList();
    prefs.setStringList('customers', encodedData);
  }

  void addCustomer() {
    final String Pelanggan = _PelangganController.text;
    final String telpFax = _telpFaxController.text;
    final String email = _emailController.text;

    if (_selectedpelangganProyek == null ||
        Pelanggan.isEmpty ||
        telpFax.isEmpty ||
        email.isEmpty) {
      showToast('Semua field harus diisi');
      return;
    }

    final newCustomer = Customer(
      pelangganProyek: _selectedpelangganProyek!,
      Pelanggan: Pelanggan,
      telpFax: telpFax,
      email: email,
    );

    setState(() {
      customers.add(newCustomer);
    });

    _PelangganController.clear();
    _telpFaxController.clear();
    _emailController.clear();
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
        _selectedpelangganProyek = value;
      } else {
        showToast('Nilai tidak boleh kosong');
      }
    });
  }

  void deleteCustomer(int index) {
    setState(() {
      customers.removeAt(index);
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
        title: Text('Data Proyek'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer = customers[index];
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
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Kode Pelanggan: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          TextSpan(
                            text: customer.pelangganProyek,
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama Pelanggan: ${customer.Pelanggan}'),
                        Text('Telp/Fax: ${customer.telpFax}'),
                        Text('Email: ${customer.email}'),
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
                                    deleteCustomer(index);
                                    _saveData();
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
                      value: _selectedpelangganProyek,
                      items: ["P001", "P002", "P003"]
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
                      decoration: InputDecoration(labelText: 'Kode Pelanggan'),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _PelangganController,
                      decoration: InputDecoration(
                        labelText: 'Nama Pelanggan',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _telpFaxController,
                      decoration: InputDecoration(
                        labelText: 'Telp/Fax',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      addCustomer();
                      Navigator.pop(context);
                      _saveData();
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
    home: DataProyek(),
  ));
}
