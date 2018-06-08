import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  MyAppPage({Key key}) : super(key: key);

  @override
  _MyAppPageState createState() => new _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Network Demo"),
        ),
        body: widgets.length == 0 ? getProgressDialog() : getListView()
    );
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Row(
          children: <Widget>[
            //new Text("${widgets[i]["id"]}", style: Theme.of(context).textTheme.subhead),
            new Container(
                  width: 50.0,
                  height: 50.0,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage('${widgets[i]["avatar_url"]}')
                    ),
                  ),
            ),
            new Text("${widgets[i]["login"]}", style: Theme.of(context).textTheme.subhead)
          ],
        )
    );
  }

  loadData() async {
    String dataURL = "https://api.github.com/users";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}