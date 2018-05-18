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
      home: new MyHomePage(title: 'ListView Widget'),
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
  // Step position
  int _currentStep = 0;
  List<Step> steps = [
    new Step(
        // Title of the Step
        title: new Text("Step 1"),
        content: new Text("Content 1"),
        isActive: true),
    new Step(
        title: new Text("Step 2"),
        content: new Text("Content 2"),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Step 3"),
        content: new Text("Contetn 3"),
        state: StepState.complete,
        isActive: true),
  ];


  @override
  Widget build(BuildContext context) {
    //TextStyle textStyle = Theme.of(context).textTheme.subhead;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Stepper(
        steps: steps,
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepTapped: (step) {
            setState(() {
              _currentStep = step;
            });
        },
        onStepCancel: () {
          setState(() {
             if(_currentStep > 0) {
               _currentStep = _currentStep - 1;
             }
          });
        },
        onStepContinue: () {
          setState(() {
            if(_currentStep < steps.length - 1) {
              _currentStep = _currentStep + 1;
            }
            else {
              _currentStep = 0;
            }
          });
        },

      )
    );
  }
}