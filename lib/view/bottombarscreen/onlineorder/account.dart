import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/onlineorder.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(onTap: (){
            Get.to(()=>OnlineOrder());
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => OnlineOrder(),
            //     ));
          },
            child: Image.asset("assets/images/backbutton.png"),
          ),
          title: Text("Account",
              style:Theme.of(context).
              textTheme.titleLarge?.copyWith(
                  fontSize: 18,fontWeight: FontWeight.w600)
          ),
          centerTitle: true,
        ),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.only(right: 20,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.03),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5)
                ),
                child: ListTile(
                  horizontalTitleGap: 0,
                  onTap: () {},
                  leading:ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/loco2.png',
                        width: 25, height: 25
                    ),
                  ),
                  minLeadingWidth :35,
                  title: Text("Past Orders",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12,
                        fontFamily: GoogleFonts.outfit().fontFamily
                    ),
                  ),
                ),
              ),
              SizedBox(height: height*0.01),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF5F5F5)
                ),
                child: ListTile(
                  horizontalTitleGap:0,
                  onTap: () {

                  },
                  leading:ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/loco.png',
                        width: 25, height: 25
                    ),
                  ),
                  minLeadingWidth :35,
                  title: Text(
                    "My Address",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,fontWeight: FontWeight.w600,fontSize: 12,
                      fontFamily: GoogleFonts.outfit().fontFamily
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
