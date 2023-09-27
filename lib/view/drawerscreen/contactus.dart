import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view_models/controller/Drawer_Controller/contactus/contactdeatils_controller.dart';
import 'package:the29029restaurant/view_models/controller/Drawer_Controller/contactus/contactus_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

class contactus extends StatefulWidget {
  const contactus({super.key});

  @override
  State<contactus> createState() => _contactusState();
}

class _contactusState extends State<contactus> {
  Contactus_controller contactus_controller= Get.put(Contactus_controller());

  Contactdeatils_controller contactdeatils_controller=Get.put(Contactdeatils_controller());

  var _formKey = GlobalKey<FormState>();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    contactus_controller.contactus_apihit();
    _formKey.currentState!.save();
  }

  @override
  void initState() {
    contactdeatils_controller.contactdeatilsapihit();
    // TODO: implement initState
    super.initState();
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
        leading: GestureDetector(onTap: (){
          Navigator.pop(context);
        },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text(
            "Contact Us",
            style:Theme.of(context).
            textTheme.
            titleLarge?.copyWith(
                fontSize: 18,fontWeight: FontWeight.w600)
        ),
        centerTitle: true,
      ),
      body:
      Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.02),
                  Text("First Name",
                    style: Theme.of(context).
                    textTheme.
                    titleMedium?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: height*0.005),
                  TextFormField(
                    controller:contactus_controller.firstname.value,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor:Color(0xffFAFAFA),
                        hintText: "Enter first name",
                        hintStyle: TextStyle(
                            color: Color(0xff9796A1),
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
                    controller:contactus_controller.lastname.value,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor:Color(0xffFAFAFA),
                        hintText: "Enter last name",
                        hintStyle: TextStyle(
                            color: Color(0xff9796A1),
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
                  Text("Phone Number",
                      style: Theme.of(context).
                      textTheme.
                      titleMedium?.copyWith(fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: height*0.005),
                  TextFormField(
                    controller:contactus_controller.phonenumber.value,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor:Color(0xffFAFAFA),
                        hintText: "Enter phone number",
                        hintStyle: TextStyle(
                            color: Color(0xff9796A1),
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
                          borderSide: BorderSide(color: Color(0xffDCDCDC)))
                    ),
                    onFieldSubmitted: (value) {},
                    validator: (value) {
                      if (value!.isEmpty){
                        return 'enter the phone number';
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
                    controller: contactus_controller.email.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor:Color(0xffFAFAFA),
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xff9796A1),
                          fontSize: 14,
                          fontFamily:GoogleFonts.outfit().fontFamily,),
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
                          borderSide: BorderSide(color: Color(0xffDCDCDC)))
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
                  Text("Message",
                      style: Theme.of(context).
                      textTheme.
                      titleMedium?.copyWith(fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: height*0.005),
                  TextFormField(
                    maxLines: 3,
                    controller: contactus_controller.message.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor:Color(0xffFAFAFA),
                        hintText: "Enter message",
                        hintStyle: TextStyle(
                            color: Color(0xff9796A1),
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
                        return 'enter message';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.05),
                  Obx(() =>Center(
                    child: MyButton(
                      loading:contactus_controller.loading.value,
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

                          contactus_controller.firstname.value.clear();
                          contactus_controller.lastname.value.clear();
                          contactus_controller.phonenumber.value.clear();
                          contactus_controller.email.value.clear();
                          contactus_controller.message.value.clear();
                        },
                        height: height*.07,
                        width: width*0.5),
                  ), ),

                  SizedBox(height: height * 0.05),
                         Obx(
                           () {
                         switch (contactdeatils_controller.rxRequestStatus.value) {
                            case Status.LOADING:
                           return const Center(child: CircularProgressIndicator());
                              case Status.ERROR:
                           if (contactdeatils_controller.error.value == 'No internet') {
                         return InterNetExceptionWidget(
                       onPress: () {},
                      );
                      } else {
                          return GeneralExceptionWidget(onPress: () {});
                           }case Status.COMPLETED:
                            return
                 Center(
                   child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(
                         "Opening Hours",
                         style: Theme.of(context).textTheme
                         .titleLarge?.copyWith(fontWeight: FontWeight.w600,
                           fontSize: 18),
                       ),
                       SizedBox(height: height*0.03),
                       Text(contactdeatils_controller.userList.value
                               .contactDetails![0].Lable.toString(),
                          // "Mon - Sun",
                           style: Theme.of(context).
                         textTheme.bodyLarge?.
                         copyWith(fontWeight: FontWeight.w500)
                         ),
                       SizedBox(height: height*0.003),
                       Text(contactdeatils_controller.userList.value
                               .contactDetails![0].name.toString(),
                          // "10.00 Am - 02.30 Pm",
                           style:
                       Theme.of(context).textTheme.bodyLarge?.
                       copyWith(color: Color(0xff777777), fontWeight: FontWeight.w300)
                       ),
                       SizedBox(height: height*0.03),
                       Text(contactdeatils_controller.userList.value
                             .contactDetails![1].Lable.toString(),
                          // "Christmas Day",
                           style: Theme.of(context).textTheme.
                       bodyLarge?.copyWith(fontWeight: FontWeight.w500)
                       ),
                       SizedBox(height: height*0.003),
                       Text(contactdeatils_controller.userList.value
                             .contactDetails![1].name.toString(),
                           //"10.00 Am - 02.30 Pm",
                           style:
                       Theme.of(context).textTheme.bodyLarge?.
                       copyWith(color: Color(0xff777777),
                           fontWeight: FontWeight.w300)
                       ),
                       SizedBox(height: height*0.03),
                       Text(contactdeatils_controller.userList.value
                             .contactDetails![2].Lable.toString(),
                         //  "New Year",
                           style:
                       Theme.of(context).textTheme.bodyLarge?.
                       copyWith(fontWeight: FontWeight.w500)
                       ),
                       SizedBox(height: height*0.003),
                       Text(contactdeatils_controller.userList.value
                             .contactDetails![2].Lable
                             .toString(),
                           //"10.00 Am - 02.30 Pm",
                           style:
                       Theme.of(context).textTheme.bodyLarge?.
                       copyWith(color: Color(0xff777777), fontWeight: FontWeight.w300)
                       )],
                   ),
                 );
                  }
               },
                  ),
                 SizedBox(height: height*0.1)
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
