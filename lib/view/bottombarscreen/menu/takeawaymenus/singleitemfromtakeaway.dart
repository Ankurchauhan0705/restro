import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view_models/controller/single/single_controller.dart';

class Singleitemfromtakeaway extends StatefulWidget {
  const Singleitemfromtakeaway({super.key});

  @override
  State<Singleitemfromtakeaway> createState() => _SingleitemfromtakeawayState();
}

class _SingleitemfromtakeawayState extends State<Singleitemfromtakeaway> {
  Single_controller single_controller = Get.put(Single_controller());

  @override
  void initState() {
    single_controller.singleapi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      switch (single_controller.rxRequestStatus.value) {
        case Status.LOADING:
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        case Status.ERROR:
          if (single_controller.error.value == 'No internet') {
            return InterNetExceptionWidget(
              onPress: () {},
            );
          } else {
            return GeneralExceptionWidget(onPress: () {});
          }
        case Status.COMPLETED:
          return Scaffold(
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
              child: Column(
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
                                  child: Image.network(
                                    single_controller.userList.value
                                        .singleProduct![0].productImg
                                        .toString(),
                                  )),
                              SizedBox(height: height * 0.03),
                              Padding(
                                padding: EdgeInsets.only(right: 30, left: 30),
                                child: Text(
                                  single_controller.userList.value
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
                                  single_controller.userList.value
                                      .singleProduct![0].menuDiscription
                                      .toString(),

                                  //"Strips of Corn Fed Chicken breast cooked\nin a jalifrasiee style sauce with onion and\ngreen chilies,accompanied with light\nherbed rice.",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: Color(0xff9796A1),
                                          fontWeight: FontWeight.w300),
                                ),
                              ),
                              SizedBox(height: height * 0.03),
                              if (single_controller.userList.value
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
                                      text: single_controller.userList.value
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
