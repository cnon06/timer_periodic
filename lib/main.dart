import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  bool checkElevatedButton = false;
  late Timer myTimer2;

  @override
  void initState() {
    myTimer2 = Timer(const Duration(microseconds: 1), () {});
   
    super.initState();
  }

  void myTimer() {
    myTimer2 = Timer.periodic(const Duration(seconds: 1), (timer) {
      

      print(timer.tick);
      counter = timer.tick;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Message: $counter"),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                  if (myTimer2.isActive) myTimer2.cancel();
                  
                  counter = 0;
                  myTimer();

                 
                },
                child: const Text("Press"))
          ],
        ),
      ),
    );
  }
}
