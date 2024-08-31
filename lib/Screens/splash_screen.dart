import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_internships/Screens/home_screen.dart';
import 'package:search_internships/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeScreen()))
    );
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: Text('InternShala', style: appLargeTextStyle,),
      ),
    );
  }
}
