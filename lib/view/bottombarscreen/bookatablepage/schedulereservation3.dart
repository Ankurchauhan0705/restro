import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottombarscreen/bookatablepage/schedulereservation2.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/bottomnavigation.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view_models/controller/bookatable/bookatable_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';
import 'package:get/get.dart';

import '../profile/profile.dart';

class ScheduleReservation3 extends StatefulWidget {
  const ScheduleReservation3({super.key});

  @override
  State<ScheduleReservation3> createState() => _ScheduleReservation3State();
}

class _ScheduleReservation3State extends State<ScheduleReservation3> {

  Bookatable_controller bookatable_controller = Get.put(Bookatable_controller());

  var _formKey = GlobalKey<FormState>();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    bookatable_controller.bookatable_apihit();
    _formKey.currentState!.save();
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScheduleReservation2(),
                ));
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text("Contact",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.outfit().fontFamily)),
                  ),
                  SizedBox(height: height * 0.02),
                  Text("Full name",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  SizedBox(height: height * 0.005),
                  TextFormField(
                    controller: bookatable_controller.fullnameController.value,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter first name",
                        hintStyle: TextStyle(
                            color: Color(0xff9796A1),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter the phone number';
                      } return null;
                    },
                  ),
                  SizedBox(height: height * 0.03),
                  Text("Email",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  SizedBox(height: height * 0.005),
                  TextFormField(
                    controller: bookatable_controller.emailController.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xff9796A1),
                          fontSize: 14,
                          fontFamily: GoogleFonts.outfit().fontFamily,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'enter the vaild email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.03),
                  Text("Phone Number",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  SizedBox(height: height * 0.005),
                  Row(
                    children: [
                      CountryCodePicker(
                        dialogSize: Size(Get.width * 0.6, Get.height * 0.6),
                        onChanged: (_) {
                          countryCode.value = _.toString();
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'ca',
                        // favorite: ['+39', 'FR'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                        // dialogTextStyle: ,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller:  bookatable_controller.phonenumberController.value,
                          //txtphn,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter phone number",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color(0xff9796A1),
                                fontSize: 14,
                                fontFamily: GoogleFonts.outfit().fontFamily,
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
                                  borderSide:
                                  BorderSide(color:Color(0xffDCDCDC)))),
                          onFieldSubmitted: (value) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty || value.length > 12) {
                              return 'enter the valid phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.03),
                  Text("Message",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  SizedBox(height: height * 0.005),
                  TextFormField(
                    //textAlign: TextAlign.start,
                    maxLines: 4,
                    controller: bookatable_controller.messageController.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter message",
                        hintStyle: TextStyle(
                            color: Color(0xff9796A1),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontFamily: GoogleFonts.outfit().fontFamily),
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
                        return 'enter the message';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.05),
            Obx(
                  () => Center(
                child:
                  Center(
                    child: MyButton(
                      loading:bookatable_controller.loading.value,
                        bgColor: Color(0xff41004C),
                        title: "Request Booking",
                        txtStyle: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _submit();
                            Get.offAll(() => TabScreen(index: 0));
                          }
                        },
                      height: height*.07,
                      width: width*0.5,),
                  ),
                  )
            ),


                  SizedBox(height: height * 0.05),
                  Center(
                    child: Text(
                      "By Phone Please Call Us on",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Color(0xff9796A1),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: GoogleFonts.outfit().fontFamily),
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.call,
                              size: 15,
                              color: Color(0xff911FDA),
                            ),
                          ),
                          TextSpan(
                            text: "01929556959",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      //    color: Color(0xff9796A1)
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Center(
                    child: Text(
                      "Email Us at:",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Color(0xff9796A1),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: GoogleFonts.outfit().fontFamily),
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.email,
                              size: 15,
                              color: Color(0xff911FDA),
                            ),
                          ),
                          TextSpan(
                            text: "info@the29029restaurant.co.uk",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      //    color: Color(0xff9796A1)
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
