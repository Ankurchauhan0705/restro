import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view_models/controller/Drawer_Controller/clientsays/client_controller.dart';
import 'package:the29029restaurant/view_models/controller/Drawer_Controller/clientsays/clients_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

RxInt switchValue = 0.obs;

class ClientSays extends StatefulWidget {
  const ClientSays({super.key});

  @override
  State<ClientSays> createState() => _ClientSaysState();
}

class _ClientSaysState extends State<ClientSays> {
  bool test = false;

  Clientsays_controller clientsays_controller =
      Get.put(Clientsays_controller());

  PageController pageCont = PageController();



  List<Map<String, String>> data = [
    {"Name": "About Company", "url": ""},
    {"Name": "Our Menu", "url": ""},
    {"Name": "Buffet", "url": ""},
    {"Name": "Catering", "url": ""},
    {"Name": "Submit Reviews", "url": ""},
    {"Name": "Contact Us", "url": ""},
    {"Name": "Privacy police", "url": ""},
    {"Name": "Terms Use", "url": ""},
    {"Name": "Google Tour", "url": ""}
  ];
  late double ratingValue;

  var _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    clientsays_controller.getIpAddress();
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          title: Text("Client Say's",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: ListView(children: [
          Form(
              key: _formKey,
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),
                    Image.asset('assets/drawericon/Group.png'),
                    SizedBox(height: height * 0.03),
                    Text('Your Overall Rating',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                    SizedBox(height: height * 0.002),
                    RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 24,
                        ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: Colors.amber),
                          half: const Icon(
                            Icons.star_half,
                            color: Colors.amber,
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            color: Colors.amber,
                          ),
                        ),
                        onRatingUpdate: (value) {
                          setState(() {
                            ratingValue = value;
                            clientsays_controller.rating.value.text =
                                ratingValue.toString();
                          });
                        }),
                    SizedBox(height: height * 0.02),
                    Text("Title of the review",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                    SizedBox(height: height * 0.01),
                    TextFormField(
                      controller: clientsays_controller.title.value,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffFAFAFA),
                          hintText: "Enter your title",
                          hintStyle: TextStyle(
                              color: Color(0xff9796A1),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontFamily: GoogleFonts.outfit().fontFamily),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(0xffDCDCDC))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(0xffDCDCDC))),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: Color(0xffDCDCDC)))),
                      onFieldSubmitted: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter the title review';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    Text("Your Reviews",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                    SizedBox(height: height * 0.01),
                    TextFormField(
                      controller: clientsays_controller.review.value,
                      keyboardType: TextInputType.name,
                      maxLines: 4,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffFAFAFA),
                          hintText: "Enter your reviews",
                          hintStyle: TextStyle(
                              color: Color(0xff9796A1),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontFamily: GoogleFonts.outfit().fontFamily),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xffDCDCDC))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xffDCDCDC))),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  BorderSide(color: Color(0xffDCDCDC)))),
                      onFieldSubmitted: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter the reviews';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    Text("Your Name",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                    SizedBox(height: height * 0.01),
                    TextFormField(
                      controller: clientsays_controller.name.value,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffFAFAFA),
                          hintText: "Enter your name",
                          hintStyle: TextStyle(
                              color: Color(0xff9796A1),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontFamily: GoogleFonts.outfit().fontFamily),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(0xffDCDCDC))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(0xffDCDCDC))),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: Color(0xffDCDCDC)))),
                      onFieldSubmitted: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter the name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    Text("Your Email",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                    SizedBox(height: height * 0.01),
                    TextFormField(
                      controller: clientsays_controller.email.value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffFAFAFA),
                          hintText: "Enter your email",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Color(0xff9796A1),
                            fontSize: 14,
                            fontFamily: GoogleFonts.outfit().fontFamily,
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(0xffDCDCDC))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Color(0xffDCDCDC))),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: Color(0xffDCDCDC)))),
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
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CupertinoSwitch(
                          activeColor: Color(0xff41004C),
                          value: switchValue.value==1? true : false,
                          onChanged: (value) {
                            setState(() {
                              switchValue.value= value==true?1:0;
                            });
                          },
                        ),
                        SizedBox(width: width * 0.01),
                        Expanded(
                          child: Text(
                              'The review is based on my own exprience'
                              'and is my genuine opinion.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: switchValue.value==0
                                          ?Color(0xff9796A1)
                                          :Color(0xff41004C),
                                      fontFamily:
                                          GoogleFonts.outfit().fontFamily)),
                        )
                      ],
                    ),
                    SizedBox(height: height * 0.05),
                    Obx(() =>
                    Center(
                      child: MyButton(
                          loading:clientsays_controller.loading.value,
                          bgColor: Color(0xff41004C),
                          title: 'Submit Your Review',
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
                          },
                          height: height * .07,
                          width: width * 0.5),
                    ),
                    )

                  ],
                ),
              ))),
          SizedBox(height: height * 0.05),
          Center(
            child: Column(
              children: [
                Container(
                  height: height * 0.4,
                  child: Obx(() {
                    switch (clients_controller.rxRequestStatus.value) {
                      case Status.LOADING:
                        return const Center(child: CircularProgressIndicator());
                      case Status.ERROR:
                        if (clients_controller.error.value == 'No internet') {
                          return InterNetExceptionWidget(
                            onPress: () {},
                          );
                        } else {
                          return GeneralExceptionWidget(onPress: () {});
                        }
                      case Status.COMPLETED:
                        return PageView.builder(
                          itemCount: clients_controller
                              .userList.value.getSiteReview!.length,
                          controller: pageCont,
                          itemBuilder: (BuildContext context, int index) {
                            return pageViewWidget(context, index);
                          },
                        );
                    }
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        pageCont.previousPage(
                            duration: Duration(milliseconds: 1),
                            curve: Curves.bounceIn);
                      },
                      child: CircleAvatar(
                        maxRadius: 15,
                        minRadius: 15,
                        backgroundColor: Color(0xff911FDA),
                        child: Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    GestureDetector(
                      onTap: () {
                        pageCont.nextPage(
                            duration: Duration(milliseconds: 1),
                            curve: Curves.bounceIn);
                      },
                      child: CircleAvatar(
                        maxRadius: 15,
                        minRadius: 15,
                        backgroundColor: Color(0xff911FDA),
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Image.asset(
                  'assets/drawericon/map.png',
                ),
                SizedBox(height: height * 0.03),

                Text(
                  "About Us",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: GoogleFonts.outfit().fontFamily),
                ),
                SizedBox(height: height * 0.02),
                Text(
                    " ''The 29029'' offers fine upmarket Nepalese and\n"
                    "Indian Cuisine set in comfortable, fresh and \n"
                    "modern interior with soft lighting and warm \n"
                    "ambiance. Dinners can enjoy a variety of dishes \n"
                    "from an extensive mouth-watering menu.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Color(0xff9796A1), fontWeight: FontWeight.w300)),
                SizedBox(height: height * 0.03),
            Obx(() =>
                Center(
                  child: MyButton(
                      loading:clientsays_controller.loading.value,
                      bgColor: Color(0xff41004C),
                      title: 'Oder Online',
                      txtStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: GoogleFonts.outfit().fontFamily),
                      onTap: () {
                        Get.offAll(() => TabScreen(index:2));
                      },
                      height: height * .07,
                      width: width * 0.5),
                ),
            ),
                SizedBox(height: height * 0.03),
                Obx(() =>Center(
                  child: MyButton(
                    loading:clientsays_controller.loading.value,
                    title: "Book A Table",
                    txtStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: GoogleFonts.outfit().fontFamily),
                    onTap: () {
                      Get.offAll(() => TabScreen(index:3));
                    },
                    height: height * .07,
                    width: width * 0.5,
                    bgColor: Color(0xff911FDA),
                    side: BorderSide(color: Color(0xff911FDA)),
                  ),
                ) ),
                SizedBox(height: height * 0.05),
                Text(
                  "Quick Link",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: GoogleFonts.outfit().fontFamily),
                ),
                // SizedBox(height: height,)
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/drawericon/righterror.png",
                              height: 10,
                              width: 10,
                            ),
                            Text(data[index]["Name"] ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Color(0xff9796A1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontFamily:
                                            GoogleFonts.outfit().fontFamily)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: Text(
                    "Contact & Reservation",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.location_on_sharp,
                        color: Color(0xff911FDA),
                      ),
                    ),
                    Text(
                      'Sandford RoadSandford,Wareham,Dorset\nBH20 7DD',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9796A1)),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.phone_rounded,
                        color: Color(0xff911FDA),
                      ),
                    ),
                    Text(
                      '01929556959',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9796A1)),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.mail_outlined,
                        color: Color(0xff911FDA),
                      ),
                    ),
                    Text(
                      'info@29029restaurant.co.uk',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff9796A1)),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Center(
                  child: Text(
                    'Opening House:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.outfit().fontFamily),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: Text(
                    'Delicious Lunch',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.outfit().fontFamily),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Center(
                  child: Text('12:00 - 02:30 Pm',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff9796A1),
                          fontFamily: GoogleFonts.outfit().fontFamily)),
                ),
                SizedBox(height: height * 0.02),
                Center(
                  child: Text(
                    'A La CarteDinner',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.outfit().fontFamily),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Center(
                  child: Text('05:30 - 11:00 Pm',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff9796A1),
                          fontFamily: GoogleFonts.outfit().fontFamily)),
                ),
                SizedBox(height: height * 0.06),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff41004c),
            ),
            child: Column(
              children: [
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/drawericon/appstore.png",
                            height: 30, width: 30),
                        SizedBox(height: height * 0.02),
                        Text('Apple App Store\nDownload',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily)),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("assets/drawericon/playstore.png",
                            height: 30, width: 30),
                        SizedBox(height: height * 0.02),
                        Text('Google App Store\nDownload',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily))
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("assets/drawericon/tripadvisor.png",
                            height: 30, width: 30),
                        SizedBox(height: height * 0.02),
                        Text("Trip Advisor App\nDownload",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                Text(
                  "All Rights Reserved ® The “29029 Wareham” Restaurant\nPowered by BUSINESS APPS LONDON",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ]));
  }

  void initState() {
    clients_controller.clientsspihit();
    super.initState();
  }

  Clients_controller clients_controller = Get.put(Clients_controller());

  Widget pageViewWidget(BuildContext context, int idx) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        right: 15,
        left: 15,
      ),
      child: Obx(() {
        switch (clients_controller.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (clients_controller.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {},
              );
            } else {
              return GeneralExceptionWidget(onPress: () {});
            }
          case Status.COMPLETED:
            return
              Container(height: Get.height,
              child:  ListView.builder(

                shrinkWrap: true,
                  itemCount: clients_controller.userList.value.getSiteReview?.length,
                  itemBuilder:(BuildContext context, int idx)
                  {
                    return Column(
                          // shrinkWrap: true,
                          children: [
                        Center(
                          child: Text(
                            clients_controller.userList.value.siteReviewTitle.toString(),
                            //"Client Say's",
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff323643)),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Center(
                          child: Text(
                            clients_controller.userList.value.getSiteReview![idx].title
                                .toString(),
                            // "Saturday Takeaway",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: height * 0.005),
                        Center(
                          child: Text(
                            clients_controller.userList.value.getSiteReview![idx].date
                                .toString(),
                            //"15 April 2023",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w300, color: Color(0xff9796A1)),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Text(
                          clients_controller.userList.value.getSiteReview![idx].content
                              .toString(),

                          // "Absolutely delicious king prawn supreme,rich,\nAubergine and spinach.\n"
                          // "\n Onion bargy all delivered in good time and high\n standard of presentation.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w300, color: Color(0xff9796A1)),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Center(
                          child: Text(
                            clients_controller.userList.value.getSiteReview![idx].name
                                .toString(),
                            //"Lynsie Holt",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500, color: Color(0xff911FDA)),
                          ),
                        ),
                        SizedBox(height: height * 0.005),
                        Center(
                          child: RatingBar(
                            onRatingUpdate: (_) {},
                            ignoreGestures: true,
                            initialRating: double.parse(
                              clients_controller.userList.value.getSiteReview![idx].rating
                                  .toString(),
                            ),
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 12,
                            ratingWidget: RatingWidget(
                              full: const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              half: const Icon(
                                Icons.star_half,
                                color: Colors.amber,
                              ),
                              empty: const Icon(
                                Icons.star_outline,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ]);
                  }
              ));


        }
      }),
    );
  }
}
