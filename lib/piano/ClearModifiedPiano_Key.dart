import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:piano/Screens/test.dart';

enum KeyColor { WHITE, BLACK }

class ClearModifiedPianoKey extends StatelessWidget {
  final ValueChanged<String> update;
  final KeyColor color;
  final double width;
  final int midiNote;
  final String note;
  final FlutterMidi flutterMidi;

  const ClearModifiedPianoKey.white({
    required this.width,
    required this.midiNote,
    required this.flutterMidi,
    required this.note, required this.update
  }) : this.color = KeyColor.WHITE;

  const ClearModifiedPianoKey.black({
    required this.width,
    required this.midiNote,
    required this.flutterMidi,
    required this.note, required this.update
  }) : this.color = KeyColor.BLACK;

  /// Send a NOTE ON message
  playNote() {
    flutterMidi.playMidiNote(midi: midiNote);
  }


  /// Send a NOTE OFF message
  stopNote() {
    flutterMidi.stopMidiNote(midi: midiNote);
    debugPrint(Test.note + "==?" + note);
    if (color == KeyColor.BLACK){
      if (note.substring(0, 2) == Test.note || note.substring(3) == Test.note){
        update('Correct');
      }
      else{
        update('Incorrect');
      }
    }
    else {
      if (Test.note == note){
        update('Correct');
      }
      else {
        update('Incorrect');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => playNote(),
      onTapUp: (_) => stopNote(),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: color == KeyColor.WHITE ? Colors.white : Colors.black,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        child: Center(
            child: Text("", style: TextStyle(fontSize: 18, color: color == KeyColor.WHITE ? Colors.black : Colors.white,))
        ),
      ),
    );
  }

}