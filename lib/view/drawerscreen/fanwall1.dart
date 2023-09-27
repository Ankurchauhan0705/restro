import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

class FanWall1 extends StatefulWidget {
  const FanWall1({super.key});

  @override
  State<FanWall1> createState() => _FanWall1State();
}

class _FanWall1State extends State<FanWall1> {
  var choose =2 ;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container( height: height*0.15, width: width,
            color: Color(0xffF5F5F5),
                child: Column(
                  children: [
                    ListTile(
                      leading:  CircleAvatar(
                        radius: 25,
                        backgroundImage:
                        AssetImage("assets/drawericon/user.png"),
                      ),
                      title:Text("Hector Hickmott",style:
                        Theme.of(context).
                        textTheme.
                        bodyLarge),
                      subtitle: Text("Very tasty! yum",style:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Color(0xff9796A1),fontWeight: FontWeight.w300
                        ),),
                      trailing: Text("4 years ago",style:
                        Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Color(0xff9796A1),fontWeight:FontWeight.w300,
                          fontFamily: GoogleFonts.outfit().fontFamily
                        ),),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:150),
                      child: MyButton(
                          bgColor: Color(0xff41004C),
                          title: "Reply",
                          onTap: () { },
                          height:height*0.031 ,
                          width: width*0.21),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.02),
              Container(
                height: height*0.15,
                //height:116,
                width: width,

                color: Color(0xffF5F5F5),
                child: Column(
                  children: [
                    ListTile(
                      leading:  CircleAvatar(
                        radius: 25,
                        backgroundImage:
                        AssetImage("assets/drawericon/user.png"),
                      ),
                      title:Text("Hector Hickmott",style:
                      Theme.of(context).
                      textTheme.
                      bodyLarge),
                      subtitle: Text("Very tasty! yum",style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Color(0xff9796A1),fontWeight: FontWeight.w300
                      ),),
                      trailing: Text("4 years ago",style:
                      Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Color(0xff9796A1),fontWeight:FontWeight.w300,
                          fontFamily: GoogleFonts.outfit().fontFamily
                      ),),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:150),
                      child: MyButton(
                          bgColor: Color(0xff41004C),
                          title: "Reply",
                          onTap: () { },
                          height:height*0.031 ,
                        width: width*0.21,
                      //    height:25,
                        //  width: 80
                      ),
                    ),
                  ],
                ),
              ),

           SizedBox(height: height*0.2),
              Center(
                child: MyButton(
                    bgColor: Color(0xff41004C),
                    title: "Post Comment",
                  txtStyle: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: GoogleFonts.outfit().fontFamily),
                    onTap: () { },
                  height: height*.07,
                  width: width*0.5,),
              ),
              SizedBox(height: height*0.03)
            ],
          ),
        ),
      ),
    );
  }
}
