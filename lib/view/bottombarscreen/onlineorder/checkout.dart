import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/cart.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/cardcheckout.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/onlinelocation.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

class Check_Out extends StatefulWidget {
  const Check_Out({super.key});

  @override
  State<Check_Out> createState() => _Check_OutState();
}

class _Check_OutState extends State<Check_Out> {
  int CardValue = 0;
  int PaypalValue = 0;
  int CahondeliveryValue = 0;

  String selectedValue = "";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
            // Get.to(onlinelocation());
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Checkout",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: 20,
            left: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.03),
                Text(
                  "Payment method",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                    height: height*0.07,
                    width: Width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                       // color: Color(0xffDCDCDC),
                        border: Border.all(color: Color(0xffDCDCDC), width: 1)),
                    child: ListTile(
                      onTap: (){
                        setState(() {
                          selectedValue = 'card';
                        });
                      },
                      leading: Image.asset("assets/images/credit.png"),
                      horizontalTitleGap: 0,
                      title: Text(
                        "Card",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      trailing:
                      Radio(
                        fillColor: MaterialStateColor.resolveWith((states) => Color(0XFF911FDA)),
                        value: "card",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),

                      ) ,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                    height: height*0.07,
                    width: Width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        //color: Color(0xffDCDCDC),
                        border: Border.all(color: Color(0xffDCDCDC), width: 1)),
                    child: ListTile(
                        onTap: (){
                          setState(() {
                            selectedValue = 'paypal';
                          });
                        },
                      leading: Image.asset("assets/images/paypal.png"),
                      horizontalTitleGap: 0,
                      title: Text(
                        "PayPal",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,),
                      ),
                      trailing:Radio(
                        fillColor: MaterialStateColor.resolveWith((states) => Color(0XFF911FDA)),
                        value: "paypal",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      ),
                    )),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height*0.07,
                  width: Width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      //color: Color(0xffDCDCDC),
                      border: Border.all(color: Color(0xffDCDCDC), width: 1)),
                  child: ListTile(
                    onTap: (){
                      setState(() {
                        selectedValue = 'cash on delivery';
                      });
                    },
                    leading: Image.asset("assets/images/cashondelvery.png"),
                    horizontalTitleGap: 0,
                    title: Text(
                      "Cash on Delivery",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    trailing:  Radio(
                      fillColor: MaterialStateColor.resolveWith((states) => Color(0XFF911FDA)),
                      value: "cash on delivery",
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                    ),
                  ),
                  ),
                SizedBox(height: height * 0.03),
                ListTile(
                  leading: Text(
                    "Price",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  trailing:RichText(text: TextSpan(children: [
                    TextSpan(text: "£", style: Theme.of(context)
                        .textTheme.displaySmall?.copyWith(fontSize: 22,
                        color: Color(0xff911FDA),
                        fontWeight: FontWeight.w500),),
                    TextSpan(text:totalPrice.value.toStringAsFixed(2),style: Theme.of(context)
                        .textTheme.displaySmall?.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff911FDA)
                    ) )
                  ]))
                ),
                ListTile(
                    leading: Text(
                      "Discount",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    trailing:RichText(text: TextSpan(children: [
                      TextSpan(text: "£", style: Theme.of(context)
                          .textTheme.displaySmall?.copyWith(fontSize: 22,
                          color: Color(0xff911FDA),
                          fontWeight: FontWeight.w500),),
                      TextSpan(text:

                      Tabbuttonlocation.value == 'delivery'? '0' :
                      ((totalPrice.value*10)/100).toStringAsFixed(2),style: Theme.of(context)
                          .textTheme.displaySmall?.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff911FDA)
                      ) )
                    ]))
                ),
                ListTile(
                    leading: Text(
                      "Total",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    trailing:RichText(text: TextSpan(children: [
                      TextSpan(text: "£", style: Theme.of(context)
                          .textTheme.displaySmall?.copyWith(fontSize: 22,
                          color: Color(0xff911FDA),
                          fontWeight: FontWeight.w500),),
                      TextSpan(text:

                      Tabbuttonlocation.value == 'delivery'?totalPrice.value.toStringAsFixed(2):
                      (totalPrice.value -((totalPrice.value *10)/100)).toStringAsFixed(2),style: Theme.of(context)
                          .textTheme.displaySmall?.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff911FDA)
                      ) )
                    ]))
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: MyButton(
                      title: "Proceed to payment",
                      txtStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: GoogleFonts.outfit().fontFamily),
                      side: BorderSide(
                        color: Color(0xff41004C),
                      ),
                      bgColor: Color(0xff41004C),
                      onTap: () {
                        if (selectedValue == 'card' ) {
                          Get.to(() => Card_Checkout());
                        }
                        else{
                       // Get.to(() => Card_Checkout());
                      }},
                      height: height * .07,
                      width: Width * 0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
