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
      home: new MyHomePage(title: 'Drawer Widget'),
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

  final List<ActorFilterEntry> _cast = <ActorFilterEntry>[
    const ActorFilterEntry('India', 'I'),
    const ActorFilterEntry('Australia', 'A'),
    const ActorFilterEntry('Unites States', 'US'),
    const ActorFilterEntry('United Kingdom', 'UK'),
    const ActorFilterEntry('Caneda', 'C')
  ];
  List<String> _filters = <String>[];
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
         child: new Column(
           crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Chip widget
            new Chip(
                label: new Text('Chip'),
                avatar: new CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: new Text('C'),
                ),
            ),
            // InputChip widget
            new InputChip(
                label: new Text("Input Chip"),
                avatar: new CircleAvatar(
                  backgroundColor: Colors.blue.shade700,
                  child: new Text("IC"),
                ),
                onPressed: (){
                  print("I am an Inpit chip.");
                },
            ),
            // FilterChip widget
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Filter Chip : ', style: textStyle),
                new Wrap(
                  children: actorWidgets.toList(),
                ),
                new Text('Selected Coutries: ${_filters.join(', ')}', style: textStyle ),
              ],
            ),
            // ChoiceChip widget
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('Choice Chip : ', style: textStyle),
                new Wrap(
                  children: new List<Widget>.generate(3, (int index) {
                      return new ChoiceChip(
                          label: new Text("Item $index"),
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                            });
                          },
                      );
                    }
                  ).toList()
                ),
              ],
            ),
            // ActionChip widget
            new ActionChip(
              label: new Text("Action Chip"),
              avatar: new CircleAvatar(
                backgroundColor: Colors.blue.shade700,
                child: new Text("AC"),
              ),
              onPressed: (){
                print("I am an Action chip.");
              },
            ),
          ],
        ),
      ),
    );
  }

  // Returns list of FilterChip widgets
  Iterable<Widget> get actorWidgets sync* {
    for (ActorFilterEntry actor in _cast) {
      yield new Padding(
        padding: const EdgeInsets.all(4.0),
        child: new FilterChip(
          avatar: new CircleAvatar(child: new Text(actor.initials)),
          label: new Text(actor.name),
          selected: _filters.contains(actor.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(actor.name);
              } else {
                _filters.removeWhere((String name) {
                  return name == actor.name;
                });
              }
            });
          },
        ),
      );
    }
  }
}


class ActorFilterEntry {
  const ActorFilterEntry(this.name, this.initials);
  final String name;
  final String initials;
}