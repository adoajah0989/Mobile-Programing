import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tugas_input_data/components/buttonText.dart';

class MenuMaster extends StatefulWidget {
  const MenuMaster({ Key? key }) : super(key: key);

  @override
  _MenuMasterState createState() => _MenuMasterState();
}

class _MenuMasterState extends State<MenuMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Data Layanan'),
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('Menu',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      CustomTextButton(icon: '📊', Judul: 'jenis layanan', onPressed: (){}),
                      CustomTextButton(icon: '📊', Judul: 'kategori layanan', onPressed: (){}),
                      CustomTextButton(icon: '📊', Judul: 'pelanggan', onPressed: (){}),
                      CustomTextButton(icon: '📊', Judul: 'proyek', onPressed: (){}),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MenuMaster(),
  ));
}