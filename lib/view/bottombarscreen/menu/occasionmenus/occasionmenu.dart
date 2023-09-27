import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class Occasionmenu extends StatefulWidget {
  const Occasionmenu({super.key});

  @override
  State<Occasionmenu> createState() => _OccasionmenuState();
}

class _OccasionmenuState extends State<Occasionmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Take Away Menu",
            style: Theme
                .of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          // Icon(
          //   Icons.search,
          //   size: height * 0.04,
          //   weight: width,
          //   color: Color(0XFF911fda),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              child:Center(child:Text("No item",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18
              ),), ),

            )
          ],
        ),
      ),
    );
  }
}
