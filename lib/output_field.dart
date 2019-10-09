import "package:flutter/material.dart";

class OutputField extends StatefulWidget {
  final int _output;

  OutputField(this._output);

  @override
  _OutputFieldState createState() => _OutputFieldState();
}

class _OutputFieldState extends State<OutputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: CircleAvatar(
        radius: 100,
        child: Text(
          widget._output.toString(),
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
