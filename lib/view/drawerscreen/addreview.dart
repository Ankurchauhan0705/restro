import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view_models/controller/Drawer_Controller/addreview/addreview_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

class AddReview extends StatefulWidget {
  const AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {

  Addreview_controller addreview_controller=Get.put(Addreview_controller());

  var _formKey = GlobalKey<FormState>();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    addreview_controller.addreview_apihit();
    _formKey.currentState!.save();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return


      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(onTap: (){
          Navigator.pop(context);
        },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text(
          "Add Review",
          style:Theme.of(context).
          textTheme.
          titleLarge?.copyWith(
            fontSize: 18,fontWeight: FontWeight.w600)
        ),
        centerTitle: true,
      ),
      body: Form(
            key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.03),
                  Text("First Name",
                  style: Theme.of(context).
                  textTheme.
                  titleMedium?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: height*0.005),
                  TextFormField(
                    controller:addreview_controller.firstname.value,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffFAFAFA),
                        hintText: "Enter first name",
                        hintStyle: TextStyle(
                            color: Color(0xffDCDCDC),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                            BorderSide(color: Color(0xffDCDCDC))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                            BorderSide(color: Color(0xffDCDCDC))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC)))
                    ),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty){
                        return 'enter the first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height:height*0.02),
                  Text("Last Name",
                      style: Theme.of(context).
                      textTheme.
                      titleMedium?.copyWith(fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: height*0.005),
                  TextFormField(
                    controller:addreview_controller.lastname.value,
                    //lastname,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffFAFAFA),
                        hintText: "Enter last name",
                        hintStyle: TextStyle(
                            color: Color(0xffDCDCDC),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                            BorderSide(color: Color(0xffDCDCDC))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                            BorderSide(color: Color(0xffDCDCDC))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC)))
                    ),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty){
                        return 'enter the last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height:height*0.02),
                  Text("Email",
                      style: Theme.of(context).
                      textTheme.
                      titleMedium?.copyWith(fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: height*0.005),
                  TextFormField(
                    controller:addreview_controller.email.value,
                    //email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor:Color(0xffFAFAFA),
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xffDCDCDC),
                          fontSize: 14,
                          fontFamily:GoogleFonts.outfit().fontFamily,),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                            BorderSide(color: Color(0xffDCDCDC))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                            BorderSide(color: Color(0xffDCDCDC))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1)))
                    ),
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
                  SizedBox(height:height*0.02),
                  Text("Phone Number",
                      style: Theme.of(context).
                      textTheme.
                      titleMedium?.copyWith(fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: height*0.005),
                  TextFormField(
                    controller:addreview_controller.phonenumber.value,
                    //phonenumber,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor:Color(0xffFAFAFA),
                        hintText: "Enter phone number",
                        hintStyle: TextStyle(
                            color: Color(0xffDCDCDC),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xffDCDCDC))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: Color(0xffDCDCDC))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty){
                        return 'enter the phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height:height*0.02),
                  Text("Review",
                      style: Theme.of(context).
                      textTheme.
                      titleMedium?.copyWith(fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: height*0.005),
                  TextFormField(
                    maxLines: 4,
                    controller:addreview_controller.review.value,
                    //review,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor:Color(0xffFAFAFA),
                        hintText: "Enter your review",
                        hintStyle: TextStyle(
                            color: Color(0xffDCDCDC),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                       // contentPadding: EdgeInsets.fromLTRB(20, 50, 20, 50),
                        enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            BorderSide(color: Color(0xffDCDCDC))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            BorderSide(color: Color(0xffDCDCDC))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Color(0xffDCDCDC)))
                    ),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty){
                        return 'enter the review';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  Obx(() =>  Center(
                    child: MyButton(
                      loading:addreview_controller.loading.value,
                        bgColor: Color(0xff41004C),
                        title: "Submit",
                        txtStyle: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                        onTap: () {
                          _submit();
                          addreview_controller.firstname.value.clear();
                          addreview_controller.lastname.value.clear();
                          addreview_controller.email.value.clear();
                          addreview_controller.phonenumber.value.clear();
                          addreview_controller.review.value.clear();
                         // Get.offAll(() => TabScreen(index:0));
                        },
                        height: height*.07,
                        width: width*0.5),
                  ),),

        SizedBox(height: height*0.1)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
