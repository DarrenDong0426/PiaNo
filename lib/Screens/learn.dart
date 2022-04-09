import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piano/consts/notes.dart';
import 'package:piano/piano/ModifiedPiano.dart';
import 'package:piano/piano/ModifiedPiano_Key.dart';
import 'package:piano/piano/piano.dart';

import 'menu.dart';

class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);

  static late String note;

  static void setnote(s){
    note = s;
  }

  @override
  State<StatefulWidget> createState() => _LearnState();
}

class _LearnState extends State<Learn> with TickerProviderStateMixin {
  String verdict = "";
  bool _visible = true;

  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;


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
            child: Center(
              child: Text(
              setNote(),
              textAlign: TextAlign.center, style: TextStyle(fontSize: 90),
              ),
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

  String setNote() {
    var l = Notes.notes;
    var code = l[Random().nextInt(l.length)];
    Learn.setnote(code);
    return code;
  }

  void update(String s) {
    if (s == ('Correct')) {
      setState(() {
        verdict = s;
      });
    }
    else {
      setState(() {
        verdict = s;
      });
    }
  }

}