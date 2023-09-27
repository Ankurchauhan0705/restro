import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../view_models/controller/Drawer_Controller/myorder/orderdetails_controller.dart';

class Myoder2 extends StatefulWidget {
  // String id;
   Myoder2({ super.key});

  @override
  State<Myoder2> createState() => _Myoder2State();
}

class _Myoder2State extends State<Myoder2> {
  Orderdetails_controller orderdetails_controller =
      Get.put(Orderdetails_controller());

  @override
  void initState() {
    orderdetails_controller.orderdetailsmodelpihit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (orderdetails_controller.rxRequestStatus.value) {
        case Status.LOADING:
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );

        case Status.ERROR:
          if (orderdetails_controller.error.value == 'No internet') {
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
                  Get.back();
                },
                child: Image.asset("assets/images/backbutton.png"),
              ),
              title: Text("Order Details",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontWeight: FontWeight.w600)),
              centerTitle: true,
            ),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child:
                  SingleChildScrollView(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: Colors.white,
                              border:
                              Border.all(width: 0.5, color: Color(0xffD7D7D7))),
                          alignment: Alignment.topCenter,
                          height: Get.height * 0.24+(orderdetails_controller
                              .userList.value.orderDetails!.items!.length *20),
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: Get.height * 0.02),
                                RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "Order Id-:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily:
                                            GoogleFonts.outfit().fontFamily),
                                      ),
                                      TextSpan(
                                        text: orderdetails_controller
                                            .userList.value.orderDetails!.orderId
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff41004C),
                                            fontFamily:
                                            GoogleFonts.outfit().fontFamily),
                                      ),
                                    ])),
                                SizedBox(height: Get.height * 0.01),
                                Container(
                                    height: Get.height*0.02+(orderdetails_controller
                                        .userList.value.orderDetails!.items!.length *20),
                                    width: Get.width,
                                    // color: Colors.red,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: orderdetails_controller
                                            .userList
                                            .value
                                            .orderDetails!.items!.length
                                        , itemBuilder: (BuildContext context, int index) {
                                      return Padding(
                                          padding:
                                          EdgeInsets.only(
                                              bottom: 2),
                                          child: RichText(
                                              text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: orderdetails_controller
                                                          .userList
                                                          .value
                                                          .orderDetails!.items![index].quantity.toString(),
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
                                                      text:orderdetails_controller
                                                          .userList
                                                          .value
                                                          .orderDetails!.items![index].item.toString(),
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
                                // Text(
                                //   "1 X Mexican Pizza [ 6 Inches ]",
                                //   style: Theme.of(context)
                                //       .textTheme
                                //       .bodyLarge
                                //       ?.copyWith(
                                //         color: Colors.black,
                                //         fontWeight: FontWeight.w600,
                                //         fontFamily: GoogleFonts.outfit().fontFamily,
                                //       ),
                                // ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Order Status",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontFamily:
                                          GoogleFonts.outfit().fontFamily,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      orderdetails_controller
                                          .userList.value.orderDetails!.orderStatus
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontFamily:
                                          GoogleFonts.outfit().fontFamily,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Items Subtotal",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontFamily:
                                          GoogleFonts.outfit().fontFamily,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "\$" +
                                          orderdetails_controller.userList.value
                                              .orderDetails!.subtotalItems
                                              .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontFamily:
                                          GoogleFonts.outfit().fontFamily,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery Charge",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontFamily:
                                          GoogleFonts.outfit().fontFamily,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "\$" +
                                          orderdetails_controller.userList.value
                                              .orderDetails!.orderShippingTotal
                                              .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontFamily:
                                          GoogleFonts.outfit().fontFamily,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      orderdetails_controller
                                          .userList.value.orderDetails!.date
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                          fontFamily:
                                          GoogleFonts.outfit().fontFamily),
                                    ),
                                    Text(
                                      "\$" +
                                          orderdetails_controller
                                              .userList.value.orderDetails!.value
                                              .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff41004C),
                                          fontFamily:
                                          GoogleFonts.outfit().fontFamily),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(height: Get.height * 0.03),
                      Text(
                        "Billing Address",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Name",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Color(0xff777777),
                            fontWeight: FontWeight.w300,
                            fontSize: 9,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.001,
                      ),
                      Text(
                        orderdetails_controller
                            .userList.value.orderDetails!.orderBillingName
                            .toString(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            fontFamily: GoogleFonts.outfit().fontFamily,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Email",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Color(0xff777777),
                            fontWeight: FontWeight.w300,
                            fontSize: 9,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.001,
                      ),
                      Text(
                        orderdetails_controller
                            .userList.value.orderDetails!.orderBillingEmail
                            .toString(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            fontFamily: GoogleFonts.outfit().fontFamily,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Phone",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Color(0xff777777),
                            fontWeight: FontWeight.w300,
                            fontSize: 9,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.001,
                      ),
                      Text(
                        orderdetails_controller
                            .userList.value.orderDetails!.orderBillingPhone
                            .toString(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            fontFamily: GoogleFonts.outfit().fontFamily,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Address",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Color(0xff777777),
                            fontWeight: FontWeight.w300,
                            fontSize: 9,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.001,
                      ),
                      Text(
                        orderdetails_controller.userList.value.orderDetails!.orderBillingAddress1.toString() +
                            // "," +
                            orderdetails_controller
                                .userList.value.orderDetails!.orderBillingCity
                                .toString() +
                            // "," +
                            orderdetails_controller
                                .userList.value.orderDetails!.orderBillingState
                                .toString() +
                            // "," +
                            orderdetails_controller
                                .userList.value.orderDetails!.orderBillingCountry
                                .toString() +
                            // "," +
                            orderdetails_controller
                                .userList.value.orderDetails!.orderBillingPostcode
                                .toString() +".",
                        textAlign: TextAlign.center,
                        // ",",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            fontFamily: GoogleFonts.outfit().fontFamily,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Text(
                        "Shipping Address",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Service Type",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Color(0xff777777),
                            fontWeight: FontWeight.w300,
                            fontSize: 9,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.001,
                      ),
                      Text(
                        orderdetails_controller
                            .userList.value.orderDetails!.serviceType
                            .toString(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            fontFamily: GoogleFonts.outfit().fontFamily,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Date:",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Color(0xff777777),
                            fontWeight: FontWeight.w300,
                            fontSize: 9,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.001,
                      ),
                      Text(
                        orderdetails_controller
                            .userList.value.orderDetails!.serviceDate
                            .toString(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Time:",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Color(0xff777777),
                            fontWeight: FontWeight.w300,
                            fontSize: 9,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.001,
                      ),
                      Text(
                        orderdetails_controller
                            .userList.value.orderDetails!.serviceTime
                            .toString(),
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        "Deliver To",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Color(0xff777777),
                            fontWeight: FontWeight.w300,
                            fontSize: 9,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(
                        height: Get.height * 0.001,
                      ),
                      Text(
                        orderdetails_controller.userList.value.orderDetails!.orderShippingAddress1.toString() +
                            // "," +
                            orderdetails_controller
                                .userList.value.orderDetails!.orderShippingCity
                                .toString() +
                            // "," +
                            orderdetails_controller
                                .userList.value.orderDetails!.orderShippingState
                                .toString() +
                            // "," +
                            orderdetails_controller
                                .userList.value.orderDetails!.orderShippingCountry
                                .toString() +
                            // "," +
                            orderdetails_controller
                                .userList.value.orderDetails!.orderShippingPostcode
                                .toString()+".",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(height: Get.height*0.02,),
                    ],
                  ), ),

            )),
          );
      }
    });
  }
}
