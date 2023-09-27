import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the29029restaurant/view/animation_screen.dart';
import 'package:the29029restaurant/view/welcome.dart';

import '../view_models/controller/login/login_view_controller.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  Timer? _timer; // Store the Timer reference
  var x;
  @override
  void initState() {
    getToken();
    print('printingggggxxxxxxxxxxxxxxxxxxxxxxxxxx');
    print(x);



    _timer = Timer(Duration(milliseconds: 3000), () {
      x == '' ?Get.to(Welcome()) : Get.to(Animations()) ;
    });
    super.initState();

  }

  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    x= await prefs.getString('user_id') ?? '';  // Returns the token or an empty string if it doesn't exist.
  }

  @override
  void dispose() {
    // Cancel the timer to prevent memory leaks
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        child: Image.asset("assets/images/Splash.jpg", fit: BoxFit.fill),
      ),
    );
  }
}
