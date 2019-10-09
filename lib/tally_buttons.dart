import "package:flutter/material.dart";

class TallyButton extends StatelessWidget {
  final Function increase;
  final Function decrease;

  TallyButton(this.increase, this.decrease);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10),
              ),
              child: Icon(Icons.remove),
              onPressed: decrease,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10),
              ),
              child: Icon(Icons.add),
              onPressed: increase,
            ),
          )
        ],
      ),
    );
  }
}
