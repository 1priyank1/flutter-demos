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
      home: new MyHomePage(title: 'BottomNavigationBar Widget'),
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

  // This controller can be used to programmatically set the current displayed page
  PageController _pageController;

  // Indicating the current displayed page
  int _page = 0;

  // Called when the user presses on of the BottomNavigationBarItem with corresponding page index
  void navigationTapped(int page){

    // Animating to the page.
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }


  void onPageChanged(int page){
    setState((){
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new PageView(
        children: [
          new Container(child: new Text("Car", style: textStyle), color: Colors.amber),
          new Container(child: new Text("Bus", style: textStyle), color: Colors.yellow),
          new Container(child: new Text("Bike", style: textStyle), color: Colors.lime)
        ],
          /// Specify the page controller
          controller: _pageController,
          onPageChanged: onPageChanged
      ),
      bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.directions_car),
                title: new Text("Car")
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.directions_bus),
                title: new Text("Bus")
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.directions_bike),
                title: new Text("Bike")
            )
          ],
          /// Will be used to scroll to the next page using the _pageController
          onTap: navigationTapped,
          currentIndex: _page
      ),
    );


  }
}
