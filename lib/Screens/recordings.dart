import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piano/widgets/record.dart';

import 'cardview.dart';
import 'menu.dart';

class Recordings extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RecordingsState();
}



class _RecordingsState extends State<Recordings>{

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(title: Text("Recordings"),),
      body: Column(
        children: <Widget>[
          ElevatedButton(style:
          ElevatedButton.styleFrom(
            minimumSize: const Size(100, 50),
            primary: Colors.white,
            onPrimary: Colors.black,), child: const Text("Menu"), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()),);}),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: saves.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Text('Recording ${index+1} ', style: const TextStyle(fontSize: 19, color: Colors.black)),
                        Cardview.card(file: saves[index], update: update,),
                      ],
                    ),
                  );
                }
             ),
          ),
        ],
      ),
    );
  }

  void update() {
    setState(() {});
  }
}
