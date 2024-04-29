import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customer {
  String kodePelanggan;
  String namaPelanggan;
  String NPWP;
  String alamat;

  Customer({
    required this.kodePelanggan,
    required this.namaPelanggan,
    required this.NPWP,
    required this.alamat,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        kodePelanggan: json['kodePelanggan'] as String,
        namaPelanggan: json['namaPelanggan'] as String,
        NPWP: json['NPWP'] as String,
        alamat: json['alamat'] as String,
      );

  Map<String, dynamic> toJson() => {
        'kodePelanggan': kodePelanggan,
        'namaPelanggan': namaPelanggan,
        'NPWP': NPWP,
        'alamat': alamat,
      };
}

class DataPelanggan extends StatefulWidget {
  @override
  _DataPelangganState createState() => _DataPelangganState();
}

class _DataPelangganState extends State<DataPelanggan> {
  List<Customer> customers = [];
  final TextEditingController _namaPelangganController =
      TextEditingController();
  final TextEditingController _NPWPController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  String? _selectedKodePelanggan;

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
    final String namaPelanggan = _namaPelangganController.text;
    final String NPWP = _NPWPController.text;
    final String alamat = _alamatController.text;

    if (_selectedKodePelanggan == null ||
        namaPelanggan.isEmpty ||
        NPWP.isEmpty ||
        alamat.isEmpty) {
      showToast('Semua field harus diisi');
      return;
    }

    final newCustomer = Customer(
      kodePelanggan: _selectedKodePelanggan!,
      namaPelanggan: namaPelanggan,
      NPWP: NPWP,
      alamat: alamat,
    );

    setState(() {
      customers.add(newCustomer);
    });

    _namaPelangganController.clear();
    _NPWPController.clear();
    _alamatController.clear();
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
        _selectedKodePelanggan = value;
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
        title: Text('Data Pelanggan'),
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
                            text: 'Kode Pelanggan: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          TextSpan(
                            text: customer.kodePelanggan,
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama Pelanggan: ${customer.namaPelanggan}'),
                        Text('Telp/Fax: ${customer.NPWP}'),
                        Text('Alamat: ${customer.alamat}'),
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
                                'Apakah Anda yakin ingin menghapus data ini?',
                              ),
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
                      value: _selectedKodePelanggan,
                      items: ["P001", "P002", "P003"]
                          .map(
                            (kode) => DropdownMenuItem<String>(
                              value: kode,
                              child: Text(kode),
                            ),
                          )
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
                      controller: _namaPelangganController,
                      decoration: InputDecoration(
                        labelText: 'Nama Pelanggan',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _NPWPController,
                      decoration: InputDecoration(
                        labelText: 'Telp/Fax',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _alamatController,
                      decoration: InputDecoration(
                        labelText: 'Alamat',
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
    home: DataPelanggan(),
  ));
}
