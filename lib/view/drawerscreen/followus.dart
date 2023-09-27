import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view_models/controller/Drawer_Controller/followus/followus_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowUS extends StatefulWidget {
  const FollowUS({super.key});

  @override
  State<FollowUS> createState() => _FollowUSState();
}

class _FollowUSState extends State<FollowUS> {
  FollowUS_controller followUS_controller = Get.put(FollowUS_controller());
int ?flollowusindex;
  final Uri _facebookurl = Uri.parse('https://www.facebook.com/');
  final Uri _tripurl = Uri.parse('https://www.tripadvisor.in/');
  final Uri _twitterurl = Uri.parse('https://twitter.com/');
  Future<void> facebooklaunch() async {
    if (!await launchUrl(_facebookurl)) {
      throw Exception('Could not launch $_facebookurl');
    }
  }
  Future<void> tripadvisorlaunch() async {
    if (!await launchUrl(_tripurl)) {
      throw Exception('Could not launch $_tripurl');
    }
  }
  Future<void> twitterlaunch() async {
    if (!await launchUrl(_twitterurl)) {
      throw Exception('Could not launch $_twitterurl');
    }
  }
  @override
  void initState() {
    followUS_controller.follwusapihit();
    super.initState();
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  Obx(
            () {
          switch (followUS_controller.rxRequestStatus.value) {
            case Status.LOADING:
              return Scaffold(body:Center(child: CircularProgressIndicator()));
            case Status.ERROR:
              if (followUS_controller.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
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
                    title: Text("Follow Us",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    centerTitle: true,
                  ),
                  body:
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(children: [
                        SizedBox(height: height * 0.03),
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                          followUS_controller.userList.value.followUs!.length,
                          //3,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xffF5F5F5),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      horizontalTitleGap: 0,
                                      onTap: () {
                                        if (index == 0) {
                                          facebooklaunch();
                                        }
                                        else if (index == 1) {
                                          tripadvisorlaunch();
                                        }
                                        else if (index == 2) {
                                          twitterlaunch();
                                        }
                                      },
                                      tileColor: Color(0xffF5F5F5),
                                      shape: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Color(0xffF5F5F5)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      leading: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    followUS_controller.userList
                                                        .value.followUs![index]
                                                        .socialIcon.toString()),
                                                fit: BoxFit.fill)),
                                      ),
                                      title: Text(
                                        followUS_controller.userList.value
                                            .followUs![index].socialName
                                            .toString(),
                                        //"Facebook",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(color: Color(0xff323643),
                                            fontSize: 12,
                                            fontFamily: GoogleFonts
                                                .outfit()
                                                .fontFamily,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      trailing: Text("Follow >",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                            color: Color(0xff41004C),
                                            fontSize: 12,
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ]
                      ),
                    ),
                  ),
                );
          }});
  }
}
