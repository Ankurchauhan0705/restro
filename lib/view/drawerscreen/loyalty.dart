// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:the29029restaurant/widgets/my_button.dart';
// class Loyalty extends StatefulWidget {
//   const Loyalty({super.key});
//
//   @override
//   State<Loyalty> createState() => _LoyaltyState();
// }
//
// class _LoyaltyState extends State<Loyalty> {
//
//   String dropdownvalue = 'Your Activity 1';
//   var items = [
//     'Your Activity 1',
//     'Your Activity 2',
//     'Your Activity 3',
//     'Your Activity 4',
//     'Your Activity 5',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: GestureDetector(onTap: (){
//           Navigator.pop(context);
//         },
//           child: Image.asset("assets/images/backbutton.png"),
//         ),
//         title: Text(
//             "Loyalty",
//             style:Theme.of(context).
//             textTheme.
//             titleLarge?.copyWith(
//                 fontSize: 18,fontWeight: FontWeight.w600)
//         ),
//         centerTitle: true,
//       ),
//      body: SafeArea(
//        child: Padding(
//          padding: const EdgeInsets.only(right: 20,left: 20),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: [
//              SizedBox(height: height * 0.02),
//              Image.asset("assets/drawericon/mask.png"),
//              SizedBox(height: height * 0.05),
//
//              Padding(
//                padding: const EdgeInsets.only(right: 20,left: 20),
//                child: Container(
//                  width: width*0.8,
//                  height: height*0.4,
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(10),
//                    color: Color(0xffF5F5F5)
//                  ),
//                    child: Column(
//                      children: [
//                        SizedBox(height: height*0.05),
//                        Image.asset("assets/drawericon/conf.png"),
//
//                SizedBox(height: height * 0.01),
//                Text(
//                  "Congratulations",
//                  style: Theme.of(context)
//                      .textTheme
//                      . headlineMedium
//                      ?.copyWith(fontSize: 20,
//                      fontWeight: FontWeight.w600,
//                  color: Colors.black),
//                ),
//                SizedBox(height: height * 0.01),
//                Text("You have unlocked the reward!",style:
//                  Theme.of(context).textTheme.bodyLarge?.copyWith(
//                    color: Color(0xff9796A1),
//                  )),
//                SizedBox(height: height * 0.03),
//                Text("Redeem to reuse this loyalty card.",
//                    style:
//                  Theme.of(context).textTheme.labelSmall?.copyWith(
//                      color: Color(0xff9796A1),fontSize: 10,
//                      fontFamily: GoogleFonts.outfit().fontFamily,
//                      fontWeight: FontWeight.w600)),
//                SizedBox(height: height*0.03),
//                MyButton(
//                    bgColor: Color(0xff41004C),
//                    title: "Redeem",
//                    txtStyle: Theme.of(context)
//                        .textTheme
//                        .titleMedium
//                        ?.copyWith(
//                        fontSize: 15,
//                        fontWeight: FontWeight.w600,
//                        color: Colors.white,
//                        fontFamily: GoogleFonts.outfit().fontFamily),
//                    onTap: () { },
//                  height: height*.07,
//                  width: width*0.5,),
//
//                      ],
//                    ),
//                ),
//              ),
//              SizedBox(height: height*0.05),
//             Padding(
//               padding: const EdgeInsets.only(right: 24,left: 24),
//               child: DropdownButtonFormField(value: dropdownvalue,
//                   icon: const Icon(Icons.keyboard_arrow_down,
//                       color: Color(0xff41004C)),
//                   items: items.map((String items) {
//                     return DropdownMenuItem(
//                       value: items,
//                       child: Text(items),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       dropdownvalue = newValue!;
//                     });
//                   },
//                 decoration:
//                 InputDecoration(
//                     enabledBorder:  OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide:
//                         BorderSide(color: Color(0xffF5F5F5))),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide:
//                         BorderSide(color: Color(0xffF5F5F5))),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: BorderSide(color: Color(0xffF5F5F5))),
//                     // border: OutlineInputBorder(
//                     //     borderRadius: BorderRadius.circular(30),
//                     //     borderSide: BorderSide(color: Color(0xffF5F5F5))),
//                     contentPadding: EdgeInsets.fromLTRB(20,10,20,10),
//                     filled: true,
//                     fillColor: Color(0xffF5F5F5),
//               )
//               ),
//             )
//            ],
//          ),
//        ),
//      ),
//     );
//   }
// }
