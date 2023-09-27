import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/cart.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/collection_widget.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/delivery_widget.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/onlineorder.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

import '../../animation_screen.dart';

RxString Tabbuttonlocation=''.obs;
class onlinelocation extends StatefulWidget {
  const onlinelocation({super.key});

  @override
  State<onlinelocation> createState() => _onlinelocationState();
}

class _onlinelocationState extends State<onlinelocation> {
  bool selectedonCollection = false;
  bool selectedonDelivery = false;

  var choose = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCartItemCount();
  }

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
            // Get.to( Card_Page());
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Location",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Column(
              children: [
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.3,
                  width: Width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/drawericon/mappppp.png",
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: height * 0.03),
                ListTile(
                  leading: Container(
                    width: Width * 0.12,
                    height: height * 0.13,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff911FDA).withOpacity(0.10),
                    ),
                    child: Icon(
                      Icons.location_on,
                      color: Color(0xff41004C),
                      size: 25,
                    ),
                  ),
                  horizontalTitleGap: 5,
                  title: Text(
                    "The 29029 Restaurant Wareham",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  subtitle: Text(
                      "Sandford Rd, Sandford, Wareham BH20 7DD, United Kingdom",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Color(0xff9796A1),
                          fontWeight: FontWeight.w300,
                          fontSize: 12)),
                  trailing: Container(
                      width: Width * 0.13,
                      height: height * 0.13,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff911FDA),
                      ),
                      child:
                          Image.asset("assets/drawericon/Mask group (2).png")),
                ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      title: "Collection",
                      txtStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: choose == 1 ? Colors.white : Color(0xff911FDA),
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      bgColor: choose == 1 ? Color(0xff911FDA) : Colors.white,
                      side: BorderSide(color: Color(0xff911FDA)),
                      onTap: () {
                        Tabbuttonlocation.value='pickup';
                        choose = 1;
                        setState(() {
                          if (selectedonCollection) {
                            selectedonCollection = false;
                          } else {
                            selectedonCollection = true;
                            selectedonDelivery = false;
                          }
                        });
                      },
                      height: height * 0.043,
                      width: Width * 0.25,
                    ),
                    SizedBox(width: Width * 0.03),
                    MyButton(
                        title: "delivery",
                        txtStyle: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                                color: choose == 2
                                    ? Colors.white
                                    : Color(0xff911FDA),
                                fontFamily: GoogleFonts.outfit().fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                        bgColor: choose == 2 ? Color(0xff911FDA) : Colors.white,
                        side: BorderSide(color: Color(0xff911FDA)),
                        onTap: () {
                          Tabbuttonlocation.value='delivery';
                          choose = 2;
                          setState(() {
                            if (selectedonDelivery) {
                              selectedonDelivery = false;
                            } else {
                              selectedonDelivery = true;
                              selectedonCollection = false;
                            }
                          });
                        },
                        height: height * 0.043,
                        width: Width * 0.25),
                  ],
                ),
                SizedBox(height: height * 0.06),
                if (selectedonDelivery == false &&
                    selectedonCollection == false)
                  MyButton(
                      bgColor: Color(0xff41004C),
                      title: "Choose Items",
                      txtStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: GoogleFonts.outfit().fontFamily),
                      onTap: () {
                        choose = 1;
                        setState(() {
                          if (selectedonCollection) {
                            selectedonCollection = false;
                          } else {
                            selectedonCollection = true;
                            selectedonDelivery = false;
                          }
                        });
                      },
                      height: height * .07,
                      width: Width * 0.5),
                Visibility(
                  visible: selectedonDelivery,
                  child: DeliveryWidget(),
                ),
                Visibility(
                  visible: selectedonCollection,
                  child: CollectionWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
