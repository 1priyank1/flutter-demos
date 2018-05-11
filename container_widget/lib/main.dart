import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        width: 100.00,
        height: 100.00,
        padding: const EdgeInsets.all(10.00),
        color: const Color(0xFF00FF00),
        alignment: Alignment.center,
        child: new Text("Container",
            textDirection: TextDirection.ltr,
            style: new TextStyle(color: Color(0xFF000000)))
      ),
    );
  }
}