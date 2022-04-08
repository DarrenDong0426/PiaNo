
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:piano/consts/notes.dart';
import 'package:piano/piano/piano_key.dart';

import 'ModifiedPiano_Key.dart';

class ModifiedPiano extends StatefulWidget {

  final void Function(String s) update;

  const ModifiedPiano({Key? key, required this.update}) : super(key: key);


  @override
  ModifiedPianoState createState() => ModifiedPianoState();
}

class ModifiedPianoState extends State<ModifiedPiano> {
  final octave = 3;
  final FlutterMidi flutterMidi = FlutterMidi();

  get octaveStartingNote => (octave * 12) % 128;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final whiteKeySize = constraints.maxWidth / 7;
        final blackKeySize = whiteKeySize / 2;
        return Stack(
          children: [
            _buildWhiteKeys(whiteKeySize, widget.update),
            _buildBlackKeys(constraints.maxHeight, blackKeySize, whiteKeySize, widget.update),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    setupMIDIPlugin();
    super.initState();
  }

  Future<void> setupMIDIPlugin() async {
    flutterMidi.unmute();
    ByteData _byte = await rootBundle.load("assets/Yamaha-Grand-Lite-v2.0.sf2");
    flutterMidi.prepare(sf2: _byte);
  }

  _buildWhiteKeys(double whiteKeySize, void Function(String s) update) {
    return Row(
      children: [
        ModifiedPianoKey.white(
            width: whiteKeySize,
            midiNote: octaveStartingNote,
            flutterMidi: flutterMidi, note: Notes.notes[0], update: update,),

        ModifiedPianoKey.white(
            width: whiteKeySize,
            midiNote: octaveStartingNote + 2,
            flutterMidi: flutterMidi, note: Notes.notes[1], update: update,),
        ModifiedPianoKey.white(
            width: whiteKeySize,
            midiNote: octaveStartingNote + 4,
            flutterMidi: flutterMidi, note: Notes.notes[2], update: update,),
        ModifiedPianoKey.white(
            width: whiteKeySize,
            midiNote: octaveStartingNote + 5,
            flutterMidi: flutterMidi, note: Notes.notes[3], update: update,),
        ModifiedPianoKey.white(
            width: whiteKeySize,
            midiNote: octaveStartingNote + 7,
            flutterMidi: flutterMidi, note: Notes.notes[4], update: update,),
        ModifiedPianoKey.white(
            width: whiteKeySize,
            midiNote: octaveStartingNote + 9,
            flutterMidi: flutterMidi, note: Notes.notes[5], update: update,),
        ModifiedPianoKey.white(
            width: whiteKeySize,
            midiNote: octaveStartingNote + 11,
            flutterMidi: flutterMidi, note: Notes.notes[6], update: update,),
      ],
    );
  }

  _buildBlackKeys(
      double pianoHeight, double blackKeySize, double whiteKeySize, void Function(String s) update) {
    return SizedBox(
      height: pianoHeight * 0.55,
      child: Row(
        children: [
          SizedBox(
            width: whiteKeySize - blackKeySize / 2,
          ),
          ModifiedPianoKey.black(
              width: blackKeySize,
              midiNote: octaveStartingNote + 1,
              flutterMidi: flutterMidi, note: Notes.notes[7] + ' ' + Notes.notes[12],update: update,),
          SizedBox(
            width: whiteKeySize - blackKeySize,
          ),
          ModifiedPianoKey.black(
              width: blackKeySize,
              midiNote: octaveStartingNote + 3,
              flutterMidi: flutterMidi, note: Notes.notes[8] + ' ' + Notes.notes[13],update: update,),
          SizedBox(
            width: whiteKeySize,
          ),
          SizedBox(
            width: whiteKeySize - blackKeySize,
          ),
          ModifiedPianoKey.black(
              width: blackKeySize,
              midiNote: octaveStartingNote + 6,
              flutterMidi: flutterMidi, note: Notes.notes[9] + ' ' + Notes.notes[14],update: update,),
          SizedBox(
            width: whiteKeySize - blackKeySize,
          ),
          ModifiedPianoKey.black(
              width: blackKeySize,
              midiNote: octaveStartingNote + 8,
              flutterMidi: flutterMidi, note: Notes.notes[10] + ' ' + Notes.notes[15],update: update,),
          SizedBox(
            width: whiteKeySize - blackKeySize,
          ),
          ModifiedPianoKey.black(
              width: blackKeySize,
              midiNote: octaveStartingNote + 10,
              flutterMidi: flutterMidi, note: Notes.notes[11] + ' ' + Notes.notes[16],update: update,),
        ],
      ),
    );
  }

  update() {}
}
