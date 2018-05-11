import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new MaterialApp(
        home: new DefaultTabController(
          length: 3,
          child: new Scaffold(
              appBar: new AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: new Text("TabBar Widget"),
                bottom: new TabBar(tabs: [
                  new Tab(icon: new Icon(Icons.directions_car)),
                  new Tab(icon: new Icon(Icons.directions_bus)),
                  new Tab(icon: new Icon(Icons.directions_bike)),
                ],)
              ),
              body: new TabBarView(children: [
                new Icon(Icons.directions_car, size: 100.00, color: textStyle.color),
                new Icon(Icons.directions_bus, size: 100.00, color: textStyle.color),
                new Icon(Icons.directions_bike, size: 100.00, color: textStyle.color),
              ])
          )
        )
    );
  }
}
