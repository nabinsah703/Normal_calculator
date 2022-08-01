import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter basic calculator',
      home: Scaffold(
        body: calculation(),
      ),
    );
  }
}

class calculation extends StatefulWidget {
  const calculation({Key? key}) : super(key: key);

  @override
  State<calculation> createState() => _calculationState();
}

class _calculationState extends State<calculation> {
  @override
  Widget build(BuildContext context) {
    return ResultDisplay(
      text: '0',
      result: 0,
    );
  }
}

class ResultDisplay extends StatelessWidget {
  var text;

  ResultDisplay({Key? key, required this.text, required this.result})
      : super(key: key);
  final int result;

  // const ResultDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.black,
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 34),
        ),
      ),
    );
  }
}
