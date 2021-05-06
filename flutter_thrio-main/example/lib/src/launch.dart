import 'package:flutter/material.dart';
import 'package:thrio/thrio.dart';
import 'package:thrio_example/src/biz2/flutter2/flutter2_page.dart';
// import 'home.dart';

class LaunchPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LaunchPageState();
}

class _LaunchPageState extends State{

  @override
  void initState() {     
    super.initState();
    startHome();
  }

  @override
  Widget build(BuildContext context) {

    //获取屏幕宽高
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Image.asset("assets/images/launch_image.jpg", width: double.infinity, height: double.infinity, fit: BoxFit.fill),        
      )     
    );
  }

  void startHome() async {
    await Future.delayed(const Duration(microseconds: 2000), (){
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => Flutter2Page()),
      );
    });
  }
}