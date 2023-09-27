import 'package:flutter/material.dart';
import 'package:the29029restaurant/view/drawerscreen/fanwall1.dart';
import 'package:the29029restaurant/view/drawerscreen/fanwall2.dart';


class FanWall extends StatefulWidget {
  const FanWall({super.key});

  @override
  State<FanWall> createState() => _FanWallState();
}

class _FanWallState extends State<FanWall> {
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
            Navigator.pop(context);
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Fan Wall",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(height: height * 0.03),
            Material(
              child: Container(
                // y button k uper ka color jo select hoga toh kisisize chnge krni h
                height: 35,
                width: 250,
                color: Colors.white,
                child: TabBar(labelPadding: EdgeInsets.only(right: 5,left: 5),
                  physics: ClampingScrollPhysics(),
                  unselectedLabelColor: Color(0xff911FDA),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff911FDA)),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 35,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Color(0xff911FDA))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("All Post"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 35,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Color(0xff911FDA))),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Gallery"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Expanded(
                child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [FanWall1(), FanWall2()],
            ))
          ],
        ),
      ),
    );
  }
}
