// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:the29029restaurant/data/response/status.dart';
// import 'package:the29029restaurant/res/components/general_exception.dart';
// import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
// import 'package:the29029restaurant/view/bottombarscreen/menu/takeawaymenus/singleitemfromtakeaway.dart';
// // import 'package:the29029restaurant/view/bottombarscreen/menu/restaurantmenu/singleitemfromtakeaway.dart';
// import 'package:the29029restaurant/view_models/controller/maincourse/maincourse_controller.dart';
//
// String? mainmenucategoryid;
// String? mainmenuslug;
//
// class MainCourse extends StatefulWidget {
//   const MainCourse({super.key});
//
//   @override
//   State<MainCourse> createState() => _MainCourseState();
// }
//
// class _MainCourseState extends State<MainCourse> {
//   maincourse_controller maincourse_controllers =
//       Get.put(maincourse_controller());
//
//   @override
//   void initState() {
//     maincourse_controllers.maincourseapi();
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Obx(() {
//           switch (maincourse_controllers.rxRequestStatus.value) {
//             case Status.LOADING:
//               return const Center(child: CircularProgressIndicator());
//             case Status.ERROR:
//               if (maincourse_controllers.error.value == 'No internet') {
//                 return InterNetExceptionWidget(
//                   onPress: () {},
//                 );
//               } else {
//                 return GeneralExceptionWidget(onPress: () {});
//               }
//             case Status.COMPLETED:
//               return SafeArea(
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: EdgeInsets.only(right: 20, left: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                              maincourse_controllers.userList.value.categoryTitle
//                                  .toString(),
//                             //"Start",
//                             style: Theme.of(context).textTheme.titleLarge),
//                         SizedBox(height: height * 0.02),
//                         GridView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               childAspectRatio: .6,
//                               crossAxisSpacing: 12,
//                               mainAxisSpacing: 12,
//                               mainAxisExtent: 270,
//                             ),
//                             itemCount: maincourse_controllers
//                                 .userList.value.partyMainMenuDetails!.length,
//                             //6,
//                             itemBuilder: (context, index) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     mainmenucategoryid = maincourse_controllers.userList.value
//                                         .partyMainMenuDetails![index].productId.toString();
//
//                                     mainmenuslug = maincourse_controllers
//                                         .userList
//                                         .value
//                                         .partyMainMenuDetails![index]
//                                         .productSlug;
//                                   });
//                                   Get.to(() => Singleitemfromtakeaway());
//                                 },
//                                 child: Container(
//                                   height: height * 0.3,
//                                   width: width * 0.4,
//                                   decoration: BoxDecoration(
//                                       color: Color(0xffF5F5F5),
//                                       borderRadius: BorderRadius.circular(25)),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       SizedBox(height: height * 0.02),
//                                       Center(
//                                           child: Image.network(
//                                         maincourse_controllers
//                                             .userList
//                                             .value
//                                             .partyMainMenuDetails![index]
//                                             .productImg
//                                             .toString(),
//                                       )),
//                                       SizedBox(height: height * 0.01),
//                                       Text(
//                                         maincourse_controllers
//                                             .userList
//                                             .value
//                                             .partyMainMenuDetails![index]
//                                             .menuTitle
//                                             .toString(),
//                                         //"Piyaza Chicken ",
//                                         textAlign: TextAlign.center,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.w500),
//                                       ),
//                                       SizedBox(height: height * 0.01,),
//                                       Text(maincourse_controllers
//                                             .userList
//                                             .value
//                                             .partyMainMenuDetails![index]
//                                             .menuDiscription
//                                             .toString(),
//                                         overflow: TextOverflow.ellipsis,
//                                         //"Strips of Corn Fed Chic...",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 color: Color(0xff9796A1),
//                                                 fontWeight: FontWeight.w300),
//                                       ),
//                                       SizedBox(height: height * 0.01),
//                                       if(maincourse_controllers
//                                           .userList
//                                           .value
//                                           .partyMainMenuDetails![index]
//                                           .productPrice
//                                           !="")
//                                         RichText(
//                                           text: TextSpan(children: [
//                                             WidgetSpan(
//                                               child: Padding(
//                                                 padding: EdgeInsets.only(bottom:4),
//                                                 child: Text(
//                                                   "£ ",
//                                                   style: Theme.of(context)
//                                                       .textTheme
//                                                       .bodySmall
//                                                       ?.copyWith(
//                                                       fontSize:8,
//                                                       color: Color(0xff911FDA),
//                                                       fontFamily: GoogleFonts.mulish()
//                                                           .fontFamily,
//                                                       fontWeight: FontWeight.w700),
//                                                 ),
//                                               ),
//                                             ),
//                                             TextSpan(
//                                                 text:maincourse_controllers
//                                                       .userList
//                                                       .value
//                                                       .partyMainMenuDetails![index]
//                                                       .productPrice
//                                                       .toString(),
//                                                   //"£11.55",
//                                                   style: Theme.of(context)
//                                                       .textTheme
//                                                       .bodyLarge
//                                                       ?.copyWith(
//                                                     fontSize: 14,
//                                                           color: Color(0xff911FDA),
//                                                           fontWeight: FontWeight.w700))
//                                           ])),
//                                       // Text(
//                                       //   maincourse_controllers
//                                       //       .userList
//                                       //       .value
//                                       //       .partyMainMenuDetails![index]
//                                       //       .productPrice
//                                       //       .toString(),
//                                       //   //"£11.55",
//                                       //   style: Theme.of(context)
//                                       //       .textTheme
//                                       //       .bodySmall
//                                       //       ?.copyWith(
//                                       //           color: Color(0xff911FDA),
//                                       //           fontWeight: FontWeight.w700),
//                                       // ),
//
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             }),
//                         SizedBox(
//                           height: height * 0.03,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//           }
//         }));
//   }
// }
