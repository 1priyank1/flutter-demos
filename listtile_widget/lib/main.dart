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
      home: new MyHomePage(title: 'ListTile Widget'),
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
    int _act = 1;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Column(
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.directions_car),
              title: const Text("Direction By Car"),
              subtitle: const Text("It will take 45 minutes to reach your destination by car."),
              onTap: () { /* react to the tile being tapped */ },
            ),
            new ListTile(
                leading: const Icon(Icons.directions_bus),
                title: const Text("Direction By Bus"),
                subtitle: const Text("It will take 60 minutes to reach your destination by bus."),
                onTap: () { /* react to the tile being tapped */ }
            ),
            new ListTile(
              leading: const Icon(Icons.directions_bike),
              title: const Text("Direction By Bike"),
              subtitle: const Text("It will take 25 minutes to reach your destination by bike."),
              onTap: () { /* react to the tile being tapped */ },
            ),
            new ListTile(
              leading: const Icon(Icons.directions_railway),
              title: const Text("Direction By Railway"),
              subtitle: const Text("It will take 30 minutes to reach your destination by Railway."),
              onTap: () { /* react to the tile being tapped */ },
            ),
            new ListTile(
              leading: const Icon(Icons.directions_walk),
              title: const Text("Direction By Walk"),
              subtitle: const Text("It will take 10 hours to reach your destination by bike."),
              onTap: () { /* react to the tile being tapped */ },
            )
          ],
        )
    );
  }
}