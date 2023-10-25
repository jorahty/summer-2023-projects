import 'package:flutter/material.dart';

String img =
    'https://upload.wikimedia.org/wikipedia/commons/2/22/Elephant_side-view_Kruger.jpg';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('Flutter is Fun!'),
          ),
          body: IconButton(
            icon: Hero(tag: img, child: Image.network(img)),
            iconSize: 128,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AboutScreen(),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text('About'),
        ),
        body: Hero(tag: img, child: Image.network(img)),
      ),
    );
  }
}
