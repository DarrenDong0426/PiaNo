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
<<<<<<< HEAD
        backgroundColor: Colors.transparent,
        body: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(

              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Image.asset('assets/piano.jpg'),
                SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/logo.png')
                ),
                SizedBox(width: 150, height: 50),
                //TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Freestyle()),);} , child: const Text('Freestyle')),
                //TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Recordings()),);} , child: const Text('Recordings')),
                //TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Learn()),);} , child: const Text('Learn')),
                //TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Test()),);}, child: const Text('Test')),
                SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      child: Text('Freestyle'),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Freestyle()),);},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff84C318),
                          minimumSize: Size(100, 40),
                          //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 20,
                          )),
                    )),
                SizedBox(height: 15),
                SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      child: Text('Recordings'),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Recordings()),);},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff84C318),
                          minimumSize: Size(100, 40),
                          //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 20,
                          )),
                    )),
                SizedBox(height: 15),
                SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      child: Text('Learn'),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Learn()),);},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff84C318),
                          minimumSize: Size(100, 40),
                          //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 20,
                          )),
                    )),
                SizedBox(height: 15),
                SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      child: Text('Test'),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Test()),);},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff84C318),
                          minimumSize: Size(100, 40),
                          //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 20,
                          )),
                    )),
              ],
            )
        )
=======
      backgroundColor: Colors.transparent,
      body: Container(
          color: Colors.white,
      alignment: Alignment.center,
      child: Column(

        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Image.asset('assets/piano.jpg'),
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset('assets/logo.png')
          ),
          SizedBox(width: 150, height: 50),
          //TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Freestyle()),);} , child: const Text('Freestyle')),
          //TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Recordings()),);} , child: const Text('Recordings')),
          //TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Learn()),);} , child: const Text('Learn')),
          //TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Test()),);}, child: const Text('Test')),
          SizedBox(
            width: 150,
          height: 50,
          child: ElevatedButton(
            child: Text('Freestyle'),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Freestyle()),);},
            style: ElevatedButton.styleFrom(
                primary: Color(0xff84C318),
                minimumSize: Size(100, 40),
                //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(
                    fontSize: 20,
                    )),
          )),
          SizedBox(height: 15),
          SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: Text('Recordings'),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Recordings()),);},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff84C318),
                    minimumSize: Size(100, 40),
                    //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 20,
                    )),
              )),
          SizedBox(height: 15),
          SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: Text('Learn'),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Learn()),);},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff84C318),
                    minimumSize: Size(100, 40),
                    //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 20,
                    )),
              )),
          SizedBox(height: 15),
          SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: Text('Test'),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Test()),);},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff84C318),
                    minimumSize: Size(100, 40),
                    //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(
                      fontSize: 20,
                    )),
              )),
        ],
      )
      )
>>>>>>> e7c962872cf844ab3b19dc73dcab3c39b698c11b
    );
  }
}