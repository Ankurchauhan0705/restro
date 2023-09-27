import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class GPS extends StatefulWidget {
  const GPS({super.key});

  @override
  State<GPS> createState() => _GPSState();
}

class _GPSState extends State<GPS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(onTap: (){
          Navigator.pop(context);
        },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text(
            "GPS Coupon",
            style:Theme.of(context).
            textTheme.
            titleLarge?.copyWith(
                fontSize: 18,fontWeight: FontWeight.w600)
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text("Not Found",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w600,fontSize: 22,color:Colors.black,
                  fontFamily: GoogleFonts.outfit().fontFamily
                ),),
            )
          ],
        ),
      ),
    );
  }
}
