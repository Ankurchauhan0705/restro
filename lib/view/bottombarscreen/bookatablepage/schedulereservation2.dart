import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:the29029restaurant/view/bottombarscreen/bookatablepage/schedulereservation.dart';
import 'package:the29029restaurant/view/bottombarscreen/bookatablepage/schedulereservation3.dart';
import 'package:the29029restaurant/view_models/controller/bookatable/bookatable_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

import '../../../utils/utils.dart';

class ScheduleReservation2 extends StatefulWidget {
  const ScheduleReservation2({super.key});

  @override
  State<ScheduleReservation2> createState() => _ScheduleReservation2State();
}

class _ScheduleReservation2State extends State<ScheduleReservation2> {

  Bookatable_controller bookatable_controller = Get.put(Bookatable_controller());


  List<Map<String, String>> time = [
    {'': '12:00 '},
    {'': '12:15 '},
    {'': '12:30 '},
    {'': '12:45 '},
    {'': '13:00 '},
    {'': '13:15 '},
    {'': '13:30 '},
    {'': '13:45 '},
    {'': '14:00 '},
    {'': '17:30 '},
    {'': '17:45 '},
    {'': '18:00 '},
    {'': '18:15 '},
    {'': '18:30 '},
    {'': '18:45 '},
    {'': '19:00 '},
    {'': '19:15' },
    {'': '19:30 '},
    {'': '19:45 '},
    {'': '20:00 '},
    {'': '20:15 '},
    {'': '20:30 '},
    {'': '20:45'},
    {'': '21:00 '},
    {'': '21:15 '},
    {'': '21:30 '},
    {'': '21:45 '},
    {'': '22:00 '},
    {'': '22:15'},
    {'': '22:30 '},
    {'': '22:45 '},
    {'': '23:00 '},
    // {'': '23:15 '},
    // {'': '23:30 '},
    // {'': '23:45'},
    // {'': '24:00 '},
    // {'': '24:15 '},
    // {'': '24:30 '},
    // {'': '24:45 '},
    // {'': '20:30 '},
    // {'': '21:00'},
    // {'': '21:30 '},
    // {'': '22:00 '},
    // {'': '22:30 '},
    // {'': '23:00 '},
    // {'': '23:30 '},
    // {'': '24:00'},
    // {'': '24:30 '},
  ];

  List<Map<String, String>> people = [
    {'': '1'},
    {'': '2'},
    {'': '3'},
    {'': '4'},
    {'': '5'},
    {'': '6'},
    {'': '7'},
    {'': '8'},
    {'': '9'},
    {'': '10'}
  ];

  var _formKey = GlobalKey<FormState>();


  List<int> tappedtime = [];
  List<int> tapped = [];


  int selected = 0;
  int selectedpeople = 0;

  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';






 // @override
 //  void initState() {
 //    bookatable_controller.bookatable_apihit();
 //    // TODO: implement initState
 //    super.initState();
 //  }




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
                  builder: (context) => ScheduleReservation(),
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                Center(
                  child: Text(
                    "Book A Table",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.outfit().fontFamily),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Text(
                  "Date",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.outfit().fontFamily),
                ),
                SizedBox(height: height * 0.005),

              DateTimePicker(
                  controller: bookatable_controller.dateController.value,
                  type: DateTimePickerType.date,
                  dateMask: 'dd/MM/yyyy',
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.event, color: Color(0xff911FDA)),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color(0xffDCDCDC), width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color(0xffDCDCDC), width: 1))),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2100),
                  //dateLabelText: 'Date',
                  onChanged: (val) => setState(() => _valueChanged1 = val),
                  validator: (val) {
                    setState(() => _valueToValidate1 = val ?? '');
                    return null;
                  },
                  onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),


                ),

                SizedBox(height: height * 0.02),
                Text(
                  "Time",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.outfit().fontFamily),
                ),
                SizedBox(height: height * 0.01),
                Container(
                  height: height * 0.05,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: time.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: SizedBox(
                            height: 30,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: selected ==index
                                      ? Color(0xff911FDA)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                          color: selected ==index
                                              ? Color(0xff911FDA)
                                              : Color(0xff9796A1)))),
                              onPressed: () {
                                setState(() {
                                  selected=index;
                                  bookatable_controller.timeController.value.text = time[selected]['']??'' ;
                                  });
                              },
                              child: Text(
                                time[index][''] ?? '',
                                style: TextStyle(
                                    color: selected ==index
                                        ? Colors.white
                                        : Color(0xff9796A1)),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: height * 0.03),
                Text(
                  "How Many People",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.outfit().fontFamily),
                ),
                SizedBox(height: height * 0.01),
                Container(
                  height: height * 0.05,
                  child: ListView.builder(
                      scrollDirection:Axis.horizontal,
                      itemCount:people.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: SizedBox(
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedpeople=index;
                                  bookatable_controller.peopleController.value.text = people[selectedpeople]['']??'' ;
                                });
                              },
                              child: Text(
                                people[index][''] ?? '',
                                style: TextStyle(
                                    color: selectedpeople ==index
                                        ? Colors.white
                                        : Color(0xff9796A1)),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedpeople ==index
                                      ? Color(0xff911FDA)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(
                                          color: selectedpeople ==index
                                              ? Color(0xff911FDA)
                                              : Color(0xff9796A1)))),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: height * 0.05),
                Center(
                    child: MyButton( bgColor: Color(0xff41004C),
                        title: "Continue",
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
                          //  bookatable_controller.bookatable_apihit();
                            if( bookatable_controller.dateController.value.text.isNotEmpty ||
                                bookatable_controller.timeController.value.text.isNotEmpty ||
                                bookatable_controller.peopleController.value.text.isNotEmpty
                            )
                            {  Get.to(() => ScheduleReservation3());}
                            else {
                              return  Utils.snackBar( 'fill the data', 'enter valid data');
                            }

                            // Get.to(  ScheduleReservation3() );
                          }
                        },
                        height: height*.07,
                        width: width*0.5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
