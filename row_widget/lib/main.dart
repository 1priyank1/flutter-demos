import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return new Row(
        textDirection: TextDirection.ltr,
          children: <Widget>[
            new Expanded(child : new Icon(Icons.sentiment_very_satisfied, textDirection: TextDirection.ltr, color: Color(0xFF00FF00),)),
            new Expanded(child: new Text("One", textAlign: TextAlign.justify,textDirection: TextDirection.ltr)),
            new Expanded(child: new Text("Two", textAlign: TextAlign.justify, textDirection: TextDirection.ltr)),
            new Expanded(child: new Text("Three", textAlign: TextAlign.justify, textDirection: TextDirection.ltr)),
            const FlutterLogo()
          ],
      );
  }
}