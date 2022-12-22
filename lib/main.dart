import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        fontFamily: 'Fredoka',
        appBarTheme: AppBarTheme(
            // titleTextStyle: TextStyle(
            // fontFamily: 'Lato',
            // fontSize: 20,
            // ),
            ),
        errorColor: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
