import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:latihan_1/page/tugas5.dart';
import '../page/tugas1.dart';
import '../page/tugas2.dart';
import '../page/tugas3.dart';
import '../page/list_page.dart';

class daftar_tugas extends StatelessWidget {
  const daftar_tugas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => tugas1()),
                          );
                        },
                        child: const Text(
                          'modul 01',
                          style:
                              TextStyle(color: Color.fromARGB(255, 249, 255, 255)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Tugas2()),
                          );
                        },
                        child: const Text(
                          'modul 02',
                          style:
                              TextStyle(color: Color.fromARGB(255, 249, 255, 255)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => tugas3()),
                          );
                        },
                        child: const Text(
                          'modul 03',
                          style:
                              TextStyle(color: Color.fromARGB(255, 249, 255, 255)),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => tugas1()),
                        );
                      },
                      child: const Text(
                        'modul 04',
                        style:
                            TextStyle(color: Color.fromARGB(255, 249, 255, 255)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tugas5()),
                        );
                      },
                      child: const Text(
                        'modul 05',
                        style:
                            TextStyle(color: Color.fromARGB(255, 249, 255, 255)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => tugas3()),
                        );
                      },
                      child: const Text(
                        'modul 06',
                        style:
                            TextStyle(color: Color.fromARGB(255, 249, 255, 255)),
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
