import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piano/consts/notes.dart';
import 'package:piano/piano/ClearModifiedPiano.dart';

import 'menu.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  static late String note;

  static void setnote(s){
    note = s;
  }

  @override
  State<StatefulWidget> createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin{
  late Timer _timer;
  int _start = 3;
  String verdict = "";
  bool _visible = true;
  int Point = 0;
  String note = "";


  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;

  _TestState(){
    note = setNote();
    startTimer();}

  @override
  Widget build(BuildContext context) {
    animation = AnimationController(vsync: this, duration: const Duration(milliseconds: 500),);
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
    animation.forward();
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animation.reverse();
      }
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double space = MediaQuery
        .of(context)
        .size
        .height * 0.33;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: space / 2,
            child: ElevatedButton(style:
            ElevatedButton.styleFrom(
              minimumSize: const Size(100, 25),
              primary: Colors.white,
              onPrimary: Colors.black,),
                child: const Text("Menu"),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Menu()),);
                }),
          ),
          SizedBox(
            height: space / 2 - 20 ,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    '$note', textAlign: TextAlign.left, style: TextStyle(fontSize: 90),
                  ),
                  Column(
                    children: <Widget>[
                      Text('Timer: $_start', textAlign: TextAlign.right, style: TextStyle(fontSize: 30)),
                      Text(Point.toString(), textAlign: TextAlign.right, style: TextStyle(fontSize: 30)),
                    ]
                  )
                ],
            ),
          ),
          SizedBox(
            height: 20,
            child: Center(child: FadeTransition(opacity: _fadeInFadeOut,
              child: Text(
                "$verdict",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20),
              ),
            ),
            ),
          ),
          SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - space,
              child: ModifiedPiano(update: update)
          )
        ],
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _showMyDialog();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  String setNote() {
    var l = Notes.notes;
    var code = l[Random().nextInt(l.length)];
    Test.setnote(code);
    return code;
  }

  void update(String s) {
    if (s == ('Correct')) {
      setState(() {
        _visible = true;
        verdict = s;
        Point++;
        _start = 3;
        note = setNote();
      });
    }
    else {
      setState(() {
        _visible = true;
        _timer.cancel();
        _showMyDialog();
      });
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('GAME OVER', textAlign: TextAlign.center),
                Text('Score: $Point', textAlign: TextAlign.center),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Test()),);} , child: const Text('Retry')),
            TextButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()),);} , child: const Text('Menu')),
          ],
        );
      },
    );
  }

}