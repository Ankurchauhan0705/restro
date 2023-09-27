import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../view_models/controller/Search_Controller/search_controller.dart';
import '../bottomnavigationbar/tab_screen.dart';

class Searching extends StatefulWidget {
  final String x;
  const Searching({required this.x, super.key});

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  Searching_controller searching_controller = Get.put(Searching_controller());

  @override
  void dispose() {
    searching_controller.userList.value.productSearching!.searchProduct = [];
    searching_controller.rxRequestStatus.value = Status.LOADING;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    searching_controller.searchapihit(widget.x);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      switch (searching_controller.rxRequestStatus.value) {
        case Status.LOADING:
          return Scaffold(
              body: const Center(child: CircularProgressIndicator()));
        case Status.ERROR:
          if (searching_controller.error.value == 'No internet') {
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
                  Get.back();
                },
                child: Image.asset("assets/images/backbutton.png"),
              ),
              title: Text("Categories",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
              centerTitle: true,
              // actions: [
              //   Obx(
              //         () => GestureDetector(
              //         onTap: () {
              //           Get.to(() => Card2());
              //         },
              //         child: Padding(
              //           padding: EdgeInsets.only(right: 15, top: 5),
              //           child: b.Badge(
              //               onTap: () {
              //                 Get.to(() => Card2());
              //               },
              //               badgeContent: Text(
              //                 iconcount.value.toString(),
              //                 // "10",
              //                 style: Theme.of(context).textTheme.labelSmall?.copyWith(
              //                     color: Colors.white,
              //                     fontSize: 7,
              //                     fontFamily: GoogleFonts.outfit().fontFamily),
              //               ),
              //               badgeStyle: b.BadgeStyle(badgeColor: Colors.black),
              //               // position: b.BadgePosition.topEnd(top),
              //               child: Icon(
              //                 size: 28,
              //                 Icons.shopping_cart_outlined,
              //                 color: Color(0xff911FDA),
              //               )),
              //         )),
              //   )
              // ],
            ),
            body: (searching_controller.userList.value.productSearching!
                            .searchProduct!.length ==
                        0 &&
                    searching_controller.userList.value
                            .productCategorySearching!.searchCategory!.length ==
                        0)
                ? Center(child: Text('No Items Match Your Search'))
                : SingleChildScrollView(
                    child: SafeArea(
                      child: Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: Column(
                            children: [
                              SizedBox(height: Get.height * 0.01),
                              TextFormField(
                                onFieldSubmitted: (x) {
                                  searching_controller.searchapihit(x);
                                },
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
                                          fontFamily:
                                              GoogleFonts.outfit().fontFamily,
                                        ),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Color(0xffDCDCDC))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Color(0xffDCDCDC))),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                            color: Color(0xffDCDCDC)))),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              SizedBox(height: Get.height * 0.01),
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: .6,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  mainAxisExtent: 275,
                                ),
                                itemCount: searching_controller.userList.value
                                    .productSearching!.searchProduct!.length,
                                //4,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // SizedBox(height: height * 0.01),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                searching_controller
                                                    .userList
                                                    .value
                                                    .productSearching!
                                                    .searchProduct![index]
                                                    .productImg
                                                    .toString(),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(height: height * 0.002),
                                            Text(
                                              searching_controller
                                                  .userList
                                                  .value
                                                  .productSearching!
                                                  .searchProduct![index]
                                                  .productTitle
                                                  .toString(),
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            SizedBox(height: height * 0.001),
                                            Html( data:
                                            searching_controller
                                                .userList
                                                .value
                                                .productSearching!
                                                .searchProduct![index]
                                                .productDiscription
                                                .toString(),
                                              shrinkWrap: true,
                                              style:{
                                              "body": Style(
                                                textOverflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                // fontSize: FontSize(18.0),
                                                //fontWeight: FontWeight.bold,
                                                  textAlign: TextAlign.start
                                              ),
                                            },
                                            ),
                                            // Text(
                                            //   searching_controller
                                            //       .userList
                                            //       .value
                                            //       .productSearching!
                                            //       .searchProduct![index]
                                            //       .productDiscription
                                            //       .toString(),
                                            //   maxLines: 3,
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .bodySmall
                                            //       ?.copyWith(
                                            //           color: Color(0xff41004C),
                                            //           fontWeight:
                                            //               FontWeight.w400,
                                            //           fontSize: 12,
                                            //           fontFamily:
                                            //               GoogleFonts.outfit()
                                            //                   .fontFamily),
                                            // ),
                                            SizedBox(height: height * 0.0001),
                                            Center(child:RichText(
                                                text: TextSpan(children: [
                                                  WidgetSpan(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 3),
                                                      child: Text(
                                                        "",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge
                                                            ?.copyWith(
                                                            color: Color(
                                                                0xff911FDA),
                                                            fontSize: 14,
                                                            fontFamily:
                                                            GoogleFonts
                                                                .mulish()
                                                                .fontFamily,
                                                            fontWeight:
                                                            FontWeight
                                                                .w700),
                                                      ),
                                                    ),
                                                  ),

                                                  TextSpan(
                                                      text: searching_controller
                                                          .userList
                                                          .value
                                                          .productSearching!
                                                          .searchProduct![
                                                      index]
                                                          .productPrice ==
                                                          ''
                                                          ? ''
                                                          : "£ " +
                                                          searching_controller
                                                              .userList
                                                              .value
                                                              .productSearching!
                                                              .searchProduct![
                                                          index]
                                                              .productPrice
                                                              .toString() ??
                                                          'test',
                                                      //"11.55",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge
                                                          ?.copyWith(
                                                          fontSize: 18,
                                                          color:
                                                          Color(0xff911FDA),
                                                          fontFamily:
                                                          GoogleFonts
                                                              .outfit()
                                                              .fontFamily,
                                                          fontWeight:
                                                          FontWeight.w700))

                                                ]))),

                                          ]),
                                    ),
                                  );
                                },
                              ),
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: .6,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  mainAxisExtent: 350,
                                ),
                                itemCount: searching_controller
                                    .userList
                                    .value
                                    .productCategorySearching!
                                    .searchCategory!
                                    .length,
                                //4,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: height * 0.01),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                searching_controller
                                                    .userList
                                                    .value
                                                    .productCategorySearching!
                                                    .searchCategory![index]
                                                    .categoryImg
                                                    .toString(),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(height: height * 0.001),
                                            Text(
                                              searching_controller
                                                  .userList
                                                  .value
                                                  .productCategorySearching!
                                                  .searchCategory![index]
                                                  .categoryName
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            SizedBox(height: height * 0.001),
                                            RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                  text: "(",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          color:
                                                              Color(0xff41004C),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .outfit()
                                                                  .fontFamily),
                                                ),
                                                TextSpan(
                                                  text: searching_controller
                                                      .userList
                                                      .value
                                                      .productCategorySearching!
                                                      .searchCategory![index]
                                                      .categoryCount
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          color:
                                                              Color(0xff41004C),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .outfit()
                                                                  .fontFamily),
                                                ),
                                                TextSpan(
                                                  text: ")",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                          color:
                                                              Color(0xff41004C),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .outfit()
                                                                  .fontFamily),
                                                )
                                              ]),
                                            ),
                                            SizedBox(height: height * 0.0001),
                                            // RichText(
                                            //     text: TextSpan(children: [
                                            //       WidgetSpan(
                                            //         child: Padding(
                                            //           padding: EdgeInsets.only(
                                            //               bottom: 3),
                                            //           child: Text(
                                            //             "£ ",
                                            //             style: Theme
                                            //                 .of(context)
                                            //                 .textTheme
                                            //                 .bodyLarge
                                            //                 ?.copyWith(
                                            //                 color: Color(0xff911FDA),
                                            //                 fontSize: 14,
                                            //                 fontFamily:
                                            //                 GoogleFonts
                                            //                     .mulish()
                                            //                     .fontFamily,
                                            //                 fontWeight: FontWeight
                                            //                     .w700),
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       TextSpan(
                                            //           text: searching_controller
                                            //               .userList.value
                                            //               .productSearching!.
                                            //           searchProduct![index]
                                            //               .productPrice.toString(),
                                            //           //"11.55",
                                            //           style: Theme
                                            //               .of(context)
                                            //               .textTheme
                                            //               .titleLarge
                                            //               ?.copyWith(
                                            //               fontSize: 18,
                                            //               color: Color(0xff911FDA),
                                            //               fontFamily:
                                            //               GoogleFonts
                                            //                   .outfit()
                                            //                   .fontFamily,
                                            //               fontWeight: FontWeight
                                            //                   .w700))
                                            //     ]))
                                          ]),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: Get.height*0.1,)
                            ],
                          )),
                    ),
                  ),
          );
      }
    });
  }
}
