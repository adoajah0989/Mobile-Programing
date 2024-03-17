import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String child;
  Item({required this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.all(Radius.circular(10))),
        
        child: Center(
            child: Text(
          child,
          style: TextStyle(fontSize: 40,fontWeight:FontWeight.bold),
        )),
      ),
    );
  }
}
