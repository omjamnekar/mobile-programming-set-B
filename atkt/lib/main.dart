import 'package:atkt/style/style.dart';
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
  var name = TextEditingController();
  var rno = TextEditingController();
  var th = ['OOPS', 'FMPMC', 'WAD', 'NM', 'GIT'];
  var pr = [
    'OOPS Practical',
    'FMPMC Practical',
    'WAD Practical',
    'NM Practical',
    'PL/SQL Practical'
  ];

  var th_kt = [], pr_tk = [], num_th = 0, num_pr = 0;
  String divError = '' as String;
  String div = '';
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 5; i++) {
      th_kt.add(false);
      pr_tk.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('State Mangement'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please ennter your name';
                      }
                      return null;
                    },
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
                  TextFormField(
                    controller: rno,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your roll no.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Enter your Rollno',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Division',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: RadioListTile(
                          value: 'A',
                          groupValue: div,
                          title: Text('A'),
                          onChanged: (value) {
                            setState(() {
                              div = value.toString();
                              divError = '';
                            });
                          },
                        ),
                      ),
                      Flexible(
                        child: RadioListTile(
                          value: 'B',
                          groupValue: div,
                          title: Text('B'),
                          onChanged: (value) {
                            setState(() {
                              div = value.toString();
                              divError = '';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '$divError',
                      style: TextStyle(fontSize: 12, color: Colors.red[900]),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Semester II',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            for (var i = 0; i < 5; i++)
                              CheckboxListTile(
                                value: th_kt[i],
                                title: Text('${th[i]}'),
                                onChanged: (value) {
                                  setState(() {
                                    th_kt[i] = !th_kt[i];
                                    if (th_kt[i])
                                      num_th++;
                                    else
                                      num_th--;
                                  });
                                },
                              )
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            for (var i = 0; i < 5; i++)
                              CheckboxListTile(
                                value: pr_tk[i],
                                title: Text('${pr[i]}'),
                                onChanged: (value) {
                                  setState(() {
                                    pr_tk[i] = !pr_tk[i];
                                    if (pr_tk[i])
                                      num_pr++;
                                    else
                                      num_pr--;
                                  });
                                },
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (div == '')
                          divError = 'Please select division';
                        else
                          divError = '';
                      });
                      if (formKey.currentState!.validate() && div != '') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                                name.text.toString(),
                                rno.text.toString(),
                                div,
                                num_th,
                                num_pr),
                          ),
                        );
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ResultPage extends StatelessWidget {
  var name, rno, div;
  int num_th = 0, num_pr = 0;
  ResultPage(this.name, this.rno, this.div, this.num_th, this.num_pr);
  var res = '';

  result() {
    if (num_pr == 0 && num_th == 0)
      res = 'pass';
    else if (num_th > 0 && num_th <= 2 && num_pr == 0)
      res = 'A.T.K.T';
    else if (num_th == 1 && num_pr > 0 && num_pr <= 2)
      res = 'A.T.K.T';
    else if (num_th == 0 && num_pr > 0 && num_pr <= 3)
      res = 'A.T.K.T';
    else
      res = 'Fail';
  }

  @override
  Widget build(BuildContext context) {
    result();
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  child: Text(
                    'Name:',
                    style: myStyle1(),
                  ),
                ),
                Text(
                  '$name',
                  style: myStyle2(),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 70,
                  child: Text(
                    'Roll no:',
                    style: myStyle1(),
                  ),
                ),
                Text(
                  '$rno',
                  style: myStyle2(),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 70,
                  child: Text(
                    'Result:',
                    style: myStyle1(),
                  ),
                ),
                Text(
                  '$div',
                  style: myStyle2(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
