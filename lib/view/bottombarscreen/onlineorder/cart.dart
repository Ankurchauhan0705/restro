import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/details.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/onlinelocation.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

import '../../animation_screen.dart';
import 'cart2.dart';

RxBool clearcart = false.obs;
RxDouble totalPrice = (0.0).obs;

class Card_Page extends StatefulWidget {
  String image;
  String titlename;
  String distitle;
  String price;
  String productId;

  Card_Page(
      {required this.productId,
      required this.image,
      required this.titlename,
      required this.distitle,
      required this.price,
      super.key});

  @override
  State<Card_Page> createState() => _Card_PageState();
}

class _Card_PageState extends State<Card_Page> {
  var count = 1;
  var result = 1;
  var tap = 0;

  // var listdata = li;

  List li = [
    {
      'image': 'assets/drawericon/avocado sandwich (1).png',
      'head': 'Plain Naam',
      'subhead': "Strips of Corn Fed Chicken breast...",
    }
  ];

  @override
  void initState() {
    print(widget.price);
    Map<String, dynamic> newMap = {
      "product_id": widget.productId,
      "quantity": '1'
    };
    newListOfMaps.value.clear();
    newListOfMaps.value.add(newMap);

    totalPrice = (double.parse(widget.price)).obs;
    super.initState();
    fetchCartItemCount();
  }

  @override
  void dispose() {
    fetchCartItemCount();

    super.dispose();
  }

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
            Get.back();
            // Get.to(() => Detalis());
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Cart",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: height * 0.3,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: li.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start, //keya h mniy
                            children: [
                              Image.asset(li[index]['image']
                                  //'assets/drawericon/avocado sandwich (1).png'
                                  ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: width * 0.035),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        //  color: Colors.redAccent,
                                        width: Get.width * 0.52,
                                        child: Text(
                                          widget.titlename,
                                          softWrap: true,
                                          //overflow:TextOverflow.ellipsis,
                                          //li[index]['head'],
                                          // 'Piyaza chicken',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: Color(0xff000000),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ),

                                      // SizedBox(width: width * 0.2),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            li.removeAt(index);
                                          });
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.close,
                                            color: Color(0xff41004C),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: width * 0.01),
                                  Container(
                                    //color: Colors.redAccent,
                                    width: Get.width * 0.5,
                                    //height: Get.height*0.06,
                                    child: Text(
                                      widget.distitle,
                                      //li[index]['subhead'],
                                      //"Strips of Corn Fed Chicken breast...",
                                      textAlign: TextAlign.start,
                                      maxLines: 3,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Color(0xff8C8A9D),
                                              fontSize: 12,
                                              //overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  SizedBox(height: width * 0.025),
                                  RichText(
                                      text: TextSpan(children: [
                                    WidgetSpan(
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 0),
                                        child: Text(
                                          "£",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontSize: 16,
                                                  color: Color(0xff911FDA),
                                                  fontFamily:
                                                      GoogleFonts.mulish()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                        text: widget.price,
                                        // "2.75",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: Color(0xff911FDA),
                                                fontSize: 16,
                                                fontFamily: GoogleFonts.outfit()
                                                    .fontFamily,
                                                fontWeight: FontWeight.w700))
                                  ])),
                                  SizedBox(height: height * 0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            tap = 1;
                                            if (count > 1) {
                                              totalPrice.value = totalPrice
                                                      .value -
                                                  double.parse(widget.price);
                                              count = count - 1;
                                            }
                                            result = count;
                                            setState(() {});
                                          },
                                          child: Container(
                                            child: tap == 1
                                                ? Icon(Icons.remove_circle,
                                                    color: Color(0xff41004c))
                                                : Icon(Icons
                                                    .remove_circle_outline),
                                          )),
                                      Container(
                                          child: result < 10
                                              ? Text(
                                                  "0$result",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          color:
                                                              Color(0xff000000),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                )
                                              : Text(
                                                  "$result",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          color:
                                                              Color(0xff000000),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                )),
                                      InkWell(
                                          onTap: () {
                                            tap = 2;
                                            totalPrice.value =
                                                totalPrice.value +
                                                    double.parse(widget.price);
                                            count = count + 1;
                                            result = count;
                                            setState(() {});
                                          },
                                          child: Container(
                                              child: tap == 2
                                                  ? Icon(Icons.add_circle,
                                                      color: Color(0xff41004c))
                                                  : Icon(Icons
                                                      .add_circle_outline)))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      })),
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                  leading: Text(
                    "Total",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        color: Color(0xff911FDA),
                        fontWeight: FontWeight.w700),
                  ),
                  trailing: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "£",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 18,
                          color: Color(0xff911FDA),
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                        text: totalPrice.value.toStringAsFixed(2),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 18,
                            color: Color(0xff911FDA),
                            fontWeight: FontWeight.w700))
                  ]))),
              SizedBox(height: height * 0.001),
              Text(
                "Specific instructions/table number",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: height * 0.01),
              TextFormField(
                //   controller: firstname,
                keyboardType: TextInputType.name,
                maxLines: 4,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFAFAFA),
                    hintText: "Enter Specific instructions/table number",
                    hintStyle: TextStyle(
                        color: Color(0xff9796A1),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        fontFamily: GoogleFonts.outfit().fontFamily),
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffDCDCDC))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffDCDCDC))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                onFieldSubmitted: (value) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter the reviews';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.05),
              Center(
                child: MyButton(
                    bgColor: Color(0xff41004C),
                    side: BorderSide(color: Color(0xff41004C)),
                    title: "Checkout",
                    txtStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: GoogleFonts.outfit().fontFamily),
                    onTap: () {
                      clearcart.value = true;
                      Map<String, dynamic> newMap = {
                        "product_id": widget.productId,
                        "quantity": result.toString()
                      };
                      newListOfMaps.value.clear();
                      newListOfMaps.value.add(newMap);
                      Get.to(onlinelocation());
                    },
                    height: height * .07,
                    width: width * 0.5),
              )
            ],
          ),
        )),
      ),
    );
  }
}
