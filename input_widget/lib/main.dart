import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      home: new MyHomePage(title: 'Input Widget'),
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
  bool checkboxValue = false, switchValue = false;
  int radioValue = 0;
  double sliderValue = 50.0;
  DateTime date = new DateTime.now();
  TimeOfDay time = const TimeOfDay(hour: 7, minute: 28);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    TextStyle textStyle =  Theme.of(context).textTheme.headline;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
          builder: (BuildContext context) {

            return new Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: new BoxDecoration(
                  border: new Border(bottom: new BorderSide(color: theme.dividerColor))
              ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                      new Text("TextField : ", style: textStyle),
                       new Flexible(
                          child: new TextField(
                          decoration: const InputDecoration(helperText: "Enter App ID"),
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ),
                  ]
                ),
                new Row(
                  children: <Widget>[
                    new Text("Checkbox : ", style: textStyle),
                    new Checkbox(value: checkboxValue,
                      onChanged: (bool value) {
                           // set state
                        setState(() {
                          checkboxValue = value;
                        });
                      }
                      ,activeColor: Colors.blue,)
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Text("Switch : ", style: textStyle),
                    new Switch(value: switchValue,
                      onChanged: (bool value) {
                        // set state
                        setState(() {
                          switchValue = value;
                        });
                      }
                      ,activeColor: Colors.blue,)
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Text("Radio : One ", style: textStyle) ,
                    new Radio<int>(
                        value: 0,
                        groupValue: radioValue,
                        onChanged: (int value) {
                          setState(() {
                            radioValue = value;
                          });
                        }
                    ),
                    new Text("Two ", style: textStyle),
                    new Radio<int>(
                        value: 1,
                        groupValue: radioValue,
                        onChanged: (int value) {
                          setState(() {
                            radioValue = value;
                          });
                        }
                    )
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Text("Slider : 0", style: textStyle),
                    new Slider(
                      value: sliderValue ,
                      min: 0.0,
                      max: 100.0,
                      divisions: 5,
                      label: '${sliderValue.round()}',
                      onChanged: (double value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                    ),
                    new Text("100", style: textStyle),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Text("DatePicker :  ", style: textStyle),
                    new InkWell(
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: date.subtract(const Duration(days: 30)),
                            lastDate: date.add(const Duration(days: 30))
                        )
                            .then<Null>((DateTime value) {
                          if (value != null)
                            //onChanged(new DateTime(value.year, value.month, value.day, time.hour, time.minute));
                            setState(() {
                              date = value;
                            });
                        });
                        },
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text(new DateFormat('EEE, MMM d yyyy').format(date), style: textStyle),
                              const Icon(Icons.arrow_drop_down, color: Colors.black54),
                            ]
                        )
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Text("TimePicker :  ", style: textStyle),
                    new InkWell(
                        onTap: () {
                          showTimePicker(
                              context: context,
                              initialTime: time
                          )
                              .then<Null>((TimeOfDay value) {
                            if (value != null)
                              setState(() {
                                time = value;
                              });
                          });
                        },
                        child: new Row(
                            children: <Widget>[
                              new Text('${time.format(context)}', style: textStyle),
                              const Icon(Icons.arrow_drop_down, color: Colors.black54),
                            ]
                        )
                    ),
                  ],
                ),
              ]
            ),
            );
          }
      ),
    );
  }
}