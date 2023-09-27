import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view_models/controller/single/single_controller.dart';

import '../../../../view_models/controller/Menu_Controller/restaurant_controller/singleitemfromrestaurantmenu_controller.dart';

class Singleitemfromresturantmenu extends StatefulWidget {
  const Singleitemfromresturantmenu({super.key});

  @override
  State<Singleitemfromresturantmenu> createState() => _SingleitemfromresturantmenuState();
}

class _SingleitemfromresturantmenuState extends State<Singleitemfromresturantmenu> {
  Singlerestaurant_controller singlerestaurant_controller = Get.put(Singlerestaurant_controller());

  @override
  void initState() {
    singlerestaurant_controller.singleapi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      switch (
      singlerestaurant_controller.rxRequestStatus.value) {
        case Status.LOADING:
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        case Status.ERROR:
          if (singlerestaurant_controller.error.value == 'No internet') {
            return  Scaffold(body: Center(child:InterNetExceptionWidget(
              onPress: () {},
            ) ),);
          } else {
            return Scaffold(body: Center(child:GeneralExceptionWidget(onPress: () {}) ),);
          }
        case Status.COMPLETED:
          return
            Scaffold(
            backgroundColor: Color(0xffFFFFFF),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                  // Get.to(() => TakeAwayMenu());
                },
                child: Image.asset("assets/images/backbutton.png"),
              ),
              title: Text("Take Away Menu",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
              centerTitle: true,
            ),
            body: SafeArea(
                child: Center(
              child:
      singlerestaurant_controller.userList.value
          .singleProduct!.isEmpty ?  Text('No Item',style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontSize: 20,fontWeight: FontWeight.w700,
      ),)  :

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.05),
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (Context)=>LocationUi()));
                      },
                      child: Container(
                          height: height * 0.6,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xffF5F5F5)),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: height / 30,
                              ),
                              Container(
                                  height: height * 0.3,
                                  width: width * 0.6,
                                  // color: Colors.red,
                                  child:
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/plateblanck.png",
                                        height: 200,
                                        width: 200,
                                      ),
                                      CircleAvatar(
                                          radius: 80,
                                          backgroundImage: NetworkImage(
                                            singlerestaurant_controller.userList.value
                                                .singleProduct![0].productImg
                                                .toString(),
                                          )),
                                    ],
                                  ),

                                  // Image.network(
                                  //   singlerestaurant_controller.userList.value
                                  //       .singleProduct![0].productImg
                                  //       .toString(),
                                  // )


                              ),
                              SizedBox(height: height * 0.02),
                              Padding(
                                padding: EdgeInsets.only(right: 30, left: 30),
                                child: Text(
                                  singlerestaurant_controller.userList.value
                                      .singleProduct![0].menuTitle
                                      .toString(),
                                  //"Piyaza Chicken",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Padding(
                                padding: EdgeInsets.only(right: 30, left: 30),
                                child: Text(
                                  singlerestaurant_controller.userList.value
                                      .singleProduct![0].menuDiscription
                                      .toString(),
                                  //"Strips of Corn Fed Chicken breast cooked\nin a j
                                  // alifrasiee style sauce with onion and\ngreen chilies,acco
                                  // mpanied with light\nherbed rice.",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Color(0xff9796A1), fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(height: height * 0.03),
                              if (singlerestaurant_controller.userList.value
                                      .singleProduct![0].productPrice !=
                                  "")
                                RichText(
                                    text: TextSpan(children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 2),
                                      child: Text(
                                        "£ ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontSize: 14,
                                                color: Color(0xff911FDA),
                                                fontFamily: GoogleFonts.mulish()
                                                    .fontFamily,
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                      text: singlerestaurant_controller.userList.value
                                          .singleProduct![0].productPrice
                                          .toString(),
                                      //"11.55",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(
                                              fontSize: 20,
                                              color: Color(0xff911FDA),
                                              fontFamily: GoogleFonts.outfit()
                                                  .fontFamily,
                                              fontWeight: FontWeight.w700))
                                ])),
                              // Text(
                              //   single_controller.userList.value
                              //       .singleProduct![0].productPrice
                              //       .toString(),
                              //   textAlign: TextAlign.center,
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .displayLarge
                              //       ?.copyWith(
                              //           color: Color(0xff911FDA),
                              //           fontSize: 22,
                              //           fontWeight: FontWeight.w700),
                              // ),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            )),
          );
      }
    });
  }
}
