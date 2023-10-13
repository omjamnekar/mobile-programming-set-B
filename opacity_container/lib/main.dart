import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'opacity',
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
  var opac = 1.0;
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Opacity_98')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AnimatedOpacity(
                  opacity: opac,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.redAccent,
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (flag) {
                    opac = 0.1;
                    flag = false;
                  } else {
                    opac = 1.0;
                    flag = true;
                  }
                });
              },
              child: Text('Animate'),
            )
          ],
        ),
      ),
    );
  }
}
