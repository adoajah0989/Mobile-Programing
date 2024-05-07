import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_tugas/component/itemKos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sewa kuy',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 210, 218)),
        useMaterial3: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'SEWA KUY'),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              onPressed: () {
                // Tambahkan logika ketika ikon ditekan di sini
              },
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Sewa kuy",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 210, 218),
                ),
                child: Icon(
                  Icons.event,
                )),
            ListTile(
              leading: Icon(Icons.home), // Ikon di sebelah kiri teks
              title: Text('Home'), // Teks menu
              onTap: () {
                // Aksi yang ingin dijalankan saat menu diklik
                Navigator.pop(context); // Tutup drawer setelah menu diklik
                // Tambahkan logika navigasi atau aksi lain di sini
              },
            ),
            ListTile(
              leading: Icon(Icons.settings), // Ikon di sebelah kiri teks
              title: Text('Settings'), // Teks menu
              onTap: () {
                // Aksi yang ingin dijalankan saat menu diklik
                Navigator.pop(context); // Tutup drawer setelah menu diklik
                // Tambahkan logika navigasi atau aksi lain di sini
              },
            ),
            // Tambahkan daftar menu lainnya di sini jika diperlukan
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              height: 420,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'New Offer',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height:
                          10), // Spasi vertikal antara judul dan SingleChildScrollView
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics:
                        AlwaysScrollableScrollPhysics(), // Biarkan selalu dapat digulir
                    child: Row(
                      children: [
                        ItemKos(
                          namaRumah: "Villa dago",
                          harga: "100000",
                          lokasi: "bogor",
                          onPressed: () {},
                        ),
                        ItemKos(
                          namaRumah: "Villa bogor",
                          harga: "100000",
                          lokasi: "bogor",
                          onPressed: () {},
                        ),
                        ItemKos(
                          namaRumah: "Villa dago",
                          harga: "10000",
                          lokasi: "bogor",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
