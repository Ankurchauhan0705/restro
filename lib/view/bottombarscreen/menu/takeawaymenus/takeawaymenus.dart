import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/takeawaymenus/takeawayschildpage.dart';
// import 'package:the29029restaurant/view/bottombarscreen/menu/restaurantmenu/takeawayschildpage.dart';
import 'package:the29029restaurant/view_models/controller/buttommenu_controller/takewaybuttom_controller.dart';
import 'package:the29029restaurant/view_models/controller/buttommenu_controller/takewayscreen_controller.dart';

String? Buttomonpressslug;

class Takeawaysmenus extends StatefulWidget {
  const Takeawaysmenus({super.key});

  @override
  State<Takeawaysmenus> createState() => _TakeawaysmenusState();
}

class _TakeawaysmenusState extends State<Takeawaysmenus> {


  buttom_controller bbuttom_controller = Get.put(buttom_controller());

 var selectedButtonIndex=0;

  buttomscreen_controller buttomscreen_controlle =
      Get.put(buttomscreen_controller());


  getbottomData() {
    Future.delayed(Duration(seconds: 5), () {
      buttomscreen_controlle.buttonscreenapihit();
    });
  }

  @override
  void initState() {
    bbuttom_controller.buttoknapihit();
    getbottomData();
    // TODO: implement initState
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      switch (bbuttom_controller.rxRequestStatus.value) {
        case Status.LOADING:
          return Scaffold(
              body: Container(
                  width: width,
                  height: height,
                  child: CircularProgressIndicator(),
                  alignment: Alignment.center));
        case Status.ERROR:
          if (bbuttom_controller.error.value == 'No internet') {
            return Scaffold(body: InterNetExceptionWidget(onPress: () {},),) ;
          } else {
            return Scaffold(body:GeneralExceptionWidget(onPress: () {}));
          }
        case Status.COMPLETED:
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/backbutton.png"),
              ),
              title: Text("Take Away Menu",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
              centerTitle: true,
              actions: [
                // Icon(
                //   Icons.search,
                //   size: height * 0.04,
                //   weight: width,
                //   color: Color(0XFF911fda),
                // ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      // Expanded(
                      Container(
                        height: Get.height * 0.05,
                        child:
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: bbuttom_controller
                                .userList.value.takeAwayMenu!.length,
                            itemBuilder: (BuildContext context, int index) {
                              final isSelected = index == selectedButtonIndex;
                              return Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedButtonIndex = index;
                                    });
                                    print(
                                        "${bbuttom_controller.userList.value.takeAwayMenu![index].categoryChildSlug.toString()}=========================");
                                    Buttomonpressslug = bbuttom_controller
                                        .userList
                                        .value
                                        .takeAwayMenu![index]
                                        .categoryChildSlug
                                        .toString();

                                    buttomscreen_controlle
                                        .userList.value.categoryTitle = '';
                                    buttomscreen_controlle
                                        .userList.value.partyMainMenuDetails!
                                        .clear();
                                    buttomscreen_controlle.buttonscreenapihit();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: isSelected ?  Color(0xff911FDA) : Colors.white, // Color(0xff911FDA),
                                      border: Border.all(color: isSelected ?Color(0xff911FDA) : Color(0xffCBCBCB))
                                    ),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 25),
                                    child: Text(
                                      bbuttom_controller
                                          .userList
                                          .value
                                          .takeAwayMenu![index]
                                          .categoryChildMenu
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 12,
                                              color:isSelected ? Colors.white : Color(0xffCBCBCB),
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Obx(() {
                        print(
                            'lengthdsffffze essssssssssssssssssssssssssssssssszweeeeeeeeehhhhhhhhhhhhhhhhhhhhhhhhhhhh');
                        // print(buttomscreen_controlle.userList.value.partyMainMenuDetails!.length);
                        return bootmscreenupdate.value == true
                            ? Takeawaychild2()
                            : Container(
                                height: Get.height,
                                width: Get.width,
                                alignment: Alignment.center,
                                child: CircularProgressIndicator());
                      }),
                      SizedBox(height:Get.height*0.03),
                    ]),
              ),
            ),
          );
      }
    });
  }
}
