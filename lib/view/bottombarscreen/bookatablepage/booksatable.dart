import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/bookatablepage/pastwidget.dart';
import 'package:the29029restaurant/view/bottombarscreen/bookatablepage/schedulereservation.dart';
import 'package:the29029restaurant/view/bottombarscreen/bookatablepage/upcomingwidget.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/widgets/my_button.dart';
import 'package:get/get.dart';

import '../../../view_models/controller/bookatable/past_controller.dart';
import '../../../view_models/controller/bookatable/upcoming_controller.dart';

RxString Tabbuttonbooksatable=''.obs;
class BookATable extends StatefulWidget {
  const BookATable({super.key});

  @override
  State<BookATable> createState() => _BookATableState();
}

class _BookATableState extends State<BookATable> {

  Past_controller past_controller=Get.put(Past_controller());
  Upcoming_controller upcoming_controller = Get.put(Upcoming_controller());

  @override
  void initState() {
    upcoming_controller.Upcoming_apihit();
    past_controller.Past_apihit();
    // TODO: implement initState
    super.initState();
  }


  bool click = true;
  bool click1 =true;
  var choose =1 ;

  bool selecteupcoming = false;
  bool selectedpast = false;

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
            Get.offAll(()=>TabScreen(index:0));

          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Book A Table",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SafeArea(
        child:SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/images/dinnertable.png")),
              SizedBox(height: height*0.01),
              Text("Book Your Table",
                style:Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.outfit().fontFamily) ,
              ),
              SizedBox(height: height*0.005),
              Text("Lorem lpsum is simply dummy text of the\n printing and typesetting industry.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Color(0xff9796A1),fontSize: 14,fontWeight: FontWeight.w300,
                    fontFamily: GoogleFonts.outfit().fontFamily
                ),),
              SizedBox(height: height*0.05),
              MyButton( bgColor: Color(0xff41004C),
                  title:"Schedule Reservation",
                  txtStyle: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: GoogleFonts.outfit().fontFamily),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>ScheduleReservation(),
                        ));
                  },       height: height*.07,
                  width: width*0.5),
              SizedBox(height: height*0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(title:"Upcoming",
                      txtStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: choose == 1 ? Colors.white : Color(0xff911FDA),
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      bgColor:choose == 1 ?Color(0xff911FDA): Colors.white,
                      side: BorderSide(color:Color(0xff911FDA),),
                      onTap:(){
                        Tabbuttonbooksatable.value='upcoming';
                        choose = 1;
                        setState(() {
                          if (selecteupcoming) {
                            selecteupcoming = false;
                          } else {
                            selecteupcoming = true;
                            selectedpast = false;
                          }
                        });
                        // setState(() {
                        //   Get.to(UpcomingWidget());
                        //   // click = !click;
                        // });
                      },
                      height:height*0.041 ,width:width*0.25),
                  SizedBox(width: width*0.05),
                  MyButton(title:"Past",
                      txtStyle:Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: choose == 2 ? Colors.white : Color(0xff911FDA),
                          fontFamily: GoogleFonts.outfit().fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      bgColor:choose == 2 ?Color(0xff911FDA): Colors.white,
                      side: BorderSide(color:Color(0xff911FDA),),
                      onTap:(){
                        Tabbuttonbooksatable.value='Past';
                        choose = 2;
                        setState(() {
                          if (selectedpast) {
                            selectedpast = false;
                          } else {
                            selectedpast = true;
                            selecteupcoming =false;
                          }
                        });
                        // setState(() {
                        //   Get.to(PastWidget());
                        //   // click = !click;
                        // });
                      },
                      height:height*0.041 ,width:width*0.25 ),

                ],
              ),
              SizedBox(height: height * 0.06),

              // if (selectedpast == false &&
              //     selecteupcoming == false)
              //
              //   MyButton(
              //       bgColor: Color(0xff41004C),
              //       title: "Choose Items",
              //       txtStyle: Theme.of(context)
              //           .textTheme
              //           .titleMedium
              //           ?.copyWith(
              //           fontSize: 15,
              //           fontWeight: FontWeight.w600,
              //           color: Colors.white,
              //           fontFamily: GoogleFonts.outfit().fontFamily),
              //       onTap: () {
              //         choose = 1;
              //         setState(() {
              //           if (selecteupcoming) {
              //             selecteupcoming = false;
              //           } else {
              //             selecteupcoming = true;
              //             selectedpast = false;
              //           }
              //         });
              //       },
              //       height: height * .07,
              //       width: width * 0.5),


              Visibility(
                visible: selectedpast,
                child: PastWidget(),
              ),
              Visibility(
                visible: selecteupcoming,
                child: UpcomingWidget(),
              ),



            ],
          ),
        ), ),


      ),
    );
  }
}
