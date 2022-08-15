import 'package:bmi_calculator/constants/homescreen.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI CALCULATOR",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
