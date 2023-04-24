import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class TextCheck extends StatelessWidget {
  const TextCheck({super.key, required this.text, required this.check});
  final String text;
  final bool check;
  final style = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int width = size.width.toInt();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          height: 30.00,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
          ),
          constraints: BoxConstraints(maxWidth: width-40),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: style,
          ),
        ),
        Expanded(
child: Container(
        height: 30.00,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black, width: 1),
  ),
          child: const DottedLine(dashLength: 8.0, dashGapLength: 1.0),
        )),
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

}
