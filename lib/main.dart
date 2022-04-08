import 'package:flutter/material.dart';
import 'package:piano/Screens/freestyle.dart';
import 'package:piano/piano/piano.dart';

import 'Screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Menu());
  }
}
