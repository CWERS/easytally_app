import 'package:flutter/material.dart';
import './progress_bar.dart';
import './tally_buttons.dart';
import './output_field.dart';
import 'new_goal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EasyTally",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _outputNumber = 0;
  int _goal = 0;

  void _increaseOutput() {
    setState(() {
      _outputNumber++;
    });
    if (_outputNumber == _goal) {
      _displayVictory();
    }
  }

  void _decreaseOutput() {
    if (_outputNumber == 0) {
      return;
    }
    setState(() {
      _outputNumber--;
    });
  }

  void _addNewGoal(int goal) {
    setState(() {
      _goal = goal;
    });
  }

  void _startAddNewGoal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewGoal(_addNewGoal),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _displayVictory() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Goal Reached!"),
            content: new Text("Congratulations! You have reached the goal!"),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("Close"),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _startAddNewGoal(context);
                },
                child: new Text("Set New"),
              )
            ],
          );
        });
  }

  _reset() {
    setState(() {
      _outputNumber = 0;
      _goal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("EasyTally"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _reset(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ProgressBar(_outputNumber, _goal),
            OutputField(_outputNumber),
            TallyButton(_increaseOutput, _decreaseOutput),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.flag),
        onPressed: () => _startAddNewGoal(context),
      ),
    );
  }
}
