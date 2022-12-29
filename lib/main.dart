import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:math';

List<String> people = [ // put in this list the name of your people
  '',
  'Noemi',
  'Raffaele',
  'Pietro',
  'Eugenio',
  'Andrea',
  'Mario',
  'Antonio',
  'Salvatore',
  'Brunella',
  'Piergiorgio',
];
var min = 1;
var max = people.length - 1;
var randomNumber = 0;
var color = Colors.grey;
Random random = Random();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choose A Person',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Poppins',
      ),
      home: const MyHomePage(title: 'Choose A Person'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _wait() async {
    color = Colors.grey;

    var randomFor = random.nextInt(15) + 5;

    for (var i = 0; i <= randomFor; i++) {
      await Future.delayed(const Duration(milliseconds: 200), () {});
      _calculateRandom();
    }
    color = Colors.teal;
  }

  void _calculateRandom() {
    setState(() {
      randomNumber = random.nextInt(max) + min;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The chosen person is:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${people[randomNumber]}',
              style: TextStyle(color: color, fontSize: 40, fontFamily: 'Poppins-SemiBold'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _wait,
        tooltip: 'Increment',
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
