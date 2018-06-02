import 'package:flutter/foundation.dart';
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
      home: new FirstScreen(),
    );
  }
}

// Data class Person
class Person {
  final String name;
  final String age;

  Person(this.name, this.age);
}

class FirstScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("First Screen"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              child: new Text("Launch new screen"),
              onPressed: () {
                // Navigate to second screen when tapped!
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondScreen()));
              }
            ),
            new RaisedButton(
                child: new Text("Launch new screen with Data"),
                onPressed: () {
                  // Navigate to second screen when tapped!
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondScreenWithData(person: new Person("Priyank","28"))));
                }
            ),
            new RaisedButton(
                child: new Text("Launch new screen for result"),
                onPressed: () {
                  _navtigateAndDisplayResult(context);
                }
            ),
          ],
        ),
      ),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from Navigator.pop!
  _navtigateAndDisplayResult(BuildContext context) async {
    // Navigator.push returns a Future that will complete after we call Navigator.pop on the SecondScreenForResult!
    final result = await Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondScreenForResult()));
    print("Result : $result");
    // After the Selection Screen returns a result, show it in a Snackbar!
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("Resilt : ${result}"), duration: new Duration(seconds: 5),
        action: new SnackBarAction(label: "OK", onPressed: () {})));
    }
}

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                  child: new Text("Go Back!"),
                  onPressed: () {
                    // Navigate back to first screen when tapped!
                    Navigator.pop(context);
                  }
              ),
            ],
          )
      ),
    );
  }
}


class SecondScreenWithData extends StatelessWidget {
  // Declare a field that holds the Person data
  final Person person;

  // In the constructor, require a Person
  SecondScreenWithData({Key key, @required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen With Data"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Display passed data from first screen
            new Text("Person Data  \nname: ${person.name} \nage: ${person.age}"),
            new RaisedButton(
              child: new Text("Go Back!"),
              onPressed: () {
                // Navigate back to first screen when tapped!
                Navigator.pop(context);
              }
            ),
          ],
        )
      ),
    );
  }
}



class SecondScreenForResult extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen For Result"),
      ),
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text("Select any option:"),
              new RaisedButton(
                  child: new Text("One"),
                  onPressed: () {
                    // Navigate back to first screen with result 'One'.
                    Navigator.pop(context, "One");
                  }
              ),
              new RaisedButton(
                  child: new Text("Two"),
                  onPressed: () {
                    // Navigate back to first screen with result 'Two'.
                    Navigator.pop(context, "Two");
                  }
              ),
              new RaisedButton(
                  child: new Text("Three"),
                  onPressed: () {
                    // Navigate back to first screen with result 'Three'.
                    Navigator.pop(context, "Three");
                  }
              ),
            ],
          )
      ),
    );
  }
}