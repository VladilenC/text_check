import 'package:flutter/material.dart';
import 'package:text_check/widget.dart';
import 'package:text_check/widget_expanded.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Text Check',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  late String text = '';
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: "Текст",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (value) => setState(() {
              text = value;
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          Checkbox(
              value: check,
              onChanged: (bool? value) => setState(() {
                    check = value!;
                  })),
          const SizedBox(
            height: 50,
          ),
          const Text('Container'),
          TextCheck(
            text: text,
            check: check,
          ),
          const SizedBox(height: 10.0),
          const Text('Expanded'),
          TextCheckExpanded(
            text: text,
            check: check,
          ),
        ],
      ),
    );
  }
}
