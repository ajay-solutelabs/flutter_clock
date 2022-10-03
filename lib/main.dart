import 'package:flutter/material.dart';
import 'package:flutter_clock/utils/theme.dart';

import 'screens/homeScreen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Analog Clock',
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}