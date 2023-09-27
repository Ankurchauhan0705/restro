import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/welcome.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height*0.06,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginPage());
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: height*0.036,
                          width: width*0.14,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              "Skip",
                              style: Theme.of(context).textTheme. bodyLarge?.copyWith(
                                fontSize: 14,color: Color(0xff41004C),fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.outfit().fontFamily
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: height*0.06,
                    ),
                    Text(
                      "Welcome to",
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.outfit().fontFamily
                      ),
                    ),
                    SizedBox(
                      height: height*0.01,
                    ),
                    Text(
                      "The 29029 Restaurant",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,fontWeight: FontWeight.w600,fontSize: 40,
                        fontFamily: GoogleFonts.outfit().fontFamily
                      ),
                    ),
                    SizedBox(
                        height: height*0.01,
                       ),
                    Text(
                      "Contemparary indian and\nNepaless Cuisine",
                      textWidthBasis: TextWidthBasis.parent,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,fontWeight:FontWeight.w400,fontSize:18,
                        fontFamily: GoogleFonts.outfit().fontFamily
                      ),
                    ),
                    Spacer(),

                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(()=>LoginPage() );
                          },
                          style: ElevatedButton.styleFrom(
                            side:
                                BorderSide(color: Colors.white, width: 2),
                            backgroundColor: Color.fromRGBO(255,255,255,0.21),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                           fixedSize: Size(width*0.8, height*0.07,)
                           // fixedSize: Size(315, 54),
                          ),
                          child: Text(
                            'Start with email or phone',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,fontSize: 17,fontWeight: FontWeight.w400,
                              fontFamily: GoogleFonts.outfit().fontFamily
                            ),
                          )),
                    ),
                    SizedBox(
                    height: height*0.02,
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          child:
                              Divider(indent: 35, color: Colors.white)),
                      Text(
                        "  sign in with  ",
                       style: Theme.of(context).textTheme.titleMedium?.copyWith(
                         fontWeight: FontWeight.w400,color: Colors.white,fontSize: 16,
                         fontFamily: GoogleFonts.outfit().fontFamily
                       ),
                      ),
                      Expanded(
                          child: Divider(
                              endIndent: 35, color: Colors.white)),
                    ]),
                    SizedBox(
                      height: height*0.02,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                              "assets/images/facebook.png"),
                        SizedBox(
                          width: width*0.038,
                        //   width: 20
                        ),
                        Image.asset("assets/images/google.png")
                      ],
                    ),
                  SizedBox(
                    height: height*0.1,
                  )
                  ]
              )
          )
        ],
      ),
    );
  }
}
