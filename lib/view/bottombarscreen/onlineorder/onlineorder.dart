import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/account.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/categories.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/onlinelocation.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/widgets/my_button.dart';
import 'package:get/get.dart';

import '../../animation_screen.dart';

class OnlineOrder extends StatefulWidget {
  const OnlineOrder({super.key});

  @override
  State<OnlineOrder> createState() => _OnlineOrderState();
}

class _OnlineOrderState extends State<OnlineOrder> {
  @override
  void initState() {
    super.initState();
    fetchCartItemCount();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(() => TabScreen(index: 0));
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Online Order",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
                onTap: () {
                  Get.to(() => Account());

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Account(),
                  //     ));
                },
                child: Image.asset("assets/images/onlineaccount.png",
                    height: 25, width: 25)),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.06),
          Image.asset("assets/images/Orderfood.png"),
          SizedBox(height: height * 0.02),
          Text("Start Your Order",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.outfit().fontFamily)),
          SizedBox(height: height * 0.01),
          Text(
              "Lorem Ipsum is simple dummy text of\nthe printing and typesetting industry.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff9796A1),
                    fontFamily: GoogleFonts.outfit().fontFamily,
                  )),
          SizedBox(height: height * 0.03),
          Center(
            child: MyButton(
                bgColor: Color(0xff41004C),
                title: "Start Order",
                txtStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: GoogleFonts.outfit().fontFamily),
                onTap: () {
                  // Get.to( LocationUi());
                  Get.to(() => Categories());
                },
                height: height * .07,
                width: width * 0.5),
          ),
        ],
      ),
    );
  }
}
