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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define list_sub as a property of the state class
  List<String> list_sub = [
    'Python Programming',
    'Computer Networking',
    'Data Structure',
    'Operating System',
    'AM/MP',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView_98'),
      ),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
          itemCount: list_sub.length,
          itemBuilder: (context, index) {
            String number = (index + 1).toString();
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color.fromARGB(255, 210, 210, 210),
                    ),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${number}',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${list_sub[index]}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.menu)
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
