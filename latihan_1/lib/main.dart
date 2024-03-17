import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import './page/tugas1.dart';
import './page/tugas2.dart';
import './page/tugas3.dart';
import './page/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(primary: Color.fromRGBO(34, 34, 34, 1)),
        scaffoldBackgroundColor: Color.fromRGBO(24, 24, 24, 1),
        fontFamily: 'Lato',
        textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.white), // Mengatur warna teks global menjadi putih
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tugas Mobile Programming'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                // Tambahkan logika ketika ikon ditekan di sini
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Text('contoh drawer header'),
            ),
            ListTile(
              title: Text(
                'List Anggota',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tugas1()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(11, 56, 102, 1), // Warna atas
                        Color.fromRGBO(149, 249, 195, 1), // Warna bawah
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(60, 0, 0, 0),
                        blurRadius: 10.0, // ukuran blur
                        spreadRadius: 1.0, // penyebaran bayangan
                        offset: Offset(0, 0), // posisi bayangan (x, y)
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 100,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text('Halo, selamat datang!',style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    )
                  ],
                )
              ),
              SizedBox(height: 60,),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(11, 56, 102, 1), // Warna atas
                      Color.fromRGBO(149, 249, 195, 1), // Warna bawah
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(60, 0, 0, 0),
                      blurRadius: 10.0, // ukuran blur
                      spreadRadius: 1.0, // penyebaran bayangan
                      offset: Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                height: 200,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              //
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the desired border radius
                              ),
                              padding: EdgeInsets.all(20),
                              backgroundColor:
                                  Color.fromARGB(255, 177, 252, 229),
                            ),
                            child: const Text(
                              '🧭',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Color.fromRGBO(11, 56, 102, 1)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Tugas',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle button 1 click
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the desired border radius
                              ),
                              padding: EdgeInsets.all(20),
                              backgroundColor:
                                  Color.fromARGB(255, 177, 252, 229),
                            ),
                            child: const Text(
                              '📰',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Color.fromRGBO(11, 56, 102, 1)),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'News',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Handle button 1 click
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the desired border radius
                              ),
                              padding: EdgeInsets.all(20),
                              backgroundColor:
                                  Color.fromARGB(255, 177, 252, 229),
                            ),
                            child: const Text(
                              '🙋🏾‍♂️',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Color.fromRGBO(11, 56, 102, 1)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Profile',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ]),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(11, 56, 102, 1), // Warna atas
                        Color.fromRGBO(149, 249, 195, 1), // Warna bawah
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(60, 0, 0, 0),
                        blurRadius: 10.0, // ukuran blur
                        spreadRadius: 1.0, // penyebaran bayangan
                        offset: Offset(0, 0), // posisi bayangan (x, y)
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(children: <Widget>[
                        Text(
                          'Daftar Tugas',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 246, 255, 251)),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => tugas1()),
                              );
                            },
                            child: const Text(
                              'modul 01',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 249, 255, 255)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Tugas2()),
                              );
                            },
                            child: const Text(
                              'modul 02',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 249, 255, 255)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => tugas3()),
                              );
                            },
                            child: const Text(
                              'modul 03',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 249, 255, 255)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
