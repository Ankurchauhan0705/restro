import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view_models/controller/Drawer_Controller/about/about_controller.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class AboutUS extends StatefulWidget {
  const AboutUS({super.key});

  @override
  State<AboutUS> createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  AboutUS_controller aboutUS_controller = Get.put(AboutUS_controller());

  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  @override
  void initState() {
    aboutUS_controller.aboutusapihit();
    super.initState();
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return
      Obx(() {
      switch (aboutUS_controller.rxRequestStatus.value) {
        case Status.LOADING:
          return const
          Scaffold(body: Center(child: CircularProgressIndicator()),);

        case Status.ERROR:
          if (aboutUS_controller.error.value == 'No internet') {
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
                title: Text("About Us",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
                centerTitle: true,
              ),
              body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, left: 20, top: 15),
                    child:
                    ListView.builder(
                      itemCount:
                      aboutUS_controller.userList.value.aboutUs!.length,
                      //2,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ExpansionTileCard(
                              key: Key('card_$index'),
                              title: Text(
                                aboutUS_controller
                                    .userList.value.aboutUs![index].title
                                    .toString(),

                                //'Tap to Expand!',
                                textAlign: TextAlign.start,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                    fontFamily:
                                    GoogleFonts
                                        .outfit()
                                        .fontFamily,
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
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Container(
                                              height: height * 0.35,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          aboutUS_controller
                                                              .userList
                                                              .value
                                                              .aboutUs![index]
                                                              .image
                                                              .toString()),
                                                      fit: BoxFit.fill)),
                                            ),
                                            SizedBox(height: height * 0.02),
                                            Html( data:
                                              aboutUS_controller.userList.value
                                                  .aboutUs![index].content
                                                  .toString(),style:{
                                              "body": Style(
                                                // fontSize: FontSize(18.0),
                                                //fontWeight: FontWeight.bold,
                                                textAlign: TextAlign.justify
                                              ),
                                            },
                                            ),
                                          ],
                                        ),
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
                    ),
                  )),
            );
      }});

  }
}
