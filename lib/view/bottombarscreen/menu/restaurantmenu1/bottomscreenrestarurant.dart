import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/restaurantmenu1/singleitemfromresturantmenu.dart';

import '../../../../data/response/status.dart';
import '../../../../res/components/internet_exceptions_widget.dart';
import '../../../../view_models/controller/Menu_Controller/restaurant_controller/restaurantscreen_controller.dart';
import '../takeawaymenus/singleitemfromtakeaway.dart';

// y bootm tab krte he screen h

String? bottonrestaurantid;
String? bottonrestaurantproductslug;

class Restaurantbottomscreen extends StatefulWidget {
  const Restaurantbottomscreen({super.key});

  @override
  State<Restaurantbottomscreen> createState() => _RestaurantbottomscreenState();
}

class _RestaurantbottomscreenState extends State<Restaurantbottomscreen> {
  restaurant_controller restaurant_controlle = Get.put(restaurant_controller());

  @override
  void initState() {
    restaurant_controlle.buttonrestaurantapihit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Obx(() {
        switch (restaurant_controlle.rxRequestStatus.value) {
          case Status.LOADING:
            return Scaffold(body: Center(child: Container(
                width: Get.width,
                height: Get.height,
                child: CircularProgressIndicator(),
                alignment: Alignment.center) ),);
          case Status.ERROR:
            if (restaurant_controlle.error.value == 'No internet') {
              return Scaffold(body: Center(child:InterNetExceptionWidget(
                onPress: () {},
              ) ),) ;
            } else {
              return Scaffold(body: Center(child: Text("No Data") ),);
            }
          case Status.COMPLETED:
            return


              SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    restaurant_controlle.userList.value.categoryTitle
                        .toString(),
                    // "start",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
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
                      mainAxisExtent: 260,
                    ),
                    itemCount: restaurant_controlle
                        .userList.value.partyMainMenuDetails!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          bottonrestaurantid = restaurant_controlle.userList
                              .value.partyMainMenuDetails![index].productId
                              .toString();
                          print("iddddddddddddddddddddddddddddddddddddddddddddddddd");
                          print(bottonrestaurantid);
                          print("slugggggggggggggggggggggggggggggggggggggggggggggggg");
                          print(bottonrestaurantproductslug);
                          bottonrestaurantproductslug = restaurant_controlle
                              .userList
                              .value
                              .partyMainMenuDetails![index]
                              .productSlug
                              .toString();
                         Get.to(() => Singleitemfromresturantmenu());
                        },
                        child: Container(
                          // height: 100,
                          // width: 235,
                          decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: height * 0.01),
                                Stack(alignment: Alignment.center,
                                  children: [
                                    Image.asset("assets/images/plateblanck.png",height: 120,
                                      width: 120,),
                                    CircleAvatar(radius:50,
                                        backgroundImage: NetworkImage (
                                          restaurant_controlle.userList.value
                                              .partyMainMenuDetails![index].productImg
                                              .toString(),
                                        ) ),
                                  ],),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(15),
                                //   child: Image.network(
                                //     restaurant_controlle.userList.value
                                //         .partyMainMenuDetails![index].productImg
                                //         .toString(),
                                //     fit: BoxFit.fill,
                                //   ),
                                // ),
                                SizedBox(height: height * 0.01),
                                Text(
                                  restaurant_controlle.userList.value
                                      .partyMainMenuDetails![index].menuTitle
                                      .toString(),

                                  // "hello",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(height: height * 0.01),
                                Text(
                                  restaurant_controlle
                                      .userList
                                      .value
                                      .partyMainMenuDetails![index]
                                      .menuDiscription
                                      .toString(),
                                  // "yelllldjkhedjhe",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color(0xff9796A1),
                                      fontSize: 10,
                                      fontFamily:
                                          GoogleFonts.outfit().fontFamily,
                                      fontWeight: FontWeight.w300),
                                ),
                                SizedBox(height: height * 0.01),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "£",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff911FDA),
                                          )),
                                  TextSpan(
                                      text:  restaurant_controlle
                                          .userList
                                          .value
                                          .partyMainMenuDetails![index]
                                          .productPrice
                                          .toString(),

                                      // "12.95",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              color: Color(0xff911FDA),
                                              fontWeight: FontWeight.w700))
                                ])),
                              ]),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: Get.height*0.2,)
                ],
              ),
            );
        }
      }),
    );
  }
}
