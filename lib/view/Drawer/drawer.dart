import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/Profile_Model/profile_model.dart';
import '../animation_screen.dart';
import '../drawerscreen/aboutus.dart';
import '../drawerscreen/addreview.dart';
import '../drawerscreen/clientsays.dart';
import '../drawerscreen/contactus.dart';
import '../drawerscreen/followus.dart';
import '../drawerscreen/gps.dart';
import '../drawerscreen/location.dart';
import '../drawerscreen/myorder.dart';
import '../drawerscreen/photogallery.dart';
import '../login.dart';
class DrawerClass extends StatefulWidget {
  const DrawerClass({super.key});

  @override
  State<DrawerClass> createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  File imgFile = File("");
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Column(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20),
                    child:
                    Align(
                      alignment: Alignment.topRight,
                      child:
                      InkWell(
                        onTap: () {
                          Get.back();
                        }, child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(20.0),
                        child: Image.asset(
                            'assets/drawericon/cross.png',
                            width: width * 0.04,
                            height: height * 0.04),
                      ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius:30,
                    child:
                    ClipOval(
                      child:
                      !(imgFile.path == '') ?
                      Image.file(
                        imgFile, height: 100, width: 55,
                        fit: BoxFit.cover,)
                          :
                      Image.asset("assets/images/user.png",height: 100,width:60,fit: BoxFit.cover,),
                    ),
                  ),

                  // CircleAvatar(
                  //   radius: 30,
                  //   backgroundImage:
                  //   AssetImage("assets/drawericon/image.png"),
                  // ),

                  Obx(
                        () => Text(
                      !(userNameFromProfileApihome == null)
                          ? userNameFromProfileApihome!.value
                          : '',
                      // userNameFromProfileApihome!.value ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: GoogleFonts.outfit()
                              .fontFamily),
                    ),
                  ),
                  Text(
                    userEmailsp ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: Color(0xff9EA1B1)),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              horizontalTitleGap: 0,
              leading:
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child:
                Image.asset(
                    'assets/drawericon/aboutus.png',
                    width: width * 0.07,
                    height: height * 0.07),
              ),
              title: Text("About Us",
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Get.to(() => AboutUS());
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              horizontalTitleGap: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                    'assets/drawericon/photogallery.png',
                    width: width * 0.07,
                    height: height * 0.07),
              ),
              title: Text("Photo Gallery",
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Get.to(() => PhotoGallery());
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              horizontalTitleGap: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                    'assets/drawericon/followus.png',
                    width: width * 0.07,
                    height: height * 0.07),
              ),
              title: Text("Follow Us",
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Get.to(() => FollowUS());
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              horizontalTitleGap: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                    'assets/drawericon/clientsays.png',
                    width: width * 0.07,
                    height: height * 0.07),
              ),
              title: Text("Client say's",
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Get.to(() => ClientSays());
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              horizontalTitleGap: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                    'assets/drawericon/addreview.png',
                    width: width * 0.07,
                    height: height * 0.07),
              ),
              title: Text("Add Review",
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Get.to(() => AddReview());
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              horizontalTitleGap: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                    'assets/drawericon/contactus.png',
                    width: width * 0.07,
                    height: height * 0.07),
              ),
              title: Text("Contact Us",
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Get.to(() => contactus());
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              horizontalTitleGap: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                    'assets/drawericon/myorder.png',
                    width: width * 0.063,
                    height: height * 0.063),
              ),
              title: Text("My Order",
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Get.to(() => Myoder());
              },
            ),
            // ListTile(
            //   visualDensity: VisualDensity.compact,
            //   dense: true,
            //   horizontalTitleGap: 0,
            //   leading: ClipRRect(
            //     borderRadius: BorderRadius.circular(20.0),
            //     child: Image.asset('assets/drawericon/loyalty.png',
            //         width: width * 0.07, height: height * 0.07),
            //   ),
            //   title: Text("Loyalty",
            //       style: Theme.of(context).textTheme.bodyLarge),
            //   onTap: () {
            //     Get.to(() => Loyalty());
            //   },
            // ),
            // ListTile(
            //   visualDensity: VisualDensity.compact,
            //   dense: true,
            //   horizontalTitleGap: 0,
            //   leading: ClipRRect(
            //     borderRadius: BorderRadius.circular(20.0),
            //     child: Image.asset('assets/drawericon/fanwall.png',
            //         width: width * 0.07, height: height * 0.07),
            //   ),
            //   title: Text("Fan Wall",
            //       style: Theme.of(context).textTheme.bodyLarge),
            //   onTap: () {
            //     Get.to(() => FanWall());
            //   },
            // ),
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              horizontalTitleGap: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                    'assets/drawericon/location.png',
                    width: width * 0.07,
                    height: height * 0.07),
              ),
              title: Text("Location",
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Get.to(() => Location());
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              dense: true,
              horizontalTitleGap: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/drawericon/gps.png',
                    width: width * 0.07, height: height * 0.07),
              ),
              title: Text("GPS Coupon",
                  style: Theme.of(context).textTheme.bodyLarge),
              onTap: () {
                Get.to(() => GPS());
              },
            ),
            // Spacer()
            SizedBox(height: height * 0.01)
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () async {
                await clearSharedPreferences();
                Get.offAll(() => LoginPage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff41004C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fixedSize: Size(120, 43),
              ),
              child: Wrap(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: Image.asset(
                          "assets/drawericon/logout.png")),
                  Text(
                    " Log Out",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily:
                        GoogleFonts.outfit().fontFamily),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
