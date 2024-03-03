import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo Latihan 1',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 61, 158, 161)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Latihan 1 page'),
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
  List<String> namaAnggotaKelompok = [
    'Nurmansyah',
    'Teguh',
    'Gilang',
    'Tegar',
    'sofwan'
  ];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Nama anggota kelompok:',
            ),
            const SizedBox(height: 10), // Spasi untuk kenyamanan tampilan
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < namaAnggotaKelompok.length; i++)
                  Text(
                    '- ${namaAnggotaKelompok[i]}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                const SizedBox(height: 10),
                Text('kamu telah menekan tombol sebanyak $_counter x'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 10), // Spasi antara dua tombol
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement', // Ubah tooltip agar sesuai
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
