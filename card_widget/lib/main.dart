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
      home: new MyHomePage(title: 'Card Widget'),
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
    //TextStyle textStyle = Theme.of(context).textTheme.subhead;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: const Icon(Icons.album),
              title: const Text("The Enchanted Nightingale"),
              subtitle: const Text(
                  'Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            new ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  new FlatButton(
                    child: new Text("BUY TICKETS"),
                    onPressed: () {},
                  ),
                  new FlatButton(
                    child: new Text("LISTEN"),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}