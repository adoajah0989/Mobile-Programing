import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemKos extends StatelessWidget {
  final String namaRumah;
  final String harga;
  final String lokasi;
  final VoidCallback onPressed; // Callback untuk menangani saat tombol di klik

  const ItemKos({
    Key? key,
    required this.namaRumah,
    required this.harga,
    required this.lokasi,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Menggunakan callback onPressed saat tombol di klik
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          color: Theme.of(context).hoverColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://lh7-us.googleusercontent.com/YoctBTzOG06ud1TNFl1CfXKB7MKQvQLklfhFusaxfhmtDloTCVqlNVPAwXlfK1aG53tqfw6rrufMFtl2yFCJTk95xA7SzxQma9EibCgWyGGGfCRA5XWxlfVBwBjdbBhmo_rad1p1m45REbbe0DdfRcw',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                namaRumah,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                '$harga /bulan',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 20,
                  ),
                  Text(
                    '$lokasi',
                    style: TextStyle(fontSize: 14, color: Colors.white),
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
