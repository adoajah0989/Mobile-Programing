import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Tugas7());
}

class Tugas7 extends StatefulWidget {
  const Tugas7({Key? key}) : super(key: key);

  @override
  _Tugas7State createState() => _Tugas7State();
}

class Speciality {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Speciality({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Speciality.fromJson(Map<String, dynamic> json) => Speciality(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );
}

class ApiService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/todos/";

  Future<List<Speciality>> fetchSpecialities(int counter) async {
    List<Speciality> specialities = [];
    for (int i = 1; i <= counter; i++) {
      final response = await http.get(Uri.parse('$baseUrl$i'));
      if (response.statusCode == 200) {
        specialities.add(Speciality.fromJson(json.decode(response.body)));
      } else {
        throw Exception('Failed to load speciality');
      }
    }
    return specialities;
  }
}

class _Tugas7State extends State<Tugas7> {
  int counter = 1;
  late Future<List<Speciality>> futureSpecialities;

  @override
  void initState() {
    super.initState();
    futureSpecialities = ApiService().fetchSpecialities(counter);
  }

  void _incrementCounter() {
    setState(() {
      counter++;
      futureSpecialities = ApiService().fetchSpecialities(counter);
    });
  }

  void _decrementCounter() {
    if (counter > 1) {
      setState(() {
        counter--;
        futureSpecialities = ApiService().fetchSpecialities(counter);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cara kerja json",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(11, 56, 102, 1),
                    Color.fromRGBO(149, 249, 195, 1),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(60, 0, 0, 0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Json api bekerja dengan menarik data yang berada pada server json yang akan ditampilkan di dalam halaman",
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 16.0,
                          shadows: [
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 5.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Speciality>>(
                future: futureSpecialities,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data available'));
                  } else {
                    final specialities = snapshot.data!;
                    return ListView.builder(
                      itemCount: specialities.length,
                      itemBuilder: (context, index) {
                        final speciality = specialities[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 4.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0,
                            ),
                            color: Color.fromARGB(255, 0, 51, 66),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Title: ${speciality.title}',
                                        softWrap: true,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Completed: ${speciality.completed ? "Yes" : "No"}',
                                        style: TextStyle(
                                          color: speciality.completed
                                              ? Colors.green
                                              : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Color.fromARGB(255, 66, 0, 0),
                                    thickness: 1.0,
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text('User ID: ${speciality.userId}'),
                                  const SizedBox(height: 5.0),
                                  Text('ID: ${speciality.id}'),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Kurangi', // Keterangan tombol
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Tambah', // Keterangan tombol
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
