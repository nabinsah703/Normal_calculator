import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const CaculatoApp());
}

class CaculatoApp extends StatefulWidget {
  const CaculatoApp({Key? key}) : super(key: key);

  @override
  State<CaculatoApp> createState() => _CaculatoAppState();
}

class _CaculatoAppState extends State<CaculatoApp> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter basic calculator',
      home: Scaffold(
        body: SafeArea(
          child: calculation(),
        ),
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
    return Column(
      children: [
        ResultDisplay(
          text: '0',
          result: 0,
        ),
        // CalculatorButton(
        //   label: '7',
        //   onTap: () => {},
        //   size: 90,
        //   backgroundColor: Colors.white,
        //   labelColor: Colors.black,
        // ),
        Row(
          children: [
            _getButton(text: '7', onTap: () => numberPressed(7)),
            _getButton(text: '8', onTap: () => numberPressed(8)),
            _getButton(text: '9', onTap: () => numberPressed(9)),
            _getButton(
                text: 'x',
                onTap: () => operatorPressed('*'),
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            _getButton(text: '4', onTap: () => numberPressed(4)),
            _getButton(text: '5', onTap: () => numberPressed(5)),
            _getButton(text: '6', onTap: () => numberPressed(6)),
            _getButton(
                text: '/',
                onTap: () => operatorPressed('/'),
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            _getButton(text: '1', onTap: () => numberPressed(1)),
            _getButton(text: '2', onTap: () => numberPressed(2)),
            _getButton(text: '3', onTap: () => numberPressed(3)),
            _getButton(
                text: '+',
                onTap: () => operatorPressed('+'),
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            _getButton(text: '=', onTap: () => operatorPressed('=')),
            _getButton(text: '0', onTap: () => numberPressed(0)),
            _getButton(
                text: 'c',
                onTap: clear,
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
            _getButton(
                text: '-',
                onTap: () => operatorPressed('-'),
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        )
      ],
    );
  }
}

operatorPressed(String operator) {}

numberPressed(int number) {}

calculateResult() {}

clear() {}

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
        alignment: Alignment.bottomRight,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 34),
        ),
      ),
    );
  }
}

Widget _getButton(
    {required String text,
    required Function onTap,
    Color backgroundColor = Colors.white,
    Color textcColor = Colors.black}) {
  return CalculatorButton(
    label: text,
    onTap: onTap,
    size: 90,
    backgroundColor: backgroundColor,
    labelColor: textcColor,
  );
}

class CalculatorButton extends StatelessWidget {
  CalculatorButton(
      {required this.label,
      required this.onTap,
      required this.size,
      this.backgroundColor = Colors.white,
      this.labelColor = Colors.black});

  final String label;
  // final VoidCallback onTap;
  final onTap; // comment the above line and put this line then fix the onTap problem in line no 196

  final double size;
  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Ink(
        width: size,
        height: size,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 2),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: backgroundColor,
        ),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(fontSize: 24, color: labelColor),
            ),
          ),
        ),
      ),
    );
  }
}
