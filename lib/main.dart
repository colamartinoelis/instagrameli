import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:instagrameli/Screen/Home.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new Home(),
    );
  }
}

