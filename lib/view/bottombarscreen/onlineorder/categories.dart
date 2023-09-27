import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:badges/badges.dart' as b;
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view/animation_screen.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/cart2.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/categories2.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view_models/controller/categories_controller/categories_controller.dart';
import '../../../models/Categories_Model/categories_model.dart';

String? categoryitemid;
String? slugcategories;

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Categories_Controller categories_Controller =
      Get.put(Categories_Controller());

  final FieldTextController = TextEditingController();

  RxBool Searchingcategories=false.obs;
  RxList Searchingitem=[].obs;


  void initState() {
    categories_Controller.categoriespihit();
    super.initState();
    fetchCartItemCount();
  }

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
            Get.offAll(() => TabScreen(index: 2));
            // Get.to(()=>OnlineOrder());
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Categories",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          Obx(
            () => GestureDetector(
                onTap: () {
                  Get.to(() => Card2());
                },
                child: Padding(
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20), // error
          child:
          Column(
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
                    hintText: "Search",
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                switch (categories_Controller.rxRequestStatus.value) {
                  case Status.LOADING:
                    return  Container(
                      height: Get.height,
                      alignment: Alignment.center,
                      child: Center(child: CircularProgressIndicator()),);
                  case Status.ERROR:
                    if (categories_Controller.error.value == 'No internet') {
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
                        mainAxisExtent: 215,
                      ),
                      itemCount:
                      Searchingcategories.value?Searchingitem.length:

                      categories_Controller
                              .userList.value.productCategory!.length ??
                          0,
                      itemBuilder: (context, index) {
                        print(categories_Controller
                            .userList.value.productCategory!.length);
                        return InkWell(
                          onTap: () {
                            setState(() {
                              categoryitemid =    Searchingcategories.value?Searchingitem[index].categoryId.toString() :  categories_Controller.userList
                                  .value.productCategory![index].categoryId.toString();
                              slugcategories =Searchingcategories.value?Searchingitem[index].categorySlug : categories_Controller.userList
                                  .value.productCategory![index].categorySlug;
                            });

                            Get.to(() => Categories2());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: height * 0.01),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child:
                                        // Image.asset(
                                        //     "assets/drawericon/image 14.png")
                                        Image.network(Searchingcategories.value?Searchingitem[index].categoryImg.toString():
                                        categories_Controller.userList.value
                                          .productCategory![index].categoryImg
                                          .toString(),
                                      //fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: Searchingcategories.value?Searchingitem[index].categoryName.toString():

                                      categories_Controller.userList.value
                                          .productCategory![index].categoryName
                                          .toString(),
                                      //"Starters",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    TextSpan(text: " "),
                                  ])),
                                  SizedBox(height: height * 0.01),
                                  InkWell(
                                    child: Text(
                                      "Go to Menu >",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: Color(0xff41004C),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              fontFamily: GoogleFonts.outfit()
                                                  .fontFamily),
                                    ),
                                    onTap: () {},
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
        ),
      )),
    );
  }



  //searching static app

  List<ProductCategory> searchCategoriesByName(String searchTerm) {
    final List<ProductCategory> matchingCategories = [];

    for (final category in categories_Controller.userList.value
        .productCategory!) {
      if (category.categoryName != null &&
          category.categoryName!.toLowerCase().contains(searchTerm.toLowerCase())) {
        matchingCategories.add(category);
      }
    }
    Searchingcategories.value=true;
    Searchingitem.value=matchingCategories;

    return matchingCategories;
  }

}


