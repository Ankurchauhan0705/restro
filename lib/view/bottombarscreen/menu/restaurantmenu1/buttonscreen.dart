import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../data/response/status.dart';
import '../../../../res/components/internet_exceptions_widget.dart';
import '../../../../view_models/controller/Menu_Controller/restaurant_controller.dart';
import '../../../../view_models/controller/Menu_Controller/restaurant_controller/restaurantscreen_controller.dart';
import 'bottomscreenrestarurant.dart';

// y buttom h vo screen h
RxBool tabButtonPressed = false.obs;
RxBool bootmresaturantscreenupdate = false.obs;

String? resButtomonpressslug;

class restaurantmenu extends StatefulWidget {
  int? idx;
  restaurantmenu({this.idx, super.key});

  @override
  State<restaurantmenu> createState() => _restaurantmenuState();
}

class _restaurantmenuState extends State<restaurantmenu> {
  var selectedButtonIndex = 0;

  buttomrestaurant_controller buttomrestaurant =
      Get.put(buttomrestaurant_controller());

  restaurant_controller restaurant_controlle = Get.put(restaurant_controller());

  resgetbottomData() {
    print(
        "duration time dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    Future.delayed(Duration(seconds: 5), () {
      tabButtonPressed.value = true;
      restaurant_controlle.buttonrestaurantapihit(idx: widget.idx);
    });
  }

  @override
  void initState() {
    setState(() {
      bottonrestaurantproductslug = null;
    });
    buttomrestaurant.buttonrestaurantapihit();
    // restaurant_controlle.
    // TODO: implement initState
    resgetbottomData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (buttomrestaurant.rxRequestStatus.value) {
        case Status.LOADING:
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                width: Get.width,
                height: Get.height,
                child: CircularProgressIndicator(),
                alignment: Alignment.center),
          );
        case Status.ERROR:
          if (buttomrestaurant.error.value == 'No internet') {
            return Scaffold(body: Center(child:InterNetExceptionWidget(
              onPress: () {},
            ) ),) ;
          } else {
            return  Scaffold(body: Center(child:Text("No Data.") ),);
          }
        case Status.COMPLETED:
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/backbutton.png"),
              ),
              title: Text("Restaurant Menu",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
              centerTitle: true,
            ),
            body:
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Container(
                        height: Get.height * 0.05,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: buttomrestaurant
                                .userList.value.restaurantMenuCategory!.length,
                            itemBuilder: (BuildContext context, int index) {
                              final isSelected = index == selectedButtonIndex;
                              return Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedButtonIndex = index;
                                    });
                                    print("pressed button");
                                    bottonrestaurantproductslug =
                                        buttomrestaurant
                                            .userList
                                            .value
                                            .restaurantMenuCategory![index]
                                            .categorySlug
                                            .toString();
                                    restaurant_controlle
                                        .userList.value.categoryTitle = '';
                                    print(
                                        "***************************printing slug********************");
                                    print(bottonrestaurantproductslug);
                                    restaurant_controlle
                                        .userList.value.partyMainMenuDetails!
                                        .clear();
                                    //
                                    tabButtonPressed.value = true;

                                    restaurant_controlle
                                        .buttonrestaurantapihit();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: isSelected
                                            ? Color(0xff911FDA)
                                            : Colors.white,
                                        border: Border.all(
                                            color: isSelected
                                                ? Color(0xff911FDA)
                                                : Color(0xffCBCBCB))
                                        // border: Border.all(color: Colors.green)
                                        ),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 25),
                                    child: Text(
                                      // "hello",
                                      buttomrestaurant
                                          .userList
                                          .value
                                          .restaurantMenuCategory![index]
                                          .categoryName
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              fontSize: 12,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Color(0xffCBCBCB),
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      tabButtonPressed.value
                          ? Container(
                              height: Get.height - 200,
                              width: Get.width,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            )
                          : Obx(() {
                              print(
                                  'lengthdsffffze essssssssssssssssssssssssssssssssszweeeeeeeeehhhhhhhhhhhhhhhhhhhhhhhhhhhh');
                              // print(buttomscreen_controlle.userList.value.partyMainMenuDetails!.length);
                              return bootmresaturantscreenupdate.value == true
                                  ? Restaurantbottomscreen()
                                  : Container(
                                      height: Get.height,
                                      width: Get.width,
                                      alignment: Alignment.center,
                                      child: CircularProgressIndicator());
                            })
                    ]),
              ),
            ),
          );
      }
    });
  }
}
