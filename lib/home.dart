import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stopwatch watch = Stopwatch();
  Timer timer;
  String elapsedTime = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chart Stopwatch'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              elapsedTime,
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _startWatch,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.play_arrow),
                ),
                FloatingActionButton(
                  onPressed: _stopWatch,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.stop),
                ),
                FloatingActionButton(
                  onPressed: _resetWatch,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.refresh),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _startWatch() {
    watch.start();
    _setTime();
  }

  _stopWatch() {
    watch.stop();
    _setTime();
  }

  _resetWatch() {
    watch.reset();
    _setTime();
  }

  _setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = _transformMilliseconds(timeSoFar);
    });
  }

  _transformMilliseconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredStr = (hundreds % 100).toString().padLeft(2, '0');

    return "$minutesStr : $secondStr : $hundredStr";
  }
}
