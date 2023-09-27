import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

class Location1 extends StatefulWidget {
  const Location1({super.key});

  @override
  State<Location1> createState() => _Location1State();
}

class _Location1State extends State<Location1> {
  var choose = 2;
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
           // Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.01),
                Image.asset("assets/drawericon/locationimage.png"),
                SizedBox(height: height * 0.02),
                ListTile(
                  horizontalTitleGap: 0,
                  leading: InkWell(
                      onTap: () {},
                      child: Image.asset("assets/drawericon/locationi.png",
                          height: 25, width: 25)),
                  title: Text(
                    "The 29029 Restaurant Wareham",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.outfit().fontFamily),
                  ),
                  subtitle: Text(
                    "Sandford Rd, Sandford,Wareham BH20\n7DD, United Kingdom",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color(0xff9796A1),
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                  trailing: Image.asset("assets/drawericon/derchin.png",
                      height: 25, width: 25),
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: EdgeInsets.only(right: 55, left: 55),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            choose = 1;
                            setState(() {
                              // click = !click;
                            });
                          },
                          child: Text(
                            "Collection",
                            style: TextStyle(
                                color: choose == 1
                                    ? Colors.white
                                    : Color(0xff911FDA),
                                fontFamily: GoogleFonts.outfit().fontFamily,
                                fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: choose == 1
                                  ? Color(0xff911FDA)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(color: Color(0xff911FDA)))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            choose = 2;
                            setState(() {
                              //click1 = !click1;
                            });
                          },
                          child: Text(
                            "Delivery",
                            style: TextStyle(
                                color: choose == 2
                                    ? Colors.white
                                    : Color(0xff911FDA),
                                fontFamily: GoogleFonts.outfit().fontFamily,
                                fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: choose == 2
                                  ? Color(0xff911FDA)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(color: Color(0xff911FDA)))),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                Text(
                  "Delivery Address",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      color: Color(0xff323643)),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: 160,
                  width: 335,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffF5F5F5)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Farion Wick",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff323643),
                                  fontFamily: GoogleFonts.outfit().fontFamily),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                                onTap: () {},
                                child:
                                    Image.asset("assets/drawericon/edit.png"))),
                        ListTile(
                          horizontalTitleGap: 0,
                          leading:
                              Icon(Icons.location_on, color: Color(0xff911FDA)),
                          title: Text(
                            "D No. 27-33-1,Kamaraju Centre, Gudavallivari\nStreet,Governerpet,Vijayawada-520002",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Color(0xff777777)),
                          ),
                        ),
                        ListTile(
                          horizontalTitleGap: 0,
                          leading: Icon(Icons.call, color: Color(0xff911FDA)),
                          title: Text(
                            "+91 9876543210",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Color(0xff777777)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: MyButton(
                      bgColor: Color(0xff41004C),
                      title: "Add New Address",
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => AddANewAddress(),
                        //     ));
                      },
                      height: height * 0.08,
                      width: width * 0.5),
                ),
                SizedBox(height: height * 0.1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




