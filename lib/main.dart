import 'package:flutter/material.dart';
import 'package:workshop_news/screens/home_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Start the app with the "/" named route. In our case, the app will start
      // on the FirstScreen Widget
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => HomeScreen(),
        // When we navigate to the "/second" route, build the SecondScreen Widget
//        '/second': (context) => SecondScreen(),
      },
    );
  }
}
