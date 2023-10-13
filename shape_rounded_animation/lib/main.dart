import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rounded Shape',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool flag = false;
  var value = 10.0;
  Color color = Colors.amber;
  change() {
    setState(() {
      if (flag) {
        value = 50.0;
        flag = false;
        color = Colors.blue;
      } else {
        value = 10.0;
        flag = true;
        color = Colors.amber;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RoundedShapeAnimation_98'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            AnimatedContainer(
              duration: Duration(seconds: 2),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(value),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                change();
              },
              child: Text('Change'),
            ),
          ],
        ),
      ),
    );
  }
}
