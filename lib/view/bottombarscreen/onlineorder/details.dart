import 'dart:convert';
import 'package:badges/badges.dart' as b;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/cart2.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/itemsforstarters.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/cart.dart';
import 'package:the29029restaurant/view/login.dart';
import 'package:the29029restaurant/view_models/controller/categories_controller/singleitemproucted_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';
import 'package:http/http.dart' as http;
import '../../animation_screen.dart';

int varisationindex = 0;
String varisationID = '';
RxBool addtocard = true.obs;

String? cart_key;

List additem = [].obs;
RxBool showLoaderAfterAdding = false.obs;

class Detalis extends StatefulWidget {
  const Detalis({super.key});
  @override
  State<Detalis> createState() => _DetalisState();
}

class _DetalisState extends State<Detalis> {
  Singleitemproducted_Controller singleitemproducted_Controller =
      Get.put(Singleitemproducted_Controller());

  String selectedRadio = '';
  void setSelectedRadio(String value) {
    setState(() {
      selectedRadio = value;
    });
  }

// @override
//   void dispose() {
//   singleitemproducted_Controller
//       .userList.value
//       .singleProduct?.clear();
//
//     // TODO: implement dispose
//     super.dispose();
//   }

  void initState() {
    singleitemproducted_Controller.singleitemsprouductedapihit();
    super.initState();
  }

  @override
  void dispose() {
    addtocard.value = true;
    showLoaderAfterAdding.value = false;
    // TODO: implement dispose
    singleitemproducted_Controller.userList.value.singleProduct!.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      switch (singleitemproducted_Controller.rxRequestStatus.value) {
        case Status.LOADING:
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        case Status.ERROR:
          if (singleitemproducted_Controller.error.value == 'No internet') {
            return Scaffold(
              body: Center(
                child: InterNetExceptionWidget(
                  onPress: () {},
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: GeneralExceptionWidget(onPress: () {}),
              ),
            );
          }
        case Status.COMPLETED:
          return singleitemproducted_Controller
                  .userList.value.singleProduct!.isEmpty
              ? Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    leading: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset("assets/images/backbutton.png"),
                    ),
                    title: Text("Details",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    centerTitle: true,
                    actions: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => Card2());
                        },
                        child: Obx(() => Padding(
                              padding: EdgeInsets.only(right: 15, top: 5),
                              child: b.Badge(
                                  onTap: () {
                                    Get.to(() => Card2());
                                  },
                                  badgeContent: Text(
                                    iconcount.value.toString(),
                                    // "10",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontSize: 7,
                                            fontFamily: GoogleFonts.outfit()
                                                .fontFamily),
                                  ),
                                  badgeStyle:
                                      b.BadgeStyle(badgeColor: Colors.black),
                                  // position: b.BadgePosition.topEnd(top),
                                  child: Icon(
                                    size: 28,
                                    Icons.shopping_cart_outlined,
                                    color: Color(0xff911FDA),
                                  )),
                            )),
                      ),
                    ],
                  ),
                  body: SafeArea(
                      child: SingleChildScrollView(
                          child: Padding(
                    padding: EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.03),
                        Center(
                          child: Container(
                            height: height * 0.6,
                            width: width * 0.83,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xffF5F5F5)),
                            child: SingleChildScrollView(
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 10, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: height * 0.03),
                                        Container(
                                          height: height * 0.3,
                                          width: width * 0.6,
                                          child:
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/plateblanck.png",
                                                height: 200,
                                                width: 200,
                                              ),
                                              CircleAvatar(
                                                  radius: 80,
                                                  backgroundImage: NetworkImage(
                                                    singleitemproducted_Controller
                                                        .userList
                                                        .value
                                                        .singleProduct![0]
                                                        .productImg
                                                        .toString(),
                                                  )),
                                            ],
                                          ),

                                          // CircleAvatar(
                                          //   radius: 25,
                                          //   backgroundImage: NetworkImage(
                                          //     singleitemproducted_Controller.userList
                                          //         .value.singleProduct![0].productImg
                                          //         .toString(),
                                          //     // fit: BoxFit.fill,
                                          //   ),
                                          // )

                                          // Image.asset(
                                          //   "assets/drawericon/iii.png",
                                          //   fit: BoxFit.fill,
                                          // ),
                                        ),
                                        SizedBox(height: height * 0.02),
                                        Text(
                                          singleitemproducted_Controller
                                              .userList
                                              .value
                                              .singleProduct![0]
                                              .productTitle
                                              .toString(),
                                          maxLines: 3,
                                          //"Piyaza Chicken",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(
                                                  color: Color(
                                                    0xff32324D,
                                                  ),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: height * 0.02),
                                        Text(
                                          singleitemproducted_Controller
                                              .userList
                                              .value
                                              .singleProduct![0]
                                              .productDiscription
                                              .toString(),
                                          // "Strips of Corn Fed Chicken breast cooked \n"
                                          // "in a jalifrasiee style sauce with onion and \n"
                                          // "green chilies, accompanied with light\n"
                                          // "herbed rice.",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  color: Color(0xff9796A1),
                                                  fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(height: height * 0.03),
                                        if (singleitemproducted_Controller
                                                .userList
                                                .value
                                                .singleProduct![0]
                                                .productPrice !=
                                            "")
                                          RichText(
                                              text: TextSpan(children: [
                                            WidgetSpan(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                  "£ ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(
                                                          color:
                                                              Color(0xff911FDA),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .mulish()
                                                                  .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                ),
                                              ),
                                            ),
                                            TextSpan(
                                                text:
                                                    singleitemproducted_Controller
                                                        .userList
                                                        .value
                                                        .singleProduct![0]
                                                        .productPrice
                                                        .toString(),
                                                //"11.55",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge
                                                    ?.copyWith(
                                                        color:
                                                            Color(0xff911FDA),
                                                        fontSize: 24,
                                                        fontFamily:
                                                            GoogleFonts.outfit()
                                                                .fontFamily,
                                                        fontWeight:
                                                            FontWeight.w700))
                                          ]))
                                      ],
                                    ))),
                          ),
                        ),
                        SizedBox(height: height / 30),
                        singleitemproducted_Controller
                                    .userList.value.variations!.length ==
                                0
                            ? Container()
                            : Container(
                                height: Get.height * 0.3,
                                width: Get.height,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: singleitemproducted_Controller
                                        .userList.value.variations!.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          varisationindex = index;
                                          varisationID =
                                              singleitemproducted_Controller
                                                  .userList
                                                  .value
                                                  .variations![index]
                                                  .varisationID
                                                  .toString();
                                          print(varisationID);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                              right: 3,
                                              left: 3,
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: Get.width * 0.4,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 5, left: 5),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        varisationindex = index;

                                                        setState(() {
                                                          selectedRadio =
                                                              singleitemproducted_Controller
                                                                  .userList
                                                                  .value
                                                                  .variations![
                                                                      index]
                                                                  .varisationTitle
                                                                  .toString();

                                                          varisationID =
                                                              singleitemproducted_Controller
                                                                  .userList
                                                                  .value
                                                                  .variations![
                                                                      index]
                                                                  .varisationID
                                                                  .toString();
                                                          print(varisationID);
                                                        });
                                                      },
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.035),
                                                          Container(
                                                            height: Get.height *
                                                                0.15,
                                                            child:
                                                            Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Image.asset(
                                                                  "assets/images/plateblanck.png",
                                                                  height: 170,
                                                                  width: 170,
                                                                ),
                                                                CircleAvatar(
                                                                    radius: 50,
                                                                    backgroundImage: NetworkImage(
                                                                      singleitemproducted_Controller
                                                                          .userList
                                                                          .value
                                                                          .singleProduct![0]
                                                                          .productImg
                                                                          .toString(),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.01),
                                                          Text(
                                                            singleitemproducted_Controller
                                                                .userList
                                                                .value
                                                                .variations![
                                                                    index]
                                                                .varisationTitle
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 3,
                                                            softWrap: true,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall
                                                                ?.copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "£" +
                                                                singleitemproducted_Controller
                                                                    .userList
                                                                    .value
                                                                    .variations![
                                                                        index]
                                                                    .varisationPrice
                                                                    .toString(),
                                                            maxLines: 1,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelSmall
                                                                ?.copyWith(
                                                                    color: Color(
                                                                        0xff911FDA),
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  left: 110,
                                                  child: Radio(
                                                      value:
                                                          singleitemproducted_Controller
                                                              .userList
                                                              .value
                                                              .variations![
                                                                  index]
                                                              .varisationTitle
                                                              .toString(),
                                                      groupValue: selectedRadio,
                                                      activeColor:
                                                          Color(0xff911FDA),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          // Update the selectedRadio when a radio button is tapped
                                                          selectedRadio =
                                                              value.toString();
                                                          varisationID =
                                                              singleitemproducted_Controller
                                                                  .userList
                                                                  .value
                                                                  .variations![
                                                                      index]
                                                                  .varisationID
                                                                  .toString();
                                                          print(varisationID);
                                                        });
                                                      }),
                                                )
                                              ],
                                            )),
                                      );
                                    }),
                              ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Row(
                          children: [],
                        ),
                        showLoaderAfterAdding.value
                            ? CircularProgressIndicator()
                            : MyButton(
                                bgColor: Color(0xff41004C),
                                side: BorderSide(color: Color(0xff41004C)),
                                title: addtocard.value
                                    ? "Add to Cart"
                                    : "Go to Cart",
                                txtStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontFamily:
                                            GoogleFonts.outfit().fontFamily),
                                onTap: () async {
                                  !addtocard.value
                                      ? () {}
                                      : showLoaderAfterAdding.value = true;
                                  print(iconcount.value.toString());
                                  // Get.to(() => addtocard? Card2() :);
                                  if (addtocard.value) {
                                    await addItemToCart();
                                    setState(() {
                                      // addtocard.value = false;
                                    });
                                  } else {
                                    Get.to(() => Card2());
                                    Future.delayed(Duration(seconds: 1), () {
                                      addtocard.value = true;
                                    });
                                  }
                                },
                                height: height * .07,
                                width: width * 0.5),
                        SizedBox(height: height / 59),
                        MyButton(
                            bgColor: Color(0xff911FDA),
                            side: BorderSide(color: Color(0xff911FDA)),
                            title: "Buy Now",
                            txtStyle: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily),
                            onTap: () {
                              Get.to(() => Card_Page(
                                    price: varisationID == ''
                                        ? singleitemproducted_Controller
                                            .userList
                                            .value
                                            .singleProduct![0]
                                            .productPrice
                                            .toString()
                                        :

                                    singleitemproducted_Controller
                                            .userList
                                            .value
                                            .variations![varisationindex]
                                            .varisationPrice
                                            .toString(),
                                    image: singleitemproducted_Controller
                                        .userList
                                        .value
                                        .singleProduct![0]
                                        .productImg
                                        .toString(),
                                    distitle: singleitemproducted_Controller
                                        .userList
                                        .value
                                        .singleProduct![0]
                                        .productDiscription
                                        .toString(),
                                    titlename: varisationID == ''
                                        ? singleitemproducted_Controller
                                            .userList
                                            .value
                                            .singleProduct![0]
                                            .productTitle
                                            .toString()
                                        : singleitemproducted_Controller
                                            .userList
                                            .value
                                            .variations![varisationindex]
                                            .varisationTitle
                                            .toString(),
                                    productId: varisationID == ''
                                        ? itemcategiorscategoryid.toString()
                                        : varisationID.toString(),
                                  ));
                            },
                            height: height * .07,
                            width: width * 0.5),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                      ],
                    ),
                  ))),
                );
      }
    });
  }

  // Future<void> addToCart() async {
  //   print("cart item");
  //     String username = loginemail.toString();
  //     String password = loginPassword.toString();
  //     String basicAuth =
  //         'Basic ' + base64.encode(utf8.encode('$username:$password'));
  //     print(username);
  //     print(password);
  //     print(basicAuth);
  //
  //
  //
  //   final url = 'https://www.the29029restaurant.com/wp-json/cocart/v2/cart/add-item';
  //
  //   final headers = {
  //     // 'Cookie': 'service_date=2023-08-11; ...', // Add your full Cookie header here
  //     'Authorization':basicAuth, // Add your Authorization header here
  //   };
  //
  //   final body = {'id': itemcategiorscategoryid}; // Replace with the appropriate item ID
  //
  //   final response = await http.post(Uri.parse(url), headers: headers, body: body);
  //
  //   if (response.statusCode == 200) {
  //     print('Item added to cart successfully');
  //   } else {
  //     print('Failed to add item to cart: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //   }
  // }
//item to add cart scree
  Future<void> addItemToCart() async {
    print(passwordsp);
    String username = userEmailsp.toString();
    String password = passwordsp.toString();
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));

    print(username);
    print(varisationID);
    print(itemcategiorscategoryid);
    final String url =
        'https://www.the29029restaurant.com/wp-json/cocart/v2/cart/add-item';
    final Map<String, String> headers = {
      'authorization': basicAuth,
      // 'Cookie': 'service_date=2023-08-11; woocommerce_cart_hash=2af8bac0c0d60223701c3bfc7d6fa480; woocommerce_items_in_cart=1; wp_cocart_session_78909a3cd8e3a8e30c136df187a801eb=ab28923678b64a52570a9f414cd93a34%7C%7C1692333597%7C%7C1692247197%7C%7C6514497bd897759512424ad1dcb438f5; woocommerce_cart_hash=1d629c0421e9ca4d6d2a0133ccd7663f; wp_cocart_session_78909a3cd8e3a8e30c136df187a801eb=ab28923678b64a52570a9f414cd93a34%7C%7C1693293926%7C%7C1693207526%7C%7C81d3d8d6d0eee2320b12d900b519d16d',
      // 'user_id': atloginuserid.toString(),
    };

    final Map<String, String> data = {
      'id': varisationID == ''
          ? itemcategiorscategoryid.toString()
          : varisationID.toString(),
      'quantity': '1',
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: data,
    );
    print(data);
    print(itemcategiorscategoryid);

    if (response.statusCode == 200) {
      fetchCartItemCount();
      addtocard.value = false;
      print('Item added to cart successfully.');
      varisationID = '';
    } else {
      print('Failed to add item to cart. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    showLoaderAfterAdding.value = false;
  }
}
