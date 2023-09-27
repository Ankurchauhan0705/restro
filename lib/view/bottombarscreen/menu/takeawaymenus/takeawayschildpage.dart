import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/takeawaymenus/singleitemfromtakeaway.dart';
import '../../../../data/response/status.dart';
import '../../../../res/components/internet_exceptions_widget.dart';
import '../../../../view_models/controller/buttommenu_controller/takewayscreen_controller.dart';
// import 'package:the29029restaurant/view/bottombarscreen/menu/restaurantmenu/singleitemfromtakeaway.dart';

String? bottonchilldpageid;
String? bottonchilldpageproductslug;

class Takeawaychild2 extends StatefulWidget {


  const Takeawaychild2({super.key});



  @override
  State<Takeawaychild2> createState() => _Takeawaychild2State();
}

class _Takeawaychild2State extends State<Takeawaychild2> {

  buttomscreen_controller buttomscreen_controlle=Get.put(buttomscreen_controller());


  @override
  void initState() {
    buttomscreen_controlle.buttonscreenapihit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return
      Container(
      child:  Obx(()
      {
        switch (buttomscreen_controlle.rxRequestStatus.value) {
          case Status.LOADING:
            return Container(
                width: width,
                height: height,
                child: CircularProgressIndicator(),
                alignment: Alignment.center);
          case Status.ERROR:
            if (buttomscreen_controlle.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {},
              );
            } else {
              return Text("hjhjhjhjh");
            }
          case Status.COMPLETED:
            return
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.02,),
                    Text(
                      buttomscreen_controlle.userList.value
                          .categoryTitle.toString(),
                      // "start",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),),
                    SizedBox(height: Get.height * 0.02,),

                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .6,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 278,
                      ),
                      itemCount: buttomscreen_controlle.userList.value
                          .partyMainMenuDetails!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            bottonchilldpageid =
                                buttomscreen_controlle.userList.value.
                                partyMainMenuDetails![index].productId.toString();

                            bottonchilldpageproductslug=
                                buttomscreen_controlle.userList.value.
                                partyMainMenuDetails![index].productSlug.toString();
                            Get.to(() => Singleitemfromtakeaway());
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child:
                                    Image.network(
                                      buttomscreen_controlle.userList.value.
                                      partyMainMenuDetails![index].productImg
                                          .toString(),

                                      //"https://www.iage-france.com/wp-content/uploads/2022/10/og-iage.jpg"
                                      //   // menu_Controller.userList.value
                                      //   //     .categoryMainMenu![index].categoryImg
                                      //   //     .toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    buttomscreen_controlle.userList.value.
                                    partyMainMenuDetails![index].menuTitle
                                        .toString(),
                                    // "hello",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style:
                                    Theme
                                        .of(context)
                                        .textTheme
                                        .bodyLarge,
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    buttomscreen_controlle.userList.value.
                                    partyMainMenuDetails![index].menuDiscription
                                        .toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    // "yelllldjkhedjhe",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff9796A1),
                                        fontSize: 10,
                                        fontFamily:
                                        GoogleFonts
                                            .outfit()
                                            .fontFamily,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  RichText(
                                      text:
                                      TextSpan(children: [
                                        TextSpan(
                                            text: "£", style: Theme
                                            .of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff911FDA),
                                        )
                                        ),
                                        TextSpan(text:
                                        buttomscreen_controlle.userList.value.
                                        partyMainMenuDetails![index].productPrice
                                            .toString(),

                                            // "12.95",
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                color: Color(0xff911FDA),
                                                fontWeight: FontWeight.w700
                                            ))

                                      ])


                                  ),

                                ]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
        }
      }
      ),
    );
  }
}


