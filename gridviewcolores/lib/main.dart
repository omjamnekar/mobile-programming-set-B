import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var colors = [
    Colors.redAccent,
    Colors.cyanAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellowAccent,
    Colors.greenAccent,
  ];

  var cname = '';
  var i = 0;
  var names = [
    'Red',
    'Cyan',
    'Orange',
    'Purple',
    'Pink',
    'Blue',
    'Yellow',
    'Green'
  ];
  List<Color> myColors = <Color>[];

  addColors() {
    myColors.add(Colors.black);
    for (var x = 0; x < colors.length; x++) {
      myColors.add(colors[x]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView-Gesture_98'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      cname = names[index].toString();
                      i = index + 1;
                      addColors();
                    });
                  },
                  child: Container(
                    color: colors[index],
                  ),
                );
              },
              itemCount: colors.length,
            ),
          ),
          Text(
            '$cname',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: myColors[i],
            ),
          ),
        ],
      ),
    );
  }
}
