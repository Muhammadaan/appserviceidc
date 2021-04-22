import 'package:flutter/material.dart';
import 'package:tokokita/utils/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins-Regular',
      ),
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: '/',
    );
  }
}
