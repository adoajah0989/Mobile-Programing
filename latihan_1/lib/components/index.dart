import 'package:flutter/material.dart';
import 'package:latihan_1/components/button.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "contoh penggunaan navigation pop",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber),
                ),
              ),
              Text(
                "penggunaan navigation pop berguna untuk kembali pada halaman sebelumnya",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Button(
                  text_button: "navigation pop",
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
