import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}); // Removed unnecessary super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  var ans = '';
  var counter1 = 0;
  var ans1 = '';
  var counter = 0;

  onLongPress() {
    setState(() {
      counter++;
    });
    ans = counter.toString();
  }

  onPress() {
    setState(() {
      counter1++;
    });
    ans1 = counter1.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OnLongPress_98')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Long Press System',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onPress();
            },
            onLongPress: () {
              onLongPress();
            },
            child: Text('Click'),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('onPress:'),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('$ans1'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('onLongPress:'),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('$ans'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
