import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var emojiOptions = [
    '🐸',
    '🦎',
    '🪲',
    '🦖',
    '🐍',
    '🐊',
    '🐛',
    '🐢',
  ];

  var selectedEmoji = '🐸'; // ERROR
  var count = 0;

  void select(String emoji) {
    setState(() {
      selectedEmoji = emoji;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Frog Form'),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  emojiOptions.length,
                  (index) => Ink(
                    decoration: ShapeDecoration(
                      color: emojiOptions[index] == selectedEmoji
                          ? Colors.greenAccent
                          : null,
                      shape: const CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () => select(emojiOptions[index]),
                      icon: Text(
                        emojiOptions[index],
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: count > 0 ? decrement : null,
                    child: const Text('Decrement'),
                  ),
                  Text(
                    '$count',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: increment,
                    child: const Text('Increment'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: List.generate(
                  count,
                  (_) => Text(
                    selectedEmoji,
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
