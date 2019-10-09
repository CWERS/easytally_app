import 'package:flutter/material.dart';

class NewGoal extends StatefulWidget {
  final Function addGoal;

  NewGoal(this.addGoal);

  @override
  _NewGoalState createState() => _NewGoalState();
}

class _NewGoalState extends State<NewGoal> {
  final _goalController = TextEditingController();

  void _submitData() {
    if (_goalController.text.isEmpty) {
      return;
    }
    final enteredGoal = int.parse(_goalController.text);
    widget.addGoal(enteredGoal);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Goal"),
              controller: _goalController,
              onSubmitted: (value) => _submitData(),
            ),
            RaisedButton(
              child: Text("Add Goal"),
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
