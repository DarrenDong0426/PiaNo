import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piano/Screens/recordings.dart';
import 'package:piano/Screens/test.dart';
import 'freestyle.dart';
import 'learn.dart';


class Menu extends StatelessWidget{
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('assets/piano.jpg'),
          TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Freestyle()),);} , child: const Text('Freestyle')),
          TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Recordings()),);} , child: const Text('Recordings')),
          TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Learn()),);} , child: const Text('Learn')),
          TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Test()),);}, child: const Text('Test'))
        ],
      )
    );
  }
}