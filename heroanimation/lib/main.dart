import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
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
  var images = ['am', 'cn', 'flutter', 'linux', 'python', 'windows'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroAnimation_98'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 50,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImagePage('${images[index]}'),
                  ),
                );
              },
              child: Hero(
                tag: '${images[index]}',
                child: Image.asset(
                  'image/assets/${images[index]}.png',
                ),
              ),
            );
          }),
    );
  }
}

class ImagePage extends StatelessWidget {
  var image;
  ImagePage(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$image'.toUpperCase()),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            child: Hero(
                tag: '$image',
                child: Image.asset(
                  'image/assets/$image.png',
                  width: 200,
                  height: 200,
                )),
          ),
        ),
      ),
    );
  }
}
