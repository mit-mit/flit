import 'package:flutter/material.dart';

//import 'visting.dart';
import 'diagnostics.dart';

BuildContext savedContext;

void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FlutterDemo(
      ),
    )
  );
}

String computeText() {
  StringBuffer sb = new StringBuffer();

  List<int> originKeys = originMap.keys.toList()..sort();
  for (var id in originKeys) {
    Map mp = originMap[id];
    sb.writeln("$id ${mp["widgetName"]} ${mp["path"]} ${mp["line"]}:${mp["char"]}");
  }
 return sb.toString();
}

class FlutterDemo extends StatefulWidget {
  FlutterDemo({ Key key }) : super(key: key);

  @override
  _FlutterDemoState createState() {
    return globalState = new _FlutterDemoState();
  }
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var tree = h(0, new Scaffold(
      appBar: h(1, new AppBar(
              title: h(2, new Text('Flutter Demo', ctorLocation: 'myApp.dart 54:26')), ctorLocation: 'myApp.dart 53:19'),

                ),
      body: h(3, new Center(
              child: h(4, new Text("${computeText()}", ctorLocation: 'myApp.dart 58:26')),
//        child: h(4, new Text("test")),
              ctorLocation: 'myApp.dart 57:17')),
      floatingActionButton: h(5, new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: h(6, new Icon(Icons.add, ctorLocation: 'myApp.dart 64:23')),
        ctorLocation: 'myApp.dart 61:33')),
      ctorLocation: 'myApp.dart 52:20'));
    return tree;
  }
}
