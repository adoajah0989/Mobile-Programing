import 'package:flutter/material.dart';

enum Fruit { apple, banana, orange }

class Tugas5 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Tugas5> {
  Fruit selectedFruit = Fruit.apple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modul 5 "Switch dan case"'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Contoh Switch :'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih Buah Favorit Anda:',
                        style: TextStyle(fontSize: 18),
                      ),
                      DropdownButton<Fruit>(
                        value: selectedFruit,
                        onChanged: (newValue) {
                          setState(() {
                            selectedFruit = newValue!;
                          });
                        },
                        items: Fruit.values.map((fruit) {
                          return DropdownMenuItem<Fruit>(
                            value: fruit,
                            child: Text(fruit.toString().split('.').last),
                          );
                        }).toList(),
                      ),
                      fruitWidget(selectedFruit),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Contoh Loop :'),
                ],
              ),
              Container(
                height: 170,
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
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Daftar buah:',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          for (var fruit in Fruit.values)
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white, // Warna border putih
                                  width: 2,
                                   // Ketebalan border
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              
                              child: Column(
                                children: [fruitWidget(fruit)],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fruitWidget(Fruit fruit) {
    switch (fruit) {
      case Fruit.apple:
        return Container(
          child: Column(
            children: [
              Text(
                "🍎",
                style: TextStyle(fontSize: 50, color: Colors.red),
              ),
            ],
          ),
        );
      case Fruit.banana:
        return Container(
          child: Column(
            children: [
              Text(
                "🍌",
                style: TextStyle(fontSize: 50, color: Colors.yellow),
              ),
            ],
          ),
        );
      case Fruit.orange:
        return Container(
          child: Column(
            children: [
              Text(
                "🍊",
                style: TextStyle(fontSize: 50, color: Colors.orange),
              ),
            ],
          ),
        );
    }
  }
}
