import 'package:flutter/material.dart';
import 'package:tokokita/utils/router.dart';
import 'package:tokokita/utils/style.dart';

import 'service/app_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppService.configure(
      apiBaseURL: 'https://olla.idcore.id/apics', appTitle: 'olla');

  await AppService().init();

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
          appBarTheme: AppBarTheme(backgroundColor: mainColor)),
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: '/',
    );
  }
}
