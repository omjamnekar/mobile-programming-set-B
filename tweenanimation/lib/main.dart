import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController ac;
  late Animation<double> a;
  late Animation<Color?> c;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ac = AnimationController(vsync: this, duration: Duration(seconds: 4));
    a = Tween(begin: 200.0, end: 0.0).animate(ac);
    c = ColorTween(begin: Colors.blue, end: Colors.redAccent).animate(ac);

    ac.addListener(() {
      setState(() {
        if (ac.status == AnimationStatus.completed) {
          ac.reverse();
        } else if (ac.status == AnimationStatus.dismissed) {
          ac.forward();
        }
      });
    });

    ac.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween animation'),
      ),
      body: Center(
        child: Container(
          height: a.value,
          width: a.value,
          color: c.value,
        ),
      ),
    );
  }
}
