import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/categories.dart';
import 'package:the29029restaurant/view/bottombarscreen/profile/profile.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/profile_controller.dart';
import 'package:the29029restaurant/view_models/controller/home_page/home_page_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';
import '../../../view_models/controller/Search_Controller/search_controller.dart';
import '../../../view_models/controller/menu_page_controller.dart';
import '../../Drawer/drawer.dart';
import '../../Search_Screen/searching.dart';
import 'package:get/get.dart';
import '../menu/menu.dart';
import '../menu/occasionmenus/occasionmenu.dart';
import '../menu/restaurantmenu1/buttonscreen.dart';
import '../menu/takeawaymenus/takeawaymenus.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/ourpartymenu/partymenu.dart' as pm;

bool show = true;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //home api
  Home_controller home_controller = Get.put(Home_controller());
  // searching api
  Searching_controller searching_controller = Get.put(Searching_controller());
  // profile page
  Profile_controller profile_controller = Get.put(Profile_controller());

  final FocusNode _focusNode = FocusNode();
  Menu_Controller menu_Controller = Get.put(Menu_Controller());

  File imgFile = File("");

  @override
  void initState() {
    isSearch.value = true;
    menu_Controller.menuapihit();
    // TODO: implement initState
    home_controller.homeapihit();
    profile_controller.Profile_apihit();
    super.initState();
  }

  Future<void> clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('data clearrrerererererererererre');
  }

  @override
  void dispose() {
    super.dispose();
    setState(() {
      show = false;
    });
  }

  RxBool isSearch = false.obs;

  void showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      switch (home_controller.rxRequestStatus.value) {
        case Status.LOADING:
          return const Scaffold(body: Center(child: CircularProgressIndicator()),);
        case Status.ERROR:
          if (home_controller.error.value == 'No internet') {
            return Scaffold(body: Center(child:InterNetExceptionWidget(
              onPress: () {},
            ) ),) ;
          } else {
            return Scaffold(body: Center(child:GeneralExceptionWidget(onPress: () {}) ),) ;
          }
        case Status.COMPLETED:
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Profile());
                    },
                    child:
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 25,
                      child:
                      ClipOval(
                        child:
                        !(imgFile.path == '') ?
                        Image.file(
                          imgFile, height: 100, width: 56,
                          fit: BoxFit.cover,)
                            :
                        Image.asset("assets/images/user.png",height: 100,width:55,fit: BoxFit.cover,),
                      ),
                    )
                  ),
                ],
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return
                    GestureDetector (
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                      MaterialLocalizations.of(context).openAppDrawerTooltip;
                    },
                    child: Image.asset("assets/images/drawer.png"),
                  );
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.001,),
                        Text("What would you like \n to order",
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.outfit().fontFamily),
                        ),
                        SizedBox(height: height * 0.03),
                        TextFormField(
                          onFieldSubmitted: (x) async {
                            Get.to(() => Searching(x: x));
                          },
                          onTap: () {},
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search_sharp,
                                color: Color(0xff911FDA),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Find for food or restaurant...",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: Color(0xff9796A1),
                                    fontWeight: FontWeight.w300,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                  ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffDCDCDC))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffDCDCDC))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffDCDCDC)))),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        SizedBox(height: height * 0.03),
                        Text("Restaurant Offers",style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.outfit().fontFamily),),
                        CarouselSlider(
                          items: [
                            Container(
                              width: width,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(home_controller
                                      .userList
                                      .value
                                      .bannerSection![0]
                                      .bannerBackgroundImage
                                      .toString()),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              child: Row(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width * 0.4,
                                      height: height * 0.2,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.network(
                                            home_controller.userList.value
                                                .bannerSection![0].bannerImage
                                                .toString(),
                                            height: height * 0.5),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: height * 0.03),
                                        Text(
                                          home_controller.userList.value
                                              .bannerSection![0].bannerTitle
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily:
                                                      GoogleFonts.outfit()
                                                          .fontFamily),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Text(
                                          home_controller.userList.value
                                              .bannerSection![0].bannerSubTitle
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      GoogleFonts.outfit()
                                                          .fontFamily),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: MyButton(
                                                side: BorderSide(
                                                    color: Color(0xff911FDA)),
                                                title: home_controller
                                                    .userList
                                                    .value
                                                    .bannerSection![0]
                                                    .bannerButtonText
                                                    .toString(),
                                                onTap: () {
                                                  Get.to(() => Categories());
                                                },
                                                height: height * 0.05,
                                                width: width * 0.3,
                                                bgColor: Color(0xff911FDA),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: height * 0.1,
                                ),
                              ]),
                            ),
                          ],
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.99,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "Restaurant Main Menu",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: GoogleFonts.outfit().fontFamily),
                        ),
                        SizedBox(height: height * 0.02),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            child: Row(
                              children: [
                                for (int i = 0;
                                    i <
                                        home_controller.userList.value
                                            .restaurantMainMenu!.length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 6.5, left: 6.5),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          menucategoryid = menu_Controller
                                              .userList
                                              .value
                                              .categoryMainMenu![0]
                                              .categoryId
                                              .toString();
                                          menuslug = menu_Controller
                                              .userList
                                              .value
                                              .categoryMainMenu![0]
                                              .categorySlug
                                              .toString();
                                        });
                                        if (home_controller
                                                .userList
                                                .value
                                                .restaurantMainMenu![i]
                                                .categoryName
                                                .toString() ==
                                            'Main Menu') {
                                          Get.to(restaurantmenu());
                                        }
                                        if (home_controller
                                                .userList
                                                .value
                                                .restaurantMainMenu![i]
                                                .categoryName
                                                .toString() ==
                                            'Side Dishes') {
                                          Get.to(restaurantmenu(
                                            idx: 2,
                                          ));
                                        }
                                        if (home_controller
                                                .userList
                                                .value
                                                .restaurantMainMenu![i]
                                                .categoryName
                                                .toString() ==
                                            'Variety Foods') {
                                          Get.to(restaurantmenu(
                                            idx: 3,
                                          ));
                                        }
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 33,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  home_controller
                                                      .userList
                                                      .value
                                                      .restaurantMainMenu![i]
                                                      .categoryImg
                                                      .toString()),
                                              radius: 33,
                                              // radius:
                                            ),
                                          ),
                                          SizedBox(height: height * 0.02),
                                          Text(
                                            home_controller
                                                .userList
                                                .value
                                                .restaurantMainMenu![i]
                                                .categoryName
                                                .toString(),
                                            style:
                                                // Theme.of(context).textTheme.labelSmall?.copyWith(
                                                //   fontFamily: GoogleFonts.outfit().fontFamily,
                                                //   color: Color(0xff41004C),
                                                //   fontSize: 10,
                                                //   fontWeight: FontWeight.w400,
                                                // )

                                                TextStyle(
                                                    color: Color(0xff41004C),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        GoogleFonts.outfit()
                                                            .fontFamily),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                SizedBox(height: height * 0.03),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        Text(
                          "Food Menu",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        SizedBox(height: height * 0.02),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .6,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 270,
                          ),
                          itemCount: home_controller
                              .userList.value.categoryMainMenu!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  menucategoryid = menu_Controller.userList
                                      .value.categoryMainMenu![index].categoryId
                                      .toString();
                                  menuslug = menu_Controller.userList.value
                                      .categoryMainMenu![index].categorySlug
                                      .toString();
                                });
                                if (menu_Controller.userList.value
                                        .categoryMainMenu![index].categoryName
                                        .toString() ==
                                    "Party Menus") {
                                  print('party menuuu');
                                  Get.to(pm.PartyMenu());
                                  return;
                                }
                                if (menu_Controller.userList.value
                                        .categoryMainMenu![index].categoryName
                                        .toString() ==
                                    "Restaurant Menu") {
                                  print(index);
                                  print(
                                      'ggggggggggggggggggggggggggggggggggggggg menuuu');

                                  Get.to(restaurantmenu());
                                  return;
                                }
                                if (menu_Controller.userList.value
                                        .categoryMainMenu![index].categoryName
                                        .toString() ==
                                    "Take Away Menus") {
                                  Get.to(Takeawaysmenus());
                                }
                                if (menu_Controller.userList.value
                                        .categoryMainMenu![index].categoryName
                                        .toString() ==
                                    "Occasion Menus") {
                                  Get.to(Occasionmenu());
                                }
                              },
                              child: Container(
                                height: 100,
                                width: 235,
                                decoration: BoxDecoration(
                                    // color: Color(0xffF5F5F5),
                                  color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //SizedBox(height: 5),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(home_controller
                                                .userList
                                                .value
                                                .categoryMainMenu![index]
                                                .categoryImg
                                                .toString()
                                            //fit: BoxFit.fill,
                                            ),
                                      ),
                                      SizedBox(height: height * 0.01),
                                      Text(
                                        home_controller
                                            .userList
                                            .value
                                            .categoryMainMenu![index]
                                            .categoryName
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      SizedBox(height: height * 0.01),
                                      Text(
                                        home_controller
                                            .userList
                                            .value
                                            .categoryMainMenu![index]
                                            .categoryDescription
                                            .toString(),
                                        // style: Theme.of(context).textTheme.
                                        // labelSmall?.copyWith(
                                        //   color: Color(0xff9796A1),
                                        //  // fontFamily: GoogleFonts.outfit().fontFamily,
                                        //   fontWeight: FontWeight.w300
                                        // ),
                                        style: TextStyle(
                                            color: Color(0xff9796A1),
                                            fontSize: 10,
                                            fontFamily:
                                                GoogleFonts.outfit().fontFamily,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(height: height * 0.03),
                                      Text(
                                        "Go to Menu >",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff41004C),
                                                fontSize: 12,
                                                fontFamily: GoogleFonts.outfit()
                                                    .fontFamily),
                                      )
                                    ]),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: height * 0.05)
                      ],
                    ),
                  )),
            ),
            drawer: Container(
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
    });
  }
}
