// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:the29029restaurant/widgets/my_button.dart';
// class CardD extends StatefulWidget {
//   const CardD({super.key});
//
//   @override
//   State<CardD> createState() => _CardDState();
// }
//
// class _CardDState extends State<CardD> {
//   int _counter = 00;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//   void _decrementCounter() {
//     setState(() {
//       _counter--;
//     });
//   }
//   var _formKey = GlobalKey<FormState>();
//   void _submit() {
//     final isValid = _formKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     _formKey.currentState!.save();
//   }
//
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
//         title: Text("Card",
//             style:Theme.of(context).
//             textTheme.
//             titleLarge?.copyWith(
//                 fontSize: 18,fontWeight: FontWeight.w600)
//         ),
//         centerTitle: true,
//       ),
//       body: Form(
//         key:_formKey ,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(right: 20,left: 20),
//             child: SafeArea(
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  SizedBox(height:height*0.03),
//                  Align(
//                    alignment: Alignment.topRight,
//                    child: InkWell(
//                      onTap: () {
//
//                      },
//                      child: ClipRRect(
//                        borderRadius: BorderRadius.circular(20.0),
//                        child: Image.asset('assets/images/corss.png',
//                            width: width * 0.04, height: height * 0.04),
//                      ),
//                    ),
//                  ),
//
//                  ListTile(
//                    horizontalTitleGap: 5,
//                    leading:  CircleAvatar(
//                      backgroundImage: AssetImage("assets/images/cardd.png"),
//                      radius: 30,
//                    ),
//                    title: Text("Piyaza Chicken",style:
//                      Theme.of(context).textTheme.titleLarge?.copyWith(
//                        color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600,
//                        fontFamily: GoogleFonts.outfit().fontFamily
//                      ),),
//                    subtitle: Text("Strips of Corn Fed Chicken breast...",style:
//                      Theme.of(context).textTheme. bodyLarge?.copyWith(
//                        fontFamily: GoogleFonts.outfit().fontFamily,
//                        fontWeight: FontWeight.w300,fontSize: 14,color: Color(0xff8C8A9D)
//                      ),),
//
//                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(left:80),
//                    child: Text.rich( TextSpan(
//                        children: [
//                          WidgetSpan(
//                            child: Image.asset("assets/images/sing.png"),
//                          ),
//                          TextSpan(
//                              text: '11.55',
//                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                                color: Color(0xff911FDA),fontWeight:FontWeight.w600,fontSize: 16,
//                                fontFamily: GoogleFonts.outfit().fontFamily
//                            ),
//                          ),
//                        ]
//                    ),
//                    ),
//                  ),
//
//
//                 Padding(
//                   padding: const EdgeInsets.only(left: 80),
//                   child: Text.rich(
//                     TextSpan(
//                       children: [
//                         WidgetSpan(
//                           child: GestureDetector( onTap: (){
//                             _decrementCounter();
//                           }, child: Icon(Icons.remove_circle_rounded,
//                             color:Color(0xff41004C),))
//                         ),
//                         TextSpan(
//                           text: '$_counter',
//                           style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                             color: Colors.black,fontWeight:FontWeight.w600,fontSize: 16,
//                             fontFamily: GoogleFonts.outfit().fontFamily
//                           ),
//                         ),
//                         WidgetSpan(
//                           child: GestureDetector( onTap: (){
//                             _incrementCounter();
//                           },
//                               child: Icon(Icons.add_circle,
//                                   color:Color(0xff41004C)))
//                         ),
//                       ]
//                     )
//                   ),
//                 ),
//
//                  SizedBox(height: height*0.05),
//                  Text("Specific Instructions/Table Number",style:
//                    Theme.of(context).textTheme. titleMedium?.copyWith(
//                      color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500,
//                      fontFamily:GoogleFonts.outfit().fontFamily
//                    ),),
//                  SizedBox(height: height*0.01),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                     filled: true,
//                     fillColor:Color(0xffDCDCD),
//                     hintText: "Enter Specific instructions/table number",
//                     hintStyle: TextStyle(
//                       fontWeight: FontWeight.w300,
//                       color: Color(0xff9796A1),
//                       fontSize: 14,
//                       fontFamily: GoogleFonts.outfit().fontFamily,
//                     ),
//                     contentPadding: EdgeInsets.fromLTRB(20,50,20,50),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(color: Colors.black))),
//                 onFieldSubmitted: (value) {},
//                 validator: (value) {
//                   if (value!.isEmpty ||
//                       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                           .hasMatch(value)) {
//                     return 'enter the instructions/table number';
//                   }
//                   return null;
//                 },
//               ),
//
//                  // Container(
//                  //   height: 100,width: 300,
//                  //   decoration: BoxDecoration(
//                  //     borderRadius: BorderRadius.circular(10),
//                  //     //color: Color(0xffDCDCD)
//                  //     color: Color.fromRGBO(233, 233, 233, 0.25)
//                  //   ),
//                  //   child: Center(child: Text("Enter Specific instrucation/table number",style:
//                  //     Theme.of(context).textTheme.bodyLarge?.copyWith(
//                  //       color: Color(0xff9796A1),fontSize: 14,fontWeight: FontWeight.w300,
//                  //       fontFamily: GoogleFonts.outfit().fontFamily
//                  //     ),)),
//                  // ),
//                  SizedBox(height: height*0.05,),
//                  Center(
//                    child: MyButton(title:"Checkout",
//                        onTap:(){
//                          _submit();
//                        },
//                        height: 50, width: 200),
//                  )
//                ],
//              ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