// Widget Takeawaychild2(BuildContext context,buttomscreen_controlle){
//
//   final height = MediaQuery.of(context).size.height;
//   final width = MediaQuery.of(context).size.width;
//   return
//     Obx(()
//     {
//     switch (buttomscreen_controlle.rxRequestStatus.value) {
//       case Status.LOADING:
//         return Container(
//             width: width,
//             height: height,
//             child: CircularProgressIndicator(),
//             alignment: Alignment.center);
//       case Status.ERROR:
//         if (buttomscreen_controlle.error.value == 'No internet') {
//           return InterNetExceptionWidget(
//             onPress: () {},
//           );
//         } else {
//           return Text("hjhjhjhjh");
//         }
//       case Status.COMPLETED:
//         return
//
//
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: Get.height * 0.02,),
//                 Text(
//                   buttomscreen_controlle.userList.value
//                       .categoryTitle.toString(),
//                   // "start",
//                   style: Theme
//                       .of(context)
//                       .textTheme
//                       .titleLarge
//                       ?.copyWith(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600
//                   ),),
//                 SizedBox(height: Get.height * 0.02,),
//
//                 GridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   gridDelegate:
//                   const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: .6,
//                     crossAxisSpacing: 12,
//                     mainAxisSpacing: 12,
//                     mainAxisExtent: 320,
//                   ),
//                   itemCount: buttomscreen_controlle.userList.value
//                       .partyMainMenuDetails!.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         bottonchilldpageid =
//                             buttomscreen_controlle.userList.value.
//                             partyMainMenuDetails[index]!.productId.toString();
//
//                         bottonchilldpageproductslug=
//                             buttomscreen_controlle.userList.value.
//                             partyMainMenuDetails[index]!.productSlug.toString();
//                         Get.to(() => Singleitemfromtakeaway());
//                       },
//                       child: Container(
//                         // height: 100,
//                         // width: 235,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(height: height * 0.01),
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(15),
//                                 child:
//                                 Image.network(
//                                   buttomscreen_controlle.userList.value.
//                                   partyMainMenuDetails[index]!.productImg
//                                       .toString(),
//
//                                   //"https://www.iage-france.com/wp-content/uploads/2022/10/og-iage.jpg"
//                                   //   // menu_Controller.userList.value
//                                   //   //     .categoryMainMenu![index].categoryImg
//                                   //   //     .toString(),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                               SizedBox(height: height * 0.01),
//                               Text(
//                                 buttomscreen_controlle.userList.value.
//                                 partyMainMenuDetails[index]!.menuTitle
//                                     .toString(),
//                                 // "hello",
//                                 maxLines: 2,
//                                 textAlign: TextAlign.center,
//                                 style:
//                                 Theme
//                                     .of(context)
//                                     .textTheme
//                                     .bodyLarge,
//                               ),
//                               SizedBox(height: height * 0.01),
//                               Text(
//                                 buttomscreen_controlle.userList.value.
//                                 partyMainMenuDetails[index]!.menuDiscription
//                                     .toString(),
//                                 // "yelllldjkhedjhe",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xff9796A1),
//                                     fontSize: 10,
//                                     fontFamily:
//                                     GoogleFonts
//                                         .outfit()
//                                         .fontFamily,
//                                     fontWeight: FontWeight.w300),
//                               ),
//                               SizedBox(height: height * 0.01),
//                               RichText(
//                                   text:
//                                   TextSpan(children: [
//                                     TextSpan(
//                                         text: "£", style: Theme
//                                         .of(context)
//                                         .textTheme
//                                         .labelSmall
//                                         ?.copyWith(
//                                       fontSize: 8,
//                                       fontWeight: FontWeight.w700,
//                                       color: Color(0xff911FDA),
//                                     )
//                                     ),
//                                     TextSpan(text:
//                                     buttomscreen_controlle.userList.value.
//                                     partyMainMenuDetails[index]!.productPrice
//                                         .toString(),
//
//                                         // "12.95",
//                                         style: Theme
//                                             .of(context)
//                                             .textTheme
//                                             .bodyLarge
//                                             ?.copyWith(
//                                             color: Color(0xff911FDA),
//                                             fontWeight: FontWeight.w700
//                                         ))
//
//                                   ])
//
//
//                               ),
//
//                             ]),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//     }
//     }
//     );
// }