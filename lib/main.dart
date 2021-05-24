import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Feeling Lucky?',
                // margin: const EdgeInsets.only(bottom: 30.0),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontFamily: 'DancingScript',
                  // fontWeight: 700,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(24.0),
                  ),
                  onPressed: () {
                    setState(() {
                      leftDiceNumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(24.0),
                  ),
                  onPressed: () {
                    setState(() {
                      rightDiceNumber = Random().nextInt(6) + 1;
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: TextButton.icon(
                  label: Text('Draw both'),
                  icon: Icon(
                    Icons.autorenew,
                    size: 25,
                  ),
                  style: OutlinedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lato',
                        // fontWeight: 700,
                      ),
                      primary: Colors.white,
                      padding: EdgeInsets.fromLTRB(60, 30, 60, 30),
                      side: BorderSide(color: Colors.white, width: 5)),
                  onPressed: () {
                    changeDiceFace();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
