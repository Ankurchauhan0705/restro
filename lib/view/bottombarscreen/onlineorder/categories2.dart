import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:badges/badges.dart' as b;
import 'package:the29029restaurant/view/animation_screen.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/cart2.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/categories.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/itemsforstarters.dart';
import 'package:the29029restaurant/view_models/controller/categories_controller/subcategories_controller.dart';
import '../../../models/Categories_Model/subcategories_model.dart';

String? subcategoryid;
String? subcategoryslug;


RxBool tabPressed = false.obs;//button
RxBool bottomscreenupdate = false.obs;//button
class Categories2 extends StatefulWidget {
  const Categories2({super.key});

  @override
  State<Categories2> createState() => _Categories2State();
}

class _Categories2State extends State<Categories2> {
  var selectedButtonIndex = 0;    // selectedbuttonindex


  Subcategories_Controller subcategories_Controller =
      Get.put(Subcategories_Controller());

  final FieldTextController = TextEditingController();

  RxBool Searchingcategories2=false.obs;
  RxList Searchingitem2=[].obs;

  void initState() {
    subcategories_Controller.subcategoriespihit();
    super.initState();
    fetchCartItemCount();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return
      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.to(() => Categories());
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text(" List Categories",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => Card2());
            },
            child: Obx(() => Padding(
                  padding: EdgeInsets.only(right: 15, top: 5),
                  child: b.Badge(
                      onTap: () {
                        Get.to(() => Card2());
                      },
                      badgeContent: Text(
                        iconcount.value.toString(),
                        // "10",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                            fontSize: 7,
                            fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      badgeStyle: b.BadgeStyle(badgeColor: Colors.black),
                      // position: b.BadgePosition.topEnd(top),
                      child: Icon(
                        size: 28,
                        Icons.shopping_cart_outlined,
                        color: Color(0xff911FDA),
                      )),
                )),
          )
        ],
      ),
      body:

      // SingleChildScrollView(
      //   child: Padding(
      //     padding: EdgeInsets.only(right: 15, left: 15),
      //     child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           SizedBox(
      //             height: Get.height * 0.01,
      //           ),
      //           Container(
      //             height: Get.height * 0.05,
      //             child: ListView.builder(
      //                 shrinkWrap: true,
      //                 scrollDirection: Axis.horizontal,
      //                 itemCount: subcategories_Controller
      //                     .userList.value.productCategory!.length ?? 0,
      //                 itemBuilder: (BuildContext context, int index) {
      //                   final isSelected = index == selectedButtonIndex;
      //                   return Padding(
      //                     padding: EdgeInsets.only(right: 5),
      //                     child: GestureDetector(
      //                       onTap: () {
      //                         setState(() {
      //                           selectedButtonIndex = index;
      //                           subcategoryid= subcategories_Controller
      //                               .userList.value.productCategory![index].categoryId.toString();
      //                           subcategoryslug=subcategories_Controller
      //                               .userList.value.productCategory![index].categorySlug.toString();
      //                         });
      //                         Get.to(() => itemsforstarters());
      //
      //
      //                         print("pressed button");
      //
      //                       },
      //                       child: Container(
      //                         decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.circular(25),
      //                             color: isSelected
      //                                 ? Color(0xff911FDA)
      //                                 : Colors.white,
      //                             border: Border.all(
      //                                 color: isSelected
      //                                     ? Color(0xff911FDA)
      //                                     : Color(0xffCBCBCB))
      //                           // border: Border.all(color: Colors.green)
      //                         ),
      //                         alignment: Alignment.center,
      //                         padding: EdgeInsets.symmetric(
      //                             vertical: 5, horizontal: 25),
      //                         child: Text(
      //                           // "hello",
      //                             subcategories_Controller
      //                                 .userList.value.productCategory![index].categoryName.toString(),
      //                           style: Theme.of(context)
      //                               .textTheme
      //                               .bodySmall
      //                               ?.copyWith(
      //                               fontSize: 12,
      //                               color: isSelected
      //                                   ? Colors.white
      //                                   : Color(0xffCBCBCB),
      //                               fontWeight: FontWeight.w400),
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                 }),
      //           ),
      //
      //           tabPressed.value
      //               ? Container(
      //             height: Get.height - 200,
      //             width: Get.width,
      //             alignment: Alignment.center,
      //             child: CircularProgressIndicator(),
      //           )
      //               : Obx(() {
      //             print(
      //                 'lengthdsffffze essssssssssssssssssssssssssssssssszweeeeeeeeehhhhhhhhhhhhhhhhhhhhhhhhhhhh');
      //             // print(buttomscreen_controlle.userList.value.partyMainMenuDetails!.length);
      //             return bottomscreenupdate.value == true
      //                 ? itemsforstarters()
      //                 : Container(
      //                 height: Get.height,
      //                 width: Get.width,
      //                 alignment: Alignment.center,
      //                 child: CircularProgressIndicator());
      //           })
      //         ]),
      //   ),
      // ),







      SafeArea(
        child: Padding(
            padding: EdgeInsets.only(right: 20, left: 20), // error
            child:
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    onFieldSubmitted:(x){
                      searchCategoriesByName(x);
                    },
                    controller: FieldTextController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          color: Color(0xff911FDA),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Starters",
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: 14,
                                  color: Color(0xff9796A1),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear, color: Color(0xff41004C)),
                          onPressed: () {
                            FieldTextController.clear();
                          },
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                  ),
                  SizedBox(height: height * 0.02),
                  Obx(() {
                    switch (subcategories_Controller.rxRequestStatus.value) {
                      case Status.LOADING:
                        return Container(
                    height: Get.height,
                    alignment: Alignment.center,
                    child: Center(child: CircularProgressIndicator())
                        );
                      case Status.ERROR:
                        if (subcategories_Controller.error.value ==
                            'No internet') {
                          return InterNetExceptionWidget(
                            onPress: () {},
                          );
                        } else {
                          return GeneralExceptionWidget(onPress: () {});
                        }
                      case Status.COMPLETED:
                        return
                          GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .6,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 232,
                          ),
                          itemCount:
                          Searchingcategories2.value?Searchingitem2.length:
                          subcategories_Controller
                              .userList.value.productCategory!.length ?? 0,

                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  subcategoryid =Searchingcategories2.value?
                                  Searchingitem2[index].categoryId.toString() :
                                  subcategories_Controller
                                      .userList
                                      .value
                                      .productCategory![index]
                                      .categoryId
                                      .toString();
                                  subcategoryslug =
                                  Searchingcategories2.value?Searchingitem2[index].categorySlug :
                                  subcategories_Controller
                                      .userList
                                      .value
                                      .productCategory![index]
                                      .categorySlug;
                                });
                                Get.to(() => itemsforstarters());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: height * 0.01),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child:
                                            // Image.asset(
                                            //     "assets/drawericon/image 14.png")
                                            Image.network(
                                              Searchingcategories2.value?Searchingitem2
                                              [index].categoryImg.toString():
                                          subcategories_Controller
                                              .userList
                                              .value
                                              .productCategory![index]
                                              .categoryImg
                                              .toString(),
                                          //fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(height: height * 0.01),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: Searchingcategories2.value?Searchingitem2[index]
                                              .categoryName.toString():
                                          subcategories_Controller
                                              .userList
                                              .value
                                              .productCategory![index]
                                              .categoryName
                                              .toString(),
                                          //"Starters",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        TextSpan(text: " "),
                                        TextSpan(text: "(",style:Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            color: Color(0xff911FDA)), ),
                                        TextSpan(
                                          text:
                                          Searchingcategories2.value?Searchingitem2[index]
                                              .categoryCount.toString():
                                          subcategories_Controller
                                              .userList
                                              .value
                                              .productCategory![index]
                                              .categoryCount
                                              .toString(),
                                          //"(23)",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  color: Color(0xff911FDA)),
                                        ),
                                            TextSpan(text: ")",style:Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                color: Color(0xff911FDA)), ),
                                      ])),
                                      SizedBox(height: height * 0.01),
                                      Text(
                                          "Go to Menu >",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: Color(0xff41004C),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      GoogleFonts.outfit()
                                                          .fontFamily),
                                        ),

                                    ]),
                              ),
                            );
                          },
                        );
                    }
                  }),
                  SizedBox(
                    height: height * 0.04,
                  )
                ],
              ),
            )),
      ),



    );
  }










  List<ProductCategory> searchCategoriesByName(String searchTerm) {
    final List<ProductCategory> matchingCategories = [];

    for (final ProductCategory  in subcategories_Controller.userList.value
        .productCategory! )  {
      if (ProductCategory.categoryName != null &&
          ProductCategory.categoryName!.toLowerCase().contains(searchTerm.toLowerCase())) {
        matchingCategories.add(ProductCategory );
      }
    }
    Searchingcategories2.value=true;
    Searchingitem2.value=matchingCategories;

    return matchingCategories;
  }

}
