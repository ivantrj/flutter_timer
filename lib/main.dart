// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10;
  late Timer _timer;

  void _startTimer() {
    _counter = 10;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(
        () {
          if (_counter > 0) {
            _counter--;
          } else {
            _timer.cancel();
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Timer App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (_counter > 0)
                ? Text("")
                : Text(
                    "Timer Done!",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () => _startTimer(),
              child: Text("Start timer"),
            ),
          ],
        ),
      ),
    );
  }
}
