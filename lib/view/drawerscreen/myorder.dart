import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/drawerscreen/myorder2.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../view_models/controller/Drawer_Controller/myorder/myorder_controller.dart';


String?OrderId;

class Myoder extends StatefulWidget {
  const Myoder({super.key});

  @override
  State<Myoder> createState() => _MyoderState();
}

class _MyoderState extends State<Myoder> {
  Myorder_controller myorder_controller = Get.put(Myorder_controller());

  @override
  void initState() {
    myorder_controller.myorderapihit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (myorder_controller.rxRequestStatus.value) {
        case Status.LOADING:
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );

        case Status.ERROR:
          if (myorder_controller.error.value == 'No internet') {
            return Scaffold(
              body: Center(
                  child: InterNetExceptionWidget(
                onPress: () {},
              )),
            );
          } else {
            return Scaffold(
              body: Center(child: GeneralExceptionWidget(onPress: () {})),
            );
          }
        case Status.COMPLETED:
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/backbutton.png"),
              ),
              title: Text("My Order",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: SingleChildScrollView(child:Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.001,
                      ),
                      ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: myorder_controller
                              .userList.value.orderDetails!.length,
                          itemBuilder: (context, index) {
                            return
                              GestureDetector(
                                onTap: () {
                                  OrderId = myorder_controller
                                      .userList
                                      .value
                                      .orderDetails![index].iD.toString();
                                  Get.to(Myoder2());
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(23),
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5, color: Color(0xffD7D7D7))),
                                  alignment: Alignment.topCenter,
                                  height: Get.height * 0.16 + (myorder_controller
                                      .userList.value.orderDetails![index].items!.length  * 20),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              decoration: BoxDecoration(
                                                  // color: Colors.grey[200],
                                                image: DecorationImage(image:
                                                AssetImage('assets/images/histroylogo.png')),
                                                  borderRadius:
                                                  BorderRadius.circular(23)),
                                              height: Get.height * 0.075,
                                              width: Get.width * 0.15,
                                              // child: Padding(
                                              //   padding: const EdgeInsets.all(10),
                                              //   child: Image.asset('assets/images/histroylogo.png',fit:BoxFit.cover),
                                              // )
                                            ),
                                            SizedBox(width: 8),
                                            Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                child: ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth: Get.width - 140),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                          text:
                                                          TextSpan(children: [
                                                            TextSpan(
                                                              text: "Order Id-:",
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .labelSmall
                                                                  ?.copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w300,
                                                                color:
                                                                Colors.black,
                                                                fontFamily: GoogleFonts
                                                                    .outfit()
                                                                    .fontFamily,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: myorder_controller
                                                                  .userList
                                                                  .value
                                                                  .orderDetails![
                                                              index]
                                                                  .iD
                                                                  .toString(),
                                                              style: Theme.of(context)
                                                                  .textTheme
                                                                  .labelSmall
                                                                  ?.copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                color: Color(
                                                                    0xff41004C),
                                                                fontFamily: GoogleFonts
                                                                    .outfit()
                                                                    .fontFamily,
                                                              ),
                                                            ),
                                                          ])),
                                                      SizedBox(
                                                          height:
                                                          Get.height * 0.01),
                                                      SizedBox(
                                                        width: Get.width * 0.6,
                                                        child: Text(
                                                            "Sandford Rd, Sandford, Wareham BH20 7DD, United Kingdom",
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            maxLines: 3,
                                                            textAlign: TextAlign
                                                                .start,
                                                            softWrap: true,
                                                            style: Theme.of(
                                                                context)
                                                                .textTheme
                                                                .labelSmall
                                                                ?.copyWith(
                                                                fontFamily: GoogleFonts
                                                                    .outfit()
                                                                    .fontFamily,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w300,
                                                                color: Color(
                                                                    0xff9796A1))),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.01,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: myorder_controller
                                                    .userList.value.orderDetails![index].items!.length  * 20,
                                                width: Get.width,
                                                // color: Colors.red,
                                                child: ListView.builder(
                                                  // shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemCount: myorder_controller
                                                        .userList
                                                        .value
                                                        .orderDetails![index]
                                                        .items!
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                        int idx) {
                                                      return Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              bottom: 2),
                                                          child: RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: myorder_controller
                                                                          .userList
                                                                          .value
                                                                          .orderDetails![
                                                                      index]
                                                                          .items![idx]
                                                                          .quantity
                                                                          .toString(),
                                                                      style: Theme.of(
                                                                          context)
                                                                          .textTheme
                                                                          .bodyLarge
                                                                          ?.copyWith(
                                                                        fontFamily:
                                                                        GoogleFonts.outfit()
                                                                            .fontFamily,
                                                                      ),
                                                                    ),
                                                                    TextSpan(
                                                                        text: " "),
                                                                    TextSpan(
                                                                      text: "X",
                                                                      style: Theme.of(
                                                                          context)
                                                                          .textTheme
                                                                          .labelSmall
                                                                          ?.copyWith(
                                                                        fontFamily:
                                                                        GoogleFonts.outfit()
                                                                            .fontFamily,
                                                                      ),
                                                                    ),
                                                                    TextSpan(
                                                                        text: " "),
                                                                    TextSpan(
                                                                      text: myorder_controller
                                                                          .userList
                                                                          .value
                                                                          .orderDetails![
                                                                      index]
                                                                          .items![idx]
                                                                          .item
                                                                          .toString(),
                                                                      style: Theme.of(
                                                                          context)
                                                                          .textTheme
                                                                          .bodyLarge
                                                                          ?.copyWith(
                                                                        fontFamily:
                                                                        GoogleFonts.outfit()
                                                                            .fontFamily,
                                                                      ),
                                                                    )
                                                                  ])));
                                                    })),

                                            // SizedBox(height:Get.height*0.02),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                      myorder_controller
                                                          .userList
                                                          .value
                                                          .orderDetails![index]
                                                          .date
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                        color: Colors.black,
                                                        fontFamily:
                                                        GoogleFonts
                                                            .outfit()
                                                            .fontFamily,
                                                      )),
                                                  Text(
                                                      "\$" +
                                                          myorder_controller
                                                              .userList
                                                              .value
                                                              .orderDetails![
                                                          index]
                                                              .value
                                                              .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge
                                                          ?.copyWith(
                                                        color:
                                                        Color(0xff41004C),
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        fontFamily:
                                                        GoogleFonts
                                                            .outfit()
                                                            .fontFamily,
                                                      ))
                                                ],
                                              ),
                                            ),

                                            // SizedBox(height: Get.height*0.001,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                          }),
                      SizedBox(height: Get.height*0.01,)
                    ],
                  ) ,),

              ),
            ),
          );
      }
    });
  }
}
