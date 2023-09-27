import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/occasionmenus/occasionmenu.dart';
import 'package:get/get.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/ourpartymenu/partymenu.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/restaurantmenu1/buttonscreen.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/takeawaymenus/takeawaymenus.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view_models/controller/menu_page_controller.dart';

import '../../../res/components/general_exception.dart';

String? menucategoryid;
String? menuslug;

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Menu_Controller menu_Controller = Get.put(Menu_Controller());

  void initState() {
    menu_Controller.menuapihit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      switch (menu_Controller.rxRequestStatus.value) {
        case Status.LOADING:
          return Container(
              width: width,
              height: height,
              child: CircularProgressIndicator(),
              alignment: Alignment.center);
        case Status.ERROR:
          if (menu_Controller.error.value == 'No internet') {
            return   Scaffold(body: InterNetExceptionWidget(onPress: () {},));
          } else {
            return Scaffold(body:GeneralExceptionWidget(onPress: () {}));
          }
        case Status.COMPLETED:
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Get.offAll(() => TabScreen(index: 0));
                  // Get.to(() => TabScreen(index: 1,));
                },
                child: Image.asset("assets/images/backbutton.png"),
              ),
              title: Text("Menu",
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      itemCount: menu_Controller
                          .userList.value.categoryMainMenu!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              menucategoryid = menu_Controller.userList.value
                                  .categoryMainMenu![index].categoryId
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
                              Get.to(PartyMenu());
                              return;
                            }
                            if (menu_Controller.userList.value
                                .categoryMainMenu![index].categoryName
                                .toString() ==
                                "Restaurant Menu") {
                              print('ggggggggggggggggggggggggggggggggggggggg menuuu');

                              Get.to(restaurantmenu());
                              return;
                            }

                            if(menu_Controller.userList.value
                                .categoryMainMenu![index].categoryName
                                .toString() ==
                                "Take Away Menus"){
                              Get.to(Takeawaysmenus());
                            }
                            if(menu_Controller.userList.value
                                .categoryMainMenu![index].categoryName
                                .toString() ==
                                "Occasion Menus"){
                              Get.to(Occasionmenu());
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                // color: Color(0xffF5F5F5),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child:
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(height: height * 0.01),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      menu_Controller.userList.value
                                          .categoryMainMenu![index].categoryImg
                                          .toString(),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  Padding(padding: EdgeInsets.only(right: 5,left: 5),
                                  child:Text(
                                    menu_Controller.userList.value
                                        .categoryMainMenu![index].categoryName
                                        .toString(),
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    style:
                                    Theme.of(context).textTheme.bodyLarge,
                                  ) ,)
                                  ,
                                  SizedBox(height: height * 0.01),
                            Padding(padding: EdgeInsets.only(right: 5,left: 5),
                            child: Text(
                              menu_Controller
                                  .userList
                                  .value
                                  .categoryMainMenu![index]
                                  .categoryDescription
                                  .toString(),
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color(0xff9796A1),
                                  fontSize: 10,
                                  fontFamily:
                                  GoogleFonts.outfit().fontFamily,
                                  fontWeight: FontWeight.w300),
                            ) ,)
                                 ,
                                  SizedBox(height: height * 0.02),
                                  // Spacer(),
                            Padding(padding: EdgeInsets.only(right: 5,left: 5),
                                    child:Text(
                                      "Go to Menu >",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                          color: Color(0xff41004C),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          fontFamily: GoogleFonts.outfit()
                                              .fontFamily),
                                    ) ),


                                ]),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                ),
              )),
            ),
          );
      }
    });
  }
}
