import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Removed unnecessary super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'image changer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String str = 'image/assets/cn.png';
  List<String> list_image = [
    'am',
    'cn',
    'ds',
    'flutter',
    'linux',
    'python',
    'windows',
  ];
  imageChange() {
    setState(() {
      int i = Random().nextInt(list_image.length);
      str = "image/assets/${list_image[i]}.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ImageChanger_98')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              '${str}',
              width: 200,
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                imageChange();
              },
              child: Text('Change'),
            )
          ],
        ),
      ),
    );
  }
}
