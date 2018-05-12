import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'BottomSheet Widget'),
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

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
          return new Center(
            child: new RaisedButton(
              child: new Text("Show BottomSheet"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
                  return new Container(
                      child: new Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: new Text('This is a BottomSheet. Click anywhere to dismiss.',
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 24.0
                              )
                          )
                      )
                  );
                });
              },
            )
          );
        },
      )
    );
  }
}