import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              child: ElevatedButton(style:
                ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 25),
                  primary: Colors.white,
                  onPrimary: Colors.black,), child: const Text("Menu"), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()),);}),
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