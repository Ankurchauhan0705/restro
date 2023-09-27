import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FanWall2 extends StatefulWidget {
  const FanWall2({super.key});

  @override
  State<FanWall2> createState() => _FanWall2State();
}

class _FanWall2State extends State<FanWall2> {
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
           //crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: height * 0.02),
             Center(
               child: Text("Not Found",style:
               Theme.of(context).textTheme.displayMedium?.copyWith(
                   fontWeight: FontWeight.w600,fontSize: 22,color:Colors.black,
                   fontFamily: GoogleFonts.outfit().fontFamily
               ),),
             ),
             SizedBox(height: height*0.2)
           ],
         ),
       ),
      ),
    );
  }
}
