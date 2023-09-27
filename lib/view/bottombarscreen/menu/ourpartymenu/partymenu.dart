import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/ourpartymenu/starters.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view_models/controller/partymenu/partymenu_controller.dart';

class PartyMenu extends StatefulWidget {
  const PartyMenu({super.key});

  @override
  State<PartyMenu> createState() => _PartyMenuState();
}

class _PartyMenuState extends State<PartyMenu> {
  PartMenu_controller partyMenuController = Get.put(PartMenu_controller());

  @override
  void initState() {
    partyMenuController.partymenueapihit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return
      Obx(
            () {
          switch (partyMenuController.rxRequestStatus.value) {
            case Status.LOADING:
              return
              Scaffold(body:Container(width: width,
                  height: height,
                   child:
                   CircularProgressIndicator(),
                  alignment: Alignment.center),);

            case Status.ERROR:
              if (partyMenuController.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return
                  Scaffold(

                  );

              }
            case Status.COMPLETED:
              return
                Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    leading: GestureDetector(
                      onTap: () {
                        Get.to(() => TabScreen(index: 1));
                      },
                      child: Image.asset("assets/images/backbutton.png"),
                    ),
                    title: Text("Party Menu",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    centerTitle: true,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.search_sharp,
                          color: Color(0xff911FDA),
                        ),
                      )
                    ],
                  ),
                  body:
                  SingleChildScrollView(
                    child: SafeArea(
                      child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Container(
                            height: height,
                            child: ListView.builder(
                              itemCount: partyMenuController
                                  .userList.value.partyMenu!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height * 0.01),
                                  child: Container(
                                    width: width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xffF5F5F5)),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              bottom: height * 0.02,
                                              top: height * 0.02),
                                          child: Text(
                                            partyMenuController.userList.value
                                                .partyMenu![index].categoryName
                                                .toString(),
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                GoogleFonts
                                                    .outfit()
                                                    .fontFamily),
                                          ),
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                          partyMenuController
                                              .userList
                                              .value
                                              .partyMenu![index]
                                              .categoryMainMenuChild!
                                              .length,
                                          itemBuilder:
                                              (BuildContext context, int i) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 2,
                                                  right: 20,
                                                  left: 20),
                                              child: Container(
                                                height: 20,
                                                width: width,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (partyMenuController
                                                        .userList
                                                        .value
                                                        .partyMenu![index]
                                                        .categoryMainMenuChild![
                                                    i]
                                                        .categoryChildMenu
                                                        .toString() ==
                                                        "Starters")
                                                      Get.to(Starters());
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                          partyMenuController
                                                              .userList
                                                              .value
                                                              .partyMenu![index]
                                                              .categoryMainMenuChild![
                                                          i]
                                                              .categoryChildMenu
                                                              .toString(),
                                                          style: Theme
                                                              .of(context)
                                                              .textTheme
                                                              .bodyLarge
                                                              ?.copyWith(
                                                              color: Color(
                                                                  0xff9796A1),
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w300,
                                                              fontFamily: GoogleFonts
                                                                  .outfit()
                                                                  .fontFamily)),
                                                      Icon(
                                                          Icons
                                                              .arrow_right_alt_outlined,
                                                          color:
                                                          Color(0xff911FDA))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(height: height * 0.03)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      ),
                    ),
                  ),

                );
          }});
  }
}
