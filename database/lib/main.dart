import 'package:database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:database/student.dart';
import 'package:database/database_helper.dart';

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
  DBHelper? dbh;
  late Future<List<StudentModel>> studentList;
  var sn = TextEditingController();
  var r = TextEditingController();
  var a = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbh = DBHelper();
    loadData();
  }

  loadData() async {
    studentList = dbh!.getStudent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataBase_98'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: sn,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: r,
              decoration: InputDecoration(
                labelText: 'Roll number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: a,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                dbh!
                    .ins(StudentModel(
                  sname: sn.text.toString(),
                  rno: int.parse(r.text.toString()),
                  address: a.text.toString(),
                ))
                    .then((value) {
                  print('Record saved Successfully');
                  setState(() {
                    studentList = dbh!.getStudent();
                    sn.text = '';
                    r.text = '';
                    a.text = '';
                  });
                }).onError((error, stackTrace) {
                  print(error.toString());
                });
              },
              child: Text(
                'save',
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: studentList,
                builder: (context, AsyncSnapshot<List<StudentModel>> snapshot) {
                  if (snapshot.hasData)
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          shadowColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            leading: Text(
                              snapshot.data![index].rno.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            title: Text(
                              snapshot.data![index].sname.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              snapshot.data![index].address.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  else
                    return Container(
                      child: Text('No Data found',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
