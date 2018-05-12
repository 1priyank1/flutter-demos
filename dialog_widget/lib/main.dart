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
      home: new MyHomePage(title: 'Dialog Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

enum Country {
  India,
  Australia,
  Caneda,
  US
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
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                   new RaisedButton(
                    child: new Text("Alert Dialog"),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      showAlertDialog(context);
                    },
                  ),

                   new RaisedButton(
                     child: new Text("Simple Dialog"),
                     color: Colors.blue,
                     textColor: Colors.white,
                     onPressed: () {
                       showSelectionDialog(context);
                     },
                   ),
                ],
              ),
            );
          }
      ),
    );
  }


  showAlertDialog(BuildContext context) {
    showDialog(context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text("Alert dialog"),
            content: new Text("This ia alert dialog."),
            actions: <Widget>[
              new FlatButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: new Text("Ok"))
            ],
          );
        }
    );
  }

  showSelectionDialog(BuildContext context) {
    showDialog(context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text("Select Country"),
            children: <Widget>[
              new SimpleDialogOption(
                onPressed: () { Navigator.pop(context, selectedCountry(Country.India)); },
                child: const Text('India'),
              ),
              new SimpleDialogOption(
                onPressed: () { Navigator.pop(context, selectedCountry(Country.Australia)); },
                child: const Text('Australia'),
              ),
              new SimpleDialogOption(
                onPressed: () { Navigator.pop(context, selectedCountry(Country.Caneda)); },
                child: const Text('Caneda'),
              ),
              new SimpleDialogOption(
                onPressed: () { Navigator.pop(context, selectedCountry(Country.US)); },
                child: const Text('US'),
              ),
            ],
          );
        }
    );
  }

  selectedCountry(Country country) {
    switch (country) {
      case Country.India:
      // Let's go.
        break;
      case Country.Australia:
      // Let's go.
        break;
      case Country.US:
      // Let's go.
        break;
      case Country.Caneda:
      // Let's go.
        break;
    }
  }

}