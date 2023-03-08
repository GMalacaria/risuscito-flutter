import 'package:flutter/material.dart';

class ListepPersonalizzate extends StatelessWidget {
  const ListepPersonalizzate({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        // primarySwatch: materialColor
      ),
      home: const ListepPersonalizzate(),
    );
  }
}

class ListepPersonalizzateApp extends StatefulWidget {
  const ListepPersonalizzateApp({Key? key}) : super(key: key);

  @override
  State<ListepPersonalizzateApp> createState() => ListepPersonalizzateState();
}

class ListepPersonalizzateState extends State<ListepPersonalizzateApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // Column is also a layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
      //   mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'ListepPersonalizzateApp',
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
