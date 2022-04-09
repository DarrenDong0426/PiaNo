import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_recorder.dart';
import 'package:piano/Screens/recordings.dart';
import 'package:piano/widgets/record.dart';


class Cardview extends StatefulWidget{
  final String file;
  final void Function() update;

  const Cardview.card({required this.file, required this.update});

  @override
  State<StatefulWidget> createState() => _CardviewState();
}

class _CardviewState extends State<Cardview>{
  late void Function() u;
  bool _isPlayerInitialized = false;
  FlutterSoundPlayer? audioPlayer;
  late String recording = widget.file;

  Future init() async{
    audioPlayer = FlutterSoundPlayer();

    await audioPlayer!.openAudioSession();
    _isPlayerInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    u = widget.update;
    double space = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        children: <Widget>[
          SizedBox(
              height: 100 / 3,
              width: space / 5,
              child: ElevatedButton.icon(onPressed: () {_play();}, icon: Icon(Icons.play_arrow_rounded), label: Text(''),)),
          SizedBox(
              height: 100 / 3,
              width: space / 5,
              child: ElevatedButton.icon(onPressed: () {_pause();}, icon: Icon(Icons.pause), label: Text(''),)
          ),
          SizedBox(
              height: 100 / 3,
              width: space / 5,
              child: ElevatedButton.icon(onPressed: () {_delete(); setState(() {});}, icon: Icon(Icons.delete), label: Text(''),)
          ),
        ],
      ),
    );
  }

  _play() async{
    if (!_isPlayerInitialized) return;
    if (audioPlayer?.isPaused == true){
      audioPlayer!.resumePlayer();
    }
    else{
      await audioPlayer!.startPlayer(
        fromURI: recording,
      );
    }
  }

  _pause() async{
    if (!_isPlayerInitialized) return;
    audioPlayer!.pausePlayer();
  }

  _delete() async{
    saves.remove(recording);
    u();

  }
}