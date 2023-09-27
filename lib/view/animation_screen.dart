import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view/login.dart';

import '../models/Profile_Model/profile_model.dart';
import '../view_models/controller/Profile_Controller/profile_controller.dart';
import 'Drawer/drawer.dart';
import 'drawerscreen/aboutus.dart';
import 'drawerscreen/addreview.dart';
import 'drawerscreen/clientsays.dart';
import 'drawerscreen/contactus.dart';
import 'drawerscreen/followus.dart';
import 'drawerscreen/gps.dart';
import 'drawerscreen/location.dart';
import 'drawerscreen/myorder.dart';
import 'drawerscreen/photogallery.dart';

RxString iconcount = ''.obs;

String? usernamesp;
String? userEmailsp;
String? passwordsp;

class Animations extends StatefulWidget {
  const Animations({super.key});

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late Timer _timer;
  bool _showFirstImage = true;

  late Timer _timer1;
  bool _showFirstImage1 = true;

  late Timer _timer2;
  bool _showFirstImage2 = true;

  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    usernamesp = prefs.getString('user_nicename') ??
        ''; // Returns the token or an empty string if it doesn't exist.
    passwordsp = prefs.getString('userPassword') ?? '';
    userEmailsp = prefs.getString('user_email') ?? '';
    print(userEmailsp);
    print(usernamesp);
    print(passwordsp);
    fetchCartItemCount();
    profile_controller.Profile_apihit();
  }

  Profile_controller profile_controller = Get.put(Profile_controller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();

    _timer = Timer.periodic(Duration(seconds: 4), (Timer t) {
      setState(() {
        _showFirstImage = !_showFirstImage;
      });
    });

    _timer1 = Timer.periodic(Duration(seconds: 6), (Timer t) {
      setState(() {
        _showFirstImage1 = !_showFirstImage1;
      });
    });

    _timer2 = Timer.periodic(Duration(seconds: 8), (Timer t) {
      setState(() {
        _showFirstImage2 = !_showFirstImage2;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the first timer
    _timer1.cancel(); // Cancel the second timer
    _timer2.cancel(); // Cancel the third timer
    super.dispose();
  }

  List<String> imagess = [
    "assets/applogo/khana.png",
    "assets/applogo/khanaa.png",
    "assets/applogo/two.png",
    "assets/applogo/twoo.png",
    "assets/applogo/animation.png",
    "assets/applogo/animationn.png"
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              child: Image.asset(
                "assets/images/animation.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Align(alignment:Alignment.topRight ,
            child:GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              child: Image.asset("assets/images/drawer.png"),
            )
            ),
            Positioned(
              left: 5,
              child: Container(
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: Get.height * 0.01),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => TabScreen(index: 0));
                      },
                      child: Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.2,
                        // color: Colors.redAccent,
                        child: Column(children: [
                          Image.asset(
                            "assets/applogo/homei.png",
                            height: 25,
                          ),
                          Text(
                            "Home",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily),
                          )
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => TabScreen(index: 1));
                      },
                      child: Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.2,
                        // color: Colors.redAccent,
                        child: Column(children: [
                          Image.asset(
                            "assets/applogo/menui.png",
                            height: 25,
                          ),
                          Text(
                            "Menu",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily),
                          )
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => TabScreen(index: 2));
                      },
                      child: Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.2,
                        //  color: Colors.redAccent,
                        child: Column(children: [
                          Image.asset(
                            "assets/applogo/onlinei.png",
                            height: 25,
                          ),
                          Text(
                            "Online Order",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily),
                          )
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => TabScreen(index: 3));
                      },
                      child: Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.2,
                        //  color: Colors.redAccent,
                        child: Column(children: [
                          Image.asset(
                            "assets/applogo/booki.png",
                            height: 25,
                          ),
                          Text(
                            "Book A Table",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily),
                          )
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => TabScreen(index: 4));
                      },
                      child: Container(
                        height: Get.height * 0.06,
                        width: Get.width * 0.2,
                        // color: Colors.redAccent,
                        child: Column(children: [
                          Image.asset(
                            "assets/applogo/profilei.png",
                            height: 25,
                          ),
                          Text(
                            "Profile",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily),
                          )
                        ]),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01),
                  ],
                ),
              ),
            ),
            Positioned(
              top: Get.height*0.25,  // 220,
              left: Get.width*0.25,
              child: CircleAvatar(
                radius: Get.height * 0.088,
                backgroundColor: Color(0xff911FDA),
                child: AnimatedCrossFade(
                  duration: Duration(seconds: 3),
                  firstChild: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Get.height * 0.0825,
                    backgroundImage: AssetImage(imagess[0]),
                  ),
                  secondChild: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Get.height * 0.0825,
                    backgroundImage: AssetImage(imagess[1]),
                  ),
                  crossFadeState: _showFirstImage
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ),
            Positioned(
              top:Get.height*0.45,
              left:Get.width* 0.250,
              child: CircleAvatar(
                backgroundColor: Color(0xff911FDA),
                radius: Get.height * 0.12,
                child: AnimatedCrossFade(
                  duration: Duration(seconds: 3),
                  firstChild: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Get.height * 0.115,
                    backgroundImage: AssetImage(imagess[2]),
                  ),
                  secondChild: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Get.height * 0.115,
                    backgroundImage: AssetImage(imagess[3]),
                  ),
                  crossFadeState: _showFirstImage1
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ),
            Positioned(
              top:Get.height*0.710,
              left: Get.width*0.275,
              child: CircleAvatar(
                radius: Get.height * 0.082,
                // backgroundColor: Colors.white,
                backgroundColor: Color(0xff911FDA),
                child: AnimatedCrossFade(
                  duration: Duration(seconds: 3),
                  firstChild: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Get.height * 0.078,
                    backgroundImage: AssetImage(imagess[4]),
                  ),
                  secondChild: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: Get.height * 0.078,
                    backgroundImage: AssetImage(imagess[5]),
                  ),
                  crossFadeState: _showFirstImage2
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Container(
        width: 240,
        height: 830,
        child:
        Drawer(
            backgroundColor: Colors.white,
            child:
            DrawerClass(),
        ),
      ),
    );
  }
}


//clear the shareprefesh
Future<void> clearSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  print('data clearrrerererererererererre');
}



// icon k uper jo count h vo api

Future<void> fetchCartItemCount() async {
  print(
      "iconnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
  print(userEmailsp);
  print(passwordsp);
  String username = userEmailsp.toString();
  String password = passwordsp.toString();
  String basicAuth =
      'Basic ' + base64.encode(utf8.encode('$username:$password'));

  final url = Uri.parse(
      'https://www.the29029restaurant.com/wp-json/cocart/v2/cart/items/count');
  final headers = {
    'Authorization': basicAuth,
    // 'Cookie': 'your_cookie_values_here',
  };
  print('test 1');
  try {
    final response = await http.get(url, headers: headers);
    print('test2');
    if (response.statusCode == 200) {
      print(response.body);
      var x = jsonDecode(response.body);
      print('noti count is $x');

      iconcount.value = x.toString();
      print(iconcount.value);
      print(x);
      print(x.runtimeType);
      print('test3');
    } else {
      print(response.statusCode);
    }
  } catch (error) {
    print('ererererererereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    // setState(() {
    //   itemCount = 'Error: $error';
    // });
  }
}
