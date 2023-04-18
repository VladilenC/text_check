import 'dart:math';

import 'package:flutter/material.dart';

class TextCheck extends StatelessWidget {
  const TextCheck({super.key, required this.text, required this.check});
  final String text;
  final bool check;
  final String punktir =
      '--------------------------------------------------------';
  final style = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 0.95;
    int width = size.width.toInt() - 20;

    int flex1 = min(_textSize(text, style).width.toInt(), width - 10);
    int flex2 = max(10, width - flex1);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
          ),
          constraints: BoxConstraints(maxWidth: flex1.toDouble() + 2),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: style,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
          ),
          constraints: BoxConstraints(
              minWidth: flex2.toDouble(), maxWidth: flex2.toDouble()),
          child: Text(
            punktir,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: style,
          ),
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            width: 30,
            height: 30,
            child: Checkbox(
              value: check,
              fillColor: MaterialStateProperty.all(Colors.transparent),
              checkColor: Colors.black,
              side: const BorderSide(color: Colors.transparent),
              onChanged: (bool? value) {},
            )),
      ],
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
