

import 'package:flutter/material.dart';
import 'package:tasks_projet_innovation_front/ui/home_page.dart';
import 'package:tasks_projet_innovation_front/ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.light,
      
      home:  HomePage()
    );
  }
}
 
