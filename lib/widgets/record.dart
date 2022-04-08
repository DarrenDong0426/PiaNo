import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

List saves = [];
final recorder = SoundRecorder();

class Record extends StatefulWidget {
  const Record({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _RecordState();
}

class _RecordState extends State<Record>{
  final recorder = SoundRecorder();

  @override
  void initState() {
    super.initState();

    recorder.init();
  }

  @override
  void dispose() {
    recorder.dispose();

    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    final isRecording = recorder.isRecording;
    final icon = isRecording ? Icons.stop : Icons.mic;
    final text = isRecording ? 'Stop' : 'Start';
    final primary = isRecording ? Colors.red : Colors.white;
    final onPrimary = isRecording ? Colors.white : Colors.black;
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(175, 50),
                primary: primary,
                onPrimary: onPrimary,
              ),
              icon: Icon(icon), label: Text(text), onPressed: () async{
              final isRecording = await recorder.toggleRecording();
              setState(() {});
            },)
          ]
      ),
    );
  }
}


class SoundRecorder{
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialized = false;

  bool get isRecording => _audioRecorder!.isRecording;

  Future init() async{
    _audioRecorder = FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission');
    }

    await _audioRecorder!.openAudioSession();
    _isRecorderInitialized = true;
  }

  void dispose(){
    if (!_isRecorderInitialized) return;

    _audioRecorder!.closeAudioSession();
    _audioRecorder = null;
    _isRecorderInitialized = false;
  }
  

  Future _record() async{
    if (!_isRecorderInitialized) return;
    String filePath = DateTime.now().microsecondsSinceEpoch.toString() + '.aac';
    saves.add(filePath);
    await _audioRecorder!.startRecorder(toFile: filePath);
  }

  Future _stop() async{
    if (!_isRecorderInitialized) return;

    await _audioRecorder!.stopRecorder();
  }
  
  

  Future toggleRecording() async {
    if (_audioRecorder!.isStopped){
      await _record();
    }
    else{
      await _stop();

    }
  }

}