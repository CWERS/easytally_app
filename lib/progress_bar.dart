import "package:flutter/material.dart";

class ProgressBar extends StatelessWidget {
  final int _goal;
  final int _currentNumber;

  double get _pctOfGoal {
    if (_goal == 0) {
      return 0;
    }
    return _currentNumber / _goal;
  }

  ProgressBar(this._currentNumber, this._goal);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(30),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text("Goal: $_goal  Progress: ${(_pctOfGoal * 100).toInt()}%"),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 10,
                width: 250,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    FractionallySizedBox(
                        widthFactor: _pctOfGoal,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                  (10),
                                ))))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
