import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/response/status.dart';
import '../../../res/components/general_exception.dart';
import '../../../res/components/internet_exceptions_widget.dart';
import '../../../view_models/controller/bookatable/upcoming_controller.dart';

RxString Taptimebutton = ''.obs;

class UpcomingWidget extends StatefulWidget {
  const UpcomingWidget({super.key});

  @override
  State<UpcomingWidget> createState() => _UpcomingWidgetState();
}

class _UpcomingWidgetState extends State<UpcomingWidget> {
  Upcoming_controller upcoming_controller = Get.put(Upcoming_controller());

  @override
  void initState() {
    upcoming_controller.Upcoming_apihit();
    // TODO: implement initState
    super.initState();
  }

  int selected = 0;

  TextEditingController dateInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(right: 0, left: 0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.005),
            Container(
                // height: Get.height * 0.7,
                child: Obx(() {
                  switch (upcoming_controller.rxRequestStatus.value) {
                    case Status.LOADING:
                      return const Scaffold(
                        body: Center(child: CircularProgressIndicator()),
                      );

                    case Status.ERROR:
                      if (upcoming_controller.error.value == 'No internet') {
                        return InterNetExceptionWidget(
                          onPress: () {},
                        );
                      } else {
                        return GeneralExceptionWidget(onPress: () {});
                      }
                    case Status.COMPLETED:
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: upcoming_controller
                            .userList.value.bookingDetails!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ExpansionTileCard(
                                key: Key('card_$index'),
                                title: Text(
                                  'Booking Id',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontFamily:
                                              GoogleFonts.outfit().fontFamily,
                                          fontSize: 14,
                                          color: Color(0xff323643),
                                          fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  upcoming_controller.userList.value
                                      .bookingDetails![index].bookingId
                                      .toString(),
                                  // '49294',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontFamily:
                                              GoogleFonts.outfit().fontFamily,
                                          fontSize: 14,
                                          color: Color(0xff323643),
                                          fontWeight: FontWeight.w600),
                                ),
                                trailing: Icon(
                                  Icons.arrow_right_alt,
                                  color: Color(0xff911FDA),
                                ),
                                children: <Widget>[
                                  Divider(
                                    thickness: 1.0,
                                    height: 1.0,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0,
                                          vertical: 8.0,
                                        ),
                                        child:
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Order Id",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: Color(0xff777777),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.001,
                                            ),
                                            Text(
                                              upcoming_controller.userList.value
                                                  .bookingDetails![index].bookingId
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.03,
                                            ),
                                            Text(
                                              "Restaurant",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: Color(0xff777777),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.001,
                                            ),
                                            Text(
                                              "The 29029 Restaurant - Wareham",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.03,
                                            ),
                                            Text(
                                              "Status",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: Color(0xff777777),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.001,
                                            ),
                                            Text(
                                              "Pending",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.03,
                                            ),
                                            Text(
                                              "Date",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: Color(0xff777777),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.001,
                                            ),
                                            Text(
                                              upcoming_controller.userList.value
                                                  .bookingDetails![index].bookingDate.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.03,
                                            ),
                                            Text(
                                              "Duration",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: Color(0xff777777),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.001,
                                            ),
                                            Text(
                                            upcoming_controller.userList.value
                                                .bookingDetails![index].bookingTime.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.03,
                                            ),
                                            Text(
                                              "Party",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: Color(0xff777777),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.001,
                                            ),
                                            Text(
                                              upcoming_controller.userList.value
                                                  .bookingDetails![index].partyPeople
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.03,
                                            ),
                                            Text(
                                              "Name",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: Color(0xff777777),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.001,
                                            ),
                                            Text(
                                              upcoming_controller.userList.value
                                                  .bookingDetails![index].customerName
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.03,
                                            ),
                                            Text(
                                              "Email",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: Color(0xff777777),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.001,
                                            ),
                                            Text(
                                              upcoming_controller.userList.value
                                                  .bookingDetails![index].customerEmail
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.03,
                                            ),
                                            Text(
                                              "Phone",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall
                                                  ?.copyWith(
                                                      color: Color(0xff777777),
                                                      fontSize: 9,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.001,
                                            ),
                                            Text(
                                              upcoming_controller.userList.value
                                                  .bookingDetails![index].customerMobile
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontFamily:
                                                          GoogleFonts.outfit()
                                                              .fontFamily),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                            ],
                          );
                        },
                      );
                  }
                })),
            // SizedBox(height: height * 0.03),
          ],
        )));
  }
}
