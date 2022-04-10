import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:piano/piano/piano.dart';
import 'package:piano/widgets/record.dart';

import 'menu.dart';

class Freestyle extends StatefulWidget {

  const Freestyle({Key? key}) : super(key: key);

  
  @override
  State<StatefulWidget> createState() => _FreestyleState();
}

class _FreestyleState extends State<Freestyle>{

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    double space = MediaQuery.of(context).size.height * 0.33;
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
              height: space / 2,
              child: Column(
                children: <Widget>[
                  SizedBox(width: 50, height: 10),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/logo.png")
                  ),
                ],
              )
              /*child: IconButton(
                icon: Image.asset("assets/logo.png"),
                iconSize: 200,
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()),);}
              )*/

              /*child: ElevatedButton(style:
                ElevatedButton.styleFrom(
                  //minimumSize: const Size(100, 25),
                  primary: Colors.white,
                  onPrimary: Colors.black,), child: const Text("Menu"), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()),);}),*/
          ),

          SizedBox(
              height: space / 2,
              child: const Record()
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - space,
            child: const Piano()
          )
        ],
      ),
    );
  }

}