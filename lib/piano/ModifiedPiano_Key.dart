import 'package:flutter/material.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:piano/Screens/learn.dart';

enum KeyColor { WHITE, BLACK }

class ModifiedPianoKey extends StatelessWidget {
  final ValueChanged<String> update;
  final KeyColor color;
  final double width;
  final int midiNote;
  final String note;
  final FlutterMidi flutterMidi;

  const ModifiedPianoKey.white({
    required this.width,
    required this.midiNote,
    required this.flutterMidi,
    required this.note, required this.update
  }) : this.color = KeyColor.WHITE;

  const ModifiedPianoKey.black({
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
    if (color == KeyColor.BLACK){
      if (note.substring(0, 2) == Learn.note || note.substring(3) == Learn.note){
        update('Correct');
      }
      else{
        update('Incorrect');
      }
    }
    else {
      if (Learn.note == note){
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
          child: Text(note, style: TextStyle(fontSize: 18, color: color == KeyColor.WHITE ? Colors.black : Colors.white,))
        ),
      ),
    );
  }

}