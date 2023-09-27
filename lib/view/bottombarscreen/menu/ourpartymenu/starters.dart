import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/ourpartymenu/partymenu.dart';
import 'package:the29029restaurant/view_models/controller/starters/starters_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

class Starters extends StatefulWidget {
  const Starters({super.key});

  @override
  State<Starters> createState() => _StartersState();
}

class _StartersState extends State<Starters> {
  Starters_controller starters_controller = Get.put(Starters_controller());

  var choose = 1;

  @override
  void initState() {
    starters_controller.Startersapihit();
    super.initState();
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Obx(() {
      switch (starters_controller.rxRequestStatus.value) {
        case Status.LOADING:
          return  Scaffold(body:Container(width:Width,
              height: height,
              child: CircularProgressIndicator(),
              alignment: Alignment.center),);
        case Status.ERROR:
          if (starters_controller.error.value == 'No internet') {
            return InterNetExceptionWidget(
              onPress: () {},
            );
          } else {
            return GeneralExceptionWidget(onPress: () {});
          }
        case Status.COMPLETED:
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PartyMenu(),
                      ));
                },
                child: Image.asset("assets/images/backbutton.png"),
              ),
              title: Text("Starters",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyButton(
                                title: "Description",
                                txtStyle: TextStyle(
                                    color: choose == 1
                                        ? Colors.white
                                        : Color(0xff911FDA),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily),
                                onTap: () {
                                  choose = 1;
                                  setState(
                                    () {
                                      //click1 = !click1;
                                    },
                                  );
                                },
                                bgColor: choose == 1
                                    ? Color(0xff911FDA)
                                    : Colors.white,
                                side: BorderSide(color: Color(0xff911FDA)),
                                height: 35,
                                width: 110),
                            SizedBox(width: Width * 0.03),
                            MyButton(
                                title: "Comments",
                                txtStyle: TextStyle(
                                    color: choose == 2
                                        ? Colors.white
                                        : Color(0xff911FDA),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily),
                                onTap: () {
                                  choose = 2;
                                  setState(
                                    () {
                                      //click1 = !click1;
                                    },
                                  );
                                },
                                bgColor: choose == 2
                                    ? Color(0xff911FDA)
                                    : Colors.white,
                                side: BorderSide(color: Color(0xff911FDA)),
                                height: 35,
                                width: 110),
                          ],
                        ),
                        SizedBox(height: height * 0.03),
                        Container(
                          height: height,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: starters_controller
                                .userList.value.partyMainMenuDetails!.length,
                            //3,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xffF5F5F5),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: height * 0.02),
                                      ListTile(
                                        onTap: () {},
                                        //visualDensity:VisualDensity(vertical:height*0.001),
                                        title: Text(
                                          starters_controller
                                              .userList
                                              .value
                                              .partyMainMenuDetails![index]
                                              .menuTitle
                                              .toString(),
                                          //"Pot Roasted Lamb Katti:",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      GoogleFonts.outfit()
                                                          .fontFamily),
                                        ),

                                        subtitle: Text(
                                          starters_controller
                                              .userList
                                              .value
                                              .partyMainMenuDetails![index]
                                              .menuDiscription
                                              .toString(),
                                          //"Seasoned with mint,sweet chill,coriander and sesane",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xff9796A1),
                                                  fontFamily:
                                                      GoogleFonts.outfit()
                                                          .fontFamily),
                                        ),
                                      ),
                                      SizedBox(height: height * 0.02),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          );
      }
    });
  }
}
