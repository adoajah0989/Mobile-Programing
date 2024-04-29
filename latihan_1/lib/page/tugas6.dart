import 'package:flutter/material.dart';

void main() {
  runApp(tugas6());
}

class tugas6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Function with Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'tekan tombol untuk memanggil fungsi !',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {
                showMessage(context); // Call the function on press
              },
              child: Text('Panggil fungsi'),
            ),
          ],
        ),
      ),
    );
  }
}

void showMessage(BuildContext context) {
  // Function to display a dialog message
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Hasil Function'),
        content: Text('pesan ini berasal dari fungsi'),
        actions: [
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
