import 'package:bmi_calculator/constants/constant.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult =0;
  String _textResult="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text("Enter Height in (cms) and Weight in (kgs)"  ,style: TextStyle(fontSize: 15, color:accentHexColor),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Container(
                   width: 130,
                   child: TextField(
                     controller: _heightController,
                     style: TextStyle(fontSize: 42, fontWeight: FontWeight.w300,color: accentHexColor),
                     keyboardType: TextInputType.number,
                     decoration: InputDecoration(
                       border:  InputBorder.none,
                       hintText: "Height",
                       hintStyle: TextStyle(
                         fontSize: 42,
                         fontWeight: FontWeight.w300,
                         color: Colors.white.withOpacity(0.8)
                       )

                     ),
                   ),

                 ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w300,color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border:  InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8)
                        )

                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState((){
                  _bmiResult = _w / (_h * _h);
                  if(_bmiResult > 25){
                    _textResult = "You\'re Over Weight";
                  }
                 else if(_bmiResult >=18.5 && _bmiResult <= 25){
                    _textResult = "You Have Normal Weight";
                  }
                 else{
                   _textResult = "You Are Under Weight";
    }
                  }
     );
              },
                child: Container(child: Text("Calculate", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color:accentHexColor),),)),
            SizedBox(height: 30,),
            Container(child: Text(_bmiResult.toStringAsFixed(2), style: TextStyle(fontSize: 90, color:accentHexColor),),),
            SizedBox(height: 30,),
            Visibility(
              visible : _textResult.isNotEmpty,
              child: Container(child: Text(_textResult, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400 ,color:accentHexColor),),),),
            SizedBox(height: 10,),
            LeftBar(barWidth: 20,),
            SizedBox(height: 10,),
            LeftBar(barWidth: 70,),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40,),
            SizedBox(height: 10,),
           RightBar(barWidth: 20,),
            SizedBox(height: 10,),
            RightBar(barWidth: 70,),
            SizedBox(height: 10,),
            RightBar(barWidth: 40,)



          ],

        ),
      ),
    );
  }
}
