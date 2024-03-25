import 'package:flutter/material.dart';
import 'package:lifecycle_of_stateful_widget/pages/home_page.dart';
import 'package:lifecycle_of_stateful_widget/pages/learn_scrolling.dart';
import 'package:lifecycle_of_stateful_widget/pages/uzum_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const UzumPage(),
    );
  }

}


