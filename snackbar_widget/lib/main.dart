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
      home: new MyHomePage(title: 'SnackBar Widget'),
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
              child: new Text("Show SnackBar"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("This is a SnackBar."),
                  duration: new Duration(seconds: 5),
                    action: new SnackBarAction(
                      label: "OK",
                      onPressed: () {

                      },
                    )
                   )
                );
              },
            )
          );
        }
      ),
    );
  }
}