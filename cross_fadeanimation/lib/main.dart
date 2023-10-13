import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrossFade',
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
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CrossFadeAnimation_98'),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedCrossFade(
              firstChild: Image.asset('image/assets/day.png'),
              secondChild: Image.asset('image/assets/night.png'),
              crossFadeState: isFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(seconds: 4),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isFirst = !isFirst; // Toggle the value
                });
              },
              child: Text('Cross Fade'),
            ),
          ],
        ),
      ),
    );
  }
}
