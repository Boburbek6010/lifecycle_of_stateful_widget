import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void onTap()async{
    x = -1;
    y = -0.5;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 300));
    x = -1;
    y = 0.25;
    setState(() {});
  }


  double x = -1;
  double y = 0.25;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/img.png")
          )
        ),
        child: InkWell(
          onTap: onTap,
          child: Align(
            alignment: Alignment(x, y),
            child: Image.asset(
              height: 190,
              width: 150,
              "assets/images/person_running.gif",
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
    );
  }
}
