import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.title;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Image Widget"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Load image from assets
            new Text('Load image from assets', style: textStyle),
            new Image.asset('assets/mountain.jpg', height: 100.0),

            // Load image from network
            new Text('Load image from network', style: textStyle),
            new Image.network('https://picsum.photos/200', height: 100.0),

            // Chaching image from network
            new Text('Chached image from network', style: textStyle),
            new CachedNetworkImage(imageUrl: 'https://picsum.photos/200', height: 100.0),

            // Fade in image from network
            new Text('Fade in image from network', style: textStyle),
            new FadeInImage.memoryNetwork(placeholder: kTransparentImage,
                image: 'https://picsum.photos/200',
                height: 100.0)
          ],
        ),
      ),
    );
  }
}