import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

class Location extends StatefulWidget {
  const Location({super.key});
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  bool _isExpanded = false;
  bool _isExpanded2 = false;
  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
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
        title: Text("Location",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.001,
              ),
              Container(
                height: height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("assets/drawericon/mappppp.png",
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "The 29029 Restaurant Wareham",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Color(0xff0000000),
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text("Sandford Rd,Sandford,Wareham BH20 7DD,\nUnited kingdom",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Color(0xff9796A1),
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height * 0.13,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/drawericon/image 20.png",
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    height: height * 0.13,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/drawericon/image 20.png",
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ExpansionTile(
                // leading: Icon(Icons.list),
                title: Text(
                  'Opening Hours',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Color(0xff323643),
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
                trailing: _isExpanded
                    ? Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Color(0xff41004C),
                      )
                    : Icon(Icons.keyboard_arrow_up_sharp,
                        color: Color(0xff41004C)),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _isExpanded = expanded;
                  });
                },
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mon to Sun - Lunch',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Color(0xff9796A1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                            ),
                            Text('12:00 - 02:30 PM',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Color(0xff9796A1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300)),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sun to Mon - Dinner',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Color(0xff9796A1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                            ),
                            Text('05:30 - 11:00 PM',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Color(0xff9796A1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(height: height*0.01,),
              ExpansionTile(
                // leading: Icon(Icons.list),
                title: Text(
                  'Comments',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Color(0xff323643),
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
                trailing: _isExpanded2
                    ? Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Color(0xff41004C),
                      )
                    : Icon(Icons.keyboard_arrow_up_sharp,
                        color: Color(0xff41004C)),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _isExpanded2 = expanded;
                  });
                },
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mon to Sun - Lunch',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Color(0xff9796A1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                            ),
                            Text('12:00 - 02:30 PM',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Color(0xff9796A1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300)),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sun to Mon - Dinner',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: Color(0xff9796A1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                            ),
                            Text('05:30 - 11:00 PM',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Color(0xff9796A1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              MyButton(
                  title: "Post Comment",
                  bgColor: Color(0xff41004C),
                  onTap: () {},
                  height: height * .07,
                  width: width * 0.28),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(right: 50, left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.06,
                          width: width * 0.06,
                          child: Icon(
                            Icons.call,
                            color: Color(0xff911FDA),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xff911FDA).withOpacity(0.100),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          height: height * 0.003,
                        ),
                        Text(
                          "Call us",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Color(0xff323643),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.06,
                          width: width * 0.06,
                          child: Image.asset("assets/drawericon/send (1).png"),
                          decoration: BoxDecoration(
                              color: Color(0xff911FDA).withOpacity(0.100),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          height: height * 0.003,
                        ),
                        Text(
                          "Directions",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Color(0xff323643),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.06,
                          width: width * 0.06,
                          child: Icon(Icons.email, color: Color(0xff911FDA)),
                          decoration: BoxDecoration(
                              color: Color(0xff911FDA).withOpacity(0.100),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          height: height * 0.003,
                        ),
                        Text(
                          "Email",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Color(0xff323643),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.06,
                          width: width * 0.06,
                          child: Icon(Icons.home, color: Color(0xff911FDA)),
                          decoration: BoxDecoration(
                              color: Color(0xff911FDA).withOpacity(0.100),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          height: height * 0.003,
                        ),
                        Text(
                          "Website",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Color(0xff323643),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
