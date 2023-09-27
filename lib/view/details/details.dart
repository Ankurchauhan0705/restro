// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:the29029restaurant/view/details/card.dart';
// import 'package:the29029restaurant/widgets/my_button.dart';
//
// class Detalis extends StatefulWidget {
//   const Detalis({super.key});
//
//   @override
//   State<Detalis> createState() => _DetalisState();
// }
//
// class _DetalisState extends State<Detalis> {
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading:IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.chevron_left,
//               color: Color(0xff911FDA),
//             )),
//         title: Text("Detalis",
//             style:Theme.of(context).
//             textTheme.
//             titleLarge?.copyWith(
//                 fontSize: 18,fontWeight: FontWeight.w600)
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: Container(
//               height: 360,width: 300,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Color(0xffF5F5F5)
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                        SizedBox(height:height*0.03),
//                     CircleAvatar(
//                       backgroundImage:AssetImage("assets/images/detail.png"),
//                       radius: 80,
//                     ),
//                     SizedBox(height:height*0.02),
//                     Text("Piyaza Chicken",style: Theme.of(context).
//                     textTheme.
//                     displayMedium?.copyWith(
//                         fontSize: 22,color: Colors.black,fontWeight: FontWeight.w600,
//                       fontFamily: GoogleFonts.outfit().fontFamily
//                     ),),
//                     SizedBox(height:height*0.01),
//                     Text(" strip of Corn Fed Chicken breast cooked\n "
//                         "in a jalifrasiee style sauce with onion and\n"
//                         " green chilies, accompanied with light\n herbed rice.",
//                     textAlign: TextAlign.center
//                     ,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         color: Color(0xff9796A1),fontWeight: FontWeight.w300,fontSize: 14,
//                         fontFamily: GoogleFonts.outfit().fontFamily
//                       ),
//                     ),
//                     SizedBox(height: height*0.02),
//                   Text.rich( TextSpan(
//                      children: [
//                        WidgetSpan(
//                          child: Image.asset("assets/images/sing.png"),
//                        ),
//                        TextSpan(
//                          text: '11.55',style: Theme.of(context).textTheme.displayLarge?.copyWith(
//                          color: Color(0xff911FDA),fontSize: 24,fontWeight: FontWeight.w700,
//                          fontFamily: GoogleFonts.outfit().fontFamily
//                        )),
//                      ]
//                   ),
//                   ),
//                  SizedBox(height: height*0.01)
//                   ],
//                 ),
//               ),
//
//             ),
//             SizedBox(height: height*0.03),
//             MyButton(title:"Add To Card", onTap:(){
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>CardD(),
//                   ));
//             },
//                 height: 50, width:200),
//
//             SizedBox(height: height*0.03),
//
//             MyButton(title:"Buy Now", onTap:(){},
//                 height: 50, width:200)
//
//           ],
//         ),
//       ),
//     );
//   }
// }
