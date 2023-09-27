import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/bookatablepage/booksatable.dart';
import 'package:the29029restaurant/view/bottombarscreen/bookatablepage/schedulereservation2.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/widgets/my_button.dart';


class ScheduleReservation extends StatefulWidget {
  const ScheduleReservation({super.key});

  @override
  State<ScheduleReservation> createState() => _ScheduleReservationState();
}

class _ScheduleReservationState extends State<ScheduleReservation> {
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
            Get.to(() => TabScreen(index: 2));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => BookATable(),
            //     ));
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Schedule Reservation",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height*0.01),
              Center(child: Image.asset("assets/images/location.png")),
              SizedBox(height: height*0.05),
              Text("The 29029 Restaurant\n Wareham",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.outfit().fontFamily
              ),),
              SizedBox(height: height*0.005),
              Text("Sandford Rd, Sandford, Wareham BH20\n7DD,United Kingdom",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Color(0xff9796A1),fontSize: 14,fontWeight: FontWeight.w300,
                    fontFamily: GoogleFonts.outfit().fontFamily
                ),),
              SizedBox(height: height*0.05),
              MyButton( bgColor: Color(0xff41004C),title:"Continue",
                  txtStyle: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: GoogleFonts.outfit().fontFamily),
                  onTap: (){
                Get.to(()=> ScheduleReservation2());
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) =>ScheduleReservation2(),
                //     ));
              },    height: height*.07,
                  width: width*0.5),
            ],
          ),
        ),
      ),
    );
  }
}
