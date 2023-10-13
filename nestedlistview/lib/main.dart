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
  var sem = ['I', 'II', 'III', 'IV'];
  var sub = [
    ['ppc', 'dla', 'fdbms', 'clds', 'TCS'],
    ['oops', 'fmpmc', 'wad', 'nm', 'git'],
    ['pp', 'ds', 'cn', 'os', 'am'],
    ['cj', 'ies', 'cost', 'se', 'cga'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('nestedListView_98')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              'assets/images/${index + 1}.png',
              width: 50,
              height: 50,
            ),
            title: Text(
              'Semester ${sem[index]}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Container(
              height: 100,
              child: ListView.builder(
                itemBuilder: (context, i) {
                  return Text(sub[index][i],
                      style: TextStyle(fontSize: 16, color: Colors.black));
                },
                itemCount: sub[index].length,
              ),
            ),
          );
        },
        itemCount: sem.length,
      ),
    );
  }
}
