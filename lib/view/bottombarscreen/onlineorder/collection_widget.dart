import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/utils/utils.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/categories.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/checkout.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

TextEditingController dateInput = TextEditingController();
final dateTwo =TextEditingController().obs;

final time_Controller = TextEditingController().obs;


class CollectionWidget extends StatefulWidget {
  const CollectionWidget({super.key});

  @override
  State<CollectionWidget> createState() => _CollectionWidgetState();
}

class _CollectionWidgetState extends State<CollectionWidget> {
  List<Map<String, String>> time = [
    {'': '1:00 '},
    {'': '1:30 '},
    {'': '2:00 '},
    {'': '2:30 '},
    {'': '3:00 '},
    {'': '3:30 '},
    {'': '4:00 '},
    {'': '4:30 '},
    {'': '5:00 '},
    {'': '5:30 '},
    {'': '6:00 '},
    {'': '6:30 '},
    {'': '7:00 '},
    {'': '7:30 '},
    {'': '8:00 '},
    {'': '8:30 '},
    {'': '9:00'},
    {'': '9:30 '},
    {'': '10:00 '},
    {'': '10:30 '},
    {'': '11:00 '},
    {'': '11:30 '},
    {'': '12:00'},
    {'': '12:30 '},
    {'': '13:00 '},
    {'': '13:30 '},
    {'': '14:00 '},
    {'': '14:30 '},
    {'': '15:00'},
    {'': '15:30 '},
    {'': '16:00 '},
    {'': '16:30 '},
    {'': '17:00 '},
    {'': '17:30 '},
    {'': '18:00'},
    {'': '18:30 '},
    {'': '19:00 '},
    {'': '19:30 '},
    {'': '20:00 '},
    {'': '20:30 '},
    {'': '21:00'},
    {'': '21:30 '},
    {'': '22:00 '},
    {'': '22:30 '},
    {'': '23:00 '},
    {'': '23:30 '},
    {'': '24:00'},
    {'': '24:30 '},
  ];

  int selected = 0;

  TextEditingController dateInput = TextEditingController();
  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';

  @override
  var choice = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          controller: dateInput,
          type: DateTimePickerType.date,
          dateMask: 'dd/MM/yyyy',
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.event, color: Color(0xff911FDA)),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Color(0xffDCDCDC), width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Color(0xffDCDCDC), width: 1))),
          firstDate: DateTime(2022),
          lastDate: DateTime(2100),
          // dateLabelText: 'Date',style: TextStyle(color: Colors.black,fontSize: 15),
          // dateHintText: 'Date',
          onChanged: (val){
    setState(() => _valueChanged1 = val);
    dateTwo.value.text = val;
    } ,
          validator: (val) {
            setState(() => _valueToValidate1 = val ?? '');
            return null;
          },
          onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),
        ),
        SizedBox(height: height * 0.03),
        Text(
          "Time",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.outfit().fontFamily),
        ),
        SizedBox(height: height * 0.005),
        Container(
          height: height * 0.04,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: time.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: MyButton(
                        title: time[index][''] ?? '',
                        txtStyle: TextStyle(
                            color: selected == index
                                ? Colors.white
                                : Color(0xff9796A1)),
                        bgColor: selected == index
                            ? Color(0xff911FDA)
                            : Colors.white,
                        side: BorderSide(
                            color: selected == index
                                ? Color(0xff911FDA)
                                : Color(0xff9796A1)),
                        onTap: () {
                          setState(() {
                            selected = index;
                            time_Controller.value.text = time[index][''].toString();
                            // bookatable_controller.timeController.value.text = time[selected]['']??'' ;
                          });
                        },
                        height: height * 0.001,
                        width: Width * 0.2));
              }),
        ),
        SizedBox(height: height * 0.06),
        Center(
          child: MyButton(
              bgColor: Color(0xff41004C),
              title: "Make Payment",
              txtStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: GoogleFonts.outfit().fontFamily),
              onTap: () {
                if(dateInput.text.isNotEmpty)
                {  Get.to(() => Check_Out());}
                else {
                  return  Utils.snackBar( 'fill the data', 'enter valid data');
                }



              // Get.to(() => Check_Out());
              },
              height: height * .07,
              width: Width * 0.5),
        ),
        SizedBox(height: height * 0.05),
      ],
    );
  }
}
