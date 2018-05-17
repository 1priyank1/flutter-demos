import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Button Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _raisedCounter = 0;
  int _flatCounter = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              child: new Text("Raised Button"),
              onPressed: () {
                setState(() {
                  _raisedCounter++;
                });
              },
              color: Colors.blue,
              textColor: Colors.white,
            ),
            new Text(
              'You have pushed the raised button $_raisedCounter times',
              textAlign: TextAlign.justify
            ),
            new FlatButton(
              child: new Text("Flat Button"),
              onPressed: () {
                setState(() {
                  _flatCounter++;
                });
              },
              color: Colors.blue,
              textColor: Colors.white,
            ),
            new Text(
                'You have pushed the flat button $_flatCounter times',
                textAlign: TextAlign.justify
            )
          ],
        ),
      ),
    );
  }
}