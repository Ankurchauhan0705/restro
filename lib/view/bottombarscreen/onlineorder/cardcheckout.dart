import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/addnewaddress.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/collection_widget.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/profile_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';
import 'package:http/http.dart' as http;
import '../../../models/Profile_Model/profile_model.dart';
import '../../animation_screen.dart';
import '../../bottomnavigationbar/tab_screen.dart';
import 'cart.dart';
import 'cart2.dart';
import 'onlinelocation.dart';

class Card_Checkout extends StatefulWidget {
  const Card_Checkout({super.key});

  @override
  State<Card_Checkout> createState() => _Card_CheckoutState();
}

class _Card_CheckoutState extends State<Card_Checkout> {
  final EnterODCardTextController = TextEditingController();
  final CardNumberTextController = TextEditingController();
  final ExpMonthsTextController = TextEditingController();
  final ExpDateTextController = TextEditingController();
  final CVVTextController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  Profile_controller profile_controller = Get.put(Profile_controller());
  String ipAddress = 'Loading...';

  RxBool Loadingbutton = false.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIpAddress();

    print(
        "**********************************************************************");
    print(time_Controller.value.text);
    print(dateTwo.value.text);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();

            //Get.to(Check_Out());
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Checkout",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
            child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.03),
                      Text(
                        "Payment method",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        controller: EnterODCardTextController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter Card holder Name",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 14,
                                  color: Color(0xff9796A1),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                ),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffDCDCDC))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffDCDCDC))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffDCDCDC)))),
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the card name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        maxLength: 16,
                        controller: CardNumberTextController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Card Number",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 14,
                                  color: Color(0xff9796A1),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                ),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffDCDCDC))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffDCDCDC))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffDCDCDC)))),
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the card number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              maxLength: 2,
                              controller: ExpMonthsTextController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Exp Months",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 14,
                                        color: Color(0xff9796A1),
                                        fontWeight: FontWeight.w300,
                                        fontFamily:
                                            GoogleFonts.outfit().fontFamily,
                                      ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Color(0xffDCDCDC))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Color(0xffDCDCDC))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Color(0xffDCDCDC)))),
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter the exp months';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: Width * 0.02),
                          Expanded(
                            child: TextFormField(
                              maxLength: 4,
                              controller: ExpDateTextController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Exp year",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: 14,
                                        color: Color(0xff9796A1),
                                        fontWeight: FontWeight.w300,
                                        fontFamily:
                                            GoogleFonts.outfit().fontFamily,
                                      ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Color(0xffDCDCDC))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Color(0xffDCDCDC))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Color(0xffDCDCDC)))),
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter the exp year';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        maxLength: 3,
                        controller: CVVTextController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "CVV",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 14,
                                  color: Color(0xff9796A1),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                ),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffDCDCDC))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffDCDCDC))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffDCDCDC)))),
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the cvv';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      ListTile(
                          leading: Text(
                            "Total",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                          ),
                          trailing: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "£",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      fontSize: 22,
                                      color: Color(0xff911FDA),
                                      fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                                text: Tabbuttonlocation.value == 'delivery'
                                    ? totalPrice.value.toStringAsFixed(2)
                                    : (totalPrice.value -
                                            ((totalPrice.value * 10) / 100))
                                        .toStringAsFixed(2),
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff911FDA)))
                          ]))),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Center(
                        child: MyButton(
                            title: "Proceed to payment",
                            txtStyle: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily),
                            side: BorderSide(
                              color: Color(0xff41004C),
                            ),
                            bgColor: Color(0xff41004C),
                            onTap: () async {
                              await _submit();
                              Loadingbutton.value = true;
                              createStripeToken();
                            },
                            height: height * .07,
                            width: Width * 0.5),
                      ),
                    ]),
              ),
            ),
            Obx(
              () => Loadingbutton.value
                  ? Container(
                      color: Colors.white.withOpacity(0.7),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ))
                  : Container(),
            )
          ],
        )),
      ),
    );
  }

  Future<void> getIpAddress() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          ipAddress = result[0].address;
          print(ipAddress);
        });
      } else {
        setState(() {
          ipAddress = 'Failed to retrieve IP';
          print(ipAddress);
        });
      }
    } catch (e) {
      setState(() {
        ipAddress = 'Error: $e';
        print(ipAddress);
      });
    }
  }
// clear iteam car to payment

  Future<void> clearCart(http.Response response) async {
    if (clearcart.value == false) {
      final url = 'https://www.the29029restaurant.com/wp-json/cocart/v1/clear';

      String username = userEmailsp!;
      String password = passwordsp!;
      String basicAuth =
          'Basic ' + base64.encode(utf8.encode('$username:$password'));
      print(basicAuth);

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
        'Cookie':
            'service_date=2023-09-06; woocommerce_cart_hash=2a7e7e990bb3aca6c9e925d0056b5d19; woocommerce_items_in_cart=1; wp_cocart_session_78909a3cd8e3a8e30c136df187a801eb=65%7C%7C1694596719%7C%7C1694510319%7C%7C1b7dd73a5fa61da533ae4061f7c11143',
      };

      try {
        final response = await http.post(
          Uri.parse(url),
          headers: headers,
        );

        if (response.statusCode == 200) {
          newListOfMaps.value.clear();
          // Request was successful, you can handle the response data here if needed
          print('Request Successful');
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    alignment: Alignment.center,
                    height: 185,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Icon(
                          CupertinoIcons.check_mark_circled_solid,
                          color: Colors.green,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            "Payment Succsesful",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            "Your Order has been \nConfirmed",
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: MyButton(
                              title: "Ok",
                              side: BorderSide(color: Color(0xff41004C)),
                              bgColor: Color(0xff41004C),
                              onTap: () {
                                Get.offAll(TabScreen(index: 0));
                              },
                              height: Get.height * 0.04,
                              width: Get.width * 0.21),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else {
          // Request failed
          print('Request Failed with status code: ${response.statusCode}');
          print('Response Body: ${response.body}');
        }
      } catch (error) {
        // Handle any exceptions that occurred during the request
        print('Error: $error');
      }
    } else {
      if (response.statusCode == 201) {
        // Request was successful, you can handle the response data here if needed
        print('Request Successful');
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: Container(
                  alignment: Alignment.center,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Icon(
                        CupertinoIcons.check_mark_circled_solid,
                        color: Colors.green,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          "Payment Succsesful",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          "Your Order has been \nConfirmed",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: MyButton(
                            title: "Ok",
                            side: BorderSide(color: Color(0xff41004C)),
                            bgColor: Color(0xff41004C),
                            onTap: () {
                              Get.offAll(TabScreen(index: 0));
                            },
                            height: Get.height * 0.04,
                            width: Get.width * 0.21),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              );
            });
      } else {
        // Request failed
        print('Request Failed with status code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    }
  }

//3
  Future<void> createOrder(String txId) async {
    print(newListOfMaps.value);
    print("mobileeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeennnnnnnnnnnnnnnnnnuber");
    print( mobilenum_Controller.value.text ?? '');

    print("useridddddddddddddddddddddddddddddddddddddddddddddddddd");
    print(userid.value);
    print("useridddddddddddddddddddddddddddddddddddddddddddddddddd");

    var totalamt = Tabbuttonlocation.value == 'delivery'
        ? (totalPrice.value * 100)
        : ((totalPrice.value - ((totalPrice.value * 10) / 100)) * 100);

    print(userEmailsp);
    final apiUrl = 'https://www.the29029restaurant.com//wp-json/wc/v3/orders';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Basic Y2tfZDg0YjY0OWYyZTQ0NmJkMGYwOTFiZThlM2Y0Njc2MTg0ZmM5NGE2ZDpjc19jZmJhZDYwOGY5OGRmOTc5ZWU3MTNkNzA3MzliYmRhY2RjNDEyNzZm',
        'Cookie': 'service_date=2023-08-03',
      },
      body: jsonEncode(<String, dynamic>{
        "payment_method": "Credit Card (Stripe)",
        "payment_method_title": "Credit",
        "transaction_id": txId,
        "customer_ip_address": ipAddress,
        "customer_user_agent": "",
        "set_paid": true,
         "customer_id":double.parse(userid.value).toInt(),
      "billing": {
          "first_name": userNameFromProfileApihome.value ?? '',
          "last_name": " ",
          "address_1": userAddressFromProfileApihome.value != ''
              ? userAddressFromProfileApihome.value
              : !(hourse_Controller.value.text == null)
                  ? ("${hourse_Controller.value.text}" +
                      "${street_Controller.value.text}" +
                      "${area_Controller.value.text}")
                  : "The 29029 Restaurant Wareham, "
                      "Sandford Rd, Sandford, Wareham BH20 7DD, United Kingdom",
          "address_2": "",
          "city": city_Controller.value.text == null
              ? ""
              : city_Controller.value.text,
          "state": state_Controller.value.text == null
              ? ""
              : state_Controller.value.text,
          "postcode": postcode_Controller.value.text ?? '',
          "country": country_Controller.value.text ?? 'United Kingdom',
          "email": userEmailsp.toString(),
          "phone": userPhoneFromProfileApihome.value ?? '7894561230'    //mobilenum_Controller.value.text

        },
        "shipping": {
          "first_name": userNameFromProfileApihome.value ?? " ",
          "last_name": " ",
          "address_1": !(userAddressFromProfileApihome.value == '')?

          userAddressFromProfileApihome.value
              // ? ("${hourse_Controller.value.text}" +
              //     "${street_Controller.value.text}" +
              //     "${area_Controller.value.text}")
              : "The 29029 Restaurant Wareham, "
                  "Sandford Rd, Sandford, Wareham BH20 7DD, United Kingdom",
          "address_2": "",
          "city": city_Controller.value.text == null
              ? ""
              : city_Controller.value.text,
          "state": state_Controller.value.text == null
              ? ""
              : state_Controller.value.text,
          "postcode": postcode_Controller.value.text ?? '',
          "country": country_Controller.value.text ?? 'United Kingdom',

        },
        "meta_data": [
          {
            "key": "_wfs_service_type",
            "value": Tabbuttonlocation.value.toString()
          },
          {"key": "_wfs_service_date", "value": dateTwo.value.text},
          {"key": "_wfs_service_time", "value": time_Controller.value.text}
        ],
        "line_items": newListOfMaps.value,
        "shipping_lines": [
          {
            "method_id": Tabbuttonlocation.value.toString() == 'delivery'
                ? 'free_delivery'
                : 'local_pickup',
            "method_title": Tabbuttonlocation.value.toString() == 'delivery'
                ? 'Free Delivery'
                : 'Local Pickup',
            "total": Tabbuttonlocation.value == 'delivery' ? '0.00' : '-10.00'
          }
        ]
      }),
    );

    if (response.statusCode == 201) {
      print('Order created successfully');
      clearCart(response);
      // print(body);
      print(response.body);
      var x = jsonDecode(response.body);
      print(x);
      print(ipAddress);
      // Utils.snackBar( 'Payment', 'Payment Successfully');
    } else {
      Get.back();
      print('Failed to create order. Status code: ${response.statusCode}');

      print('Response body: ${response.body}');
      // Utils.snackBar( 'Failed', 'Re-try');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                alignment: Alignment.center,
                height: 165,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: Get.height * 0.001,
                    ),
                    Text(
                      "Payment Failed",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.003,
                    ),
                    Text(
                      "Please Re-try",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    MyButton(
                        title: "Ok",
                        side: BorderSide(color: Color(0xff41004C)),
                        bgColor: Color(0xff41004C),
                        onTap: () {
                          Get.back();
                        },
                        height: Get.height * 0.04,
                        width: Get.width * 0.21)
                  ],
                ),
              ),
            );
          });
    }
    Loadingbutton.value = false;
  }

  //1 Strip payment api
  Future<void> createStripeToken() async {
    final url = Uri.parse('https://api.stripe.com/v1/tokens');

    // Replace with your actual Stripe publishable key
    final publishableKey = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc';
    print(base64Encode(utf8.encode('$publishableKey:')));
    final cardData = {
      'card[number]': CardNumberTextController.text, //'4242424242424242',
      'card[exp_month]': ExpMonthsTextController.text, //'08',
      'card[exp_year]': ExpDateTextController.text, //'2024',
      'card[cvc]': CVVTextController.text,
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Basic ' + base64Encode(utf8.encode('$publishableKey')),
      },
      body: cardData,
    );

    if (response.statusCode == 200) {
      // Success, handle the token creation here
      final jsonResponse = jsonDecode(response.body);
      final tokenId = jsonResponse['id'];
      print('Token created successfully with ID: $tokenId');
      createStripeCharge(tokenId);
    } else {
      Get.back();
      // Handle error
      print('Error creating token: ${response.body}');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                height: 165,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: Get.height * 0.001,
                    ),
                    Text(
                      "Payment Failed",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.003,
                    ),
                    Text(
                      "Please Re-try",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    MyButton(
                        title: "Ok",
                        side: BorderSide(color: Color(0xff41004C)),
                        bgColor: Color(0xff41004C),
                        onTap: () {
                          Get.back();
                        },
                        height: Get.height * 0.04,
                        width: Get.width * 0.21)
                  ],
                ),
              ),
            );
          });
    }
  }

//2 charges api strip
  Future<void> createStripeCharge(String token) async {
    var totalamt = Tabbuttonlocation.value == 'delivery'
        ? (totalPrice.value * 100)
        : ((totalPrice.value - ((totalPrice.value * 10) / 100)) * 100);

    print(totalPrice.value.toInt().toString());
    print(token);
    final url = Uri.parse('https://api.stripe.com/v1/charges');

    final basicAuth = 'sk_test_4eC39HqLyjWDarjtT1zdp7dc';

    print(basicAuth);
    final Map<String, String> data = {
      'amount': totalamt.toInt().toString(), //'2000',
      'currency': 'usd',
      'source': token,
      'description':
          'My First Test Charge (created for API docs at https://www.stripe.com/docs/api)',
    };
    print(data);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$basicAuth')),
      },
      body: data,
    );
    if (response.statusCode == 200) {
      // Success, handle the charge creation here
      print('Charge created successfully');
      print(response.body);
      var x = jsonDecode(response.body);
      print("tx id is -----------> ${x['id']}");
      createOrder(x['id']);
    } else {
      Get.back();
      // Handle error
      print('Error creating charge: ${response.body}');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                height: 165,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      height: Get.height * 0.001,
                    ),
                    Text(
                      "Payment Failed",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: Get.height * 0.003,
                    ),
                    Text(
                      "Please Re-try",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(
                      height: Get.height * 0.012,
                    ),
                    MyButton(
                        title: "Ok",
                        side: BorderSide(color: Color(0xff41004C)),
                        bgColor: Color(0xff41004C),
                        onTap: () {
                          Get.back();
                        },
                        height: Get.height * 0.04,
                        width: Get.width * 0.21)
                  ],
                ),
              ),
            );
          });
    }
  }
}
