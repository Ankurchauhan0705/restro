import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view/animation_screen.dart';
import 'package:badges/badges.dart' as b;
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/cart2.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/categories2.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/details.dart';
import 'package:the29029restaurant/view_models/controller/categories_controller/itensforcategiors_controller.dart';
String? itemcategiorscategoryid;
String? itemcategiorsslug;

// empty list use in pagination
RxList ItemList = [].obs;
int currentPage = 1; // page in pagination
// bool isLoading = false; // Track loading state
// bool reachedEnd = false;

class itemsforstarters extends StatefulWidget {
  const itemsforstarters({super.key});

  @override
  State<itemsforstarters> createState() => _itemsforstartersState();
}

class _itemsforstartersState extends State<itemsforstarters> {
  Itemforcategories_Controller itemforcategories_Controller =
  Get.put(Itemforcategories_Controller());

  final FieldTextController = TextEditingController();
  final ScrollerController = ScrollController();

  // RxBool Searchingcategories3=false.obs;
  // RxList Searchingitem3=[].obs;


//   //pagination
//   void loadMoreData() {
//     print("objjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj2");
//     print(loadMoreData);
//     print(currentPage++);//
//     currentPage++; //
//     itemforcategories_Controller.itemsforcategiorsapihit();  // again the api that hit use the page
//   }

  void initState() {
    setState(() {
      currentPage = 1;
    });
    print("objjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
    // print(isLoading);
    itemforcategories_Controller.itemsforcategiorsapihit();
    super.initState();
  }

  _onScrollEnd(){
    print("******************************");
    setState(() {
      // if(ItemList.value.length > (currentPage*10) - 1){
      //   currentPage++;
      //   itemforcategories_Controller.itemsforcategiorsapihit();
      //
      //
      //
      //   ItemList.value.addAll(itemforcategories_Controller
      //       .userList.value.productCategory!);

      // }
      // else{return;}

    });}


  Future<void> _fetchPage(int pageKey) async {
    try {
        itemforcategories_Controller.itemsforcategiorsapihit();
        ItemList.addAll(itemforcategories_Controller
            .userList.value.productCategory!);
      // final isLastPage = newItems.length < 10;


      // if (isLastPage) {
      //   _pagingController.appendLastPage(newItems);
      // } else {
      //   final nextPageKey = pageKey + newItems.length;
      //   _pagingController.appendPage(newItems, nextPageKey);
      // }
    } catch (error) {
      print(error);
      // _pagingController.error = error;
    }
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return
      Obx(() {
        switch (itemforcategories_Controller.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child:
            Scaffold(
              body:
              Center(child:CircularProgressIndicator() ,),
            ),
            );
          case Status.ERROR:
            if (itemforcategories_Controller.error.value ==
                'No internet') {
              return Scaffold(body: Center(child:InterNetExceptionWidget(onPress: () {},), ),);
            } else {
              return Scaffold(body: Center(child:GeneralExceptionWidget(onPress: () {}), ),);
            }
          case Status.COMPLETED:
            ItemList.value = ( itemforcategories_Controller
                .userList.value.productCategory!);
            return
              Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: GestureDetector(
                  onTap: () {
                    Get.to(() => Categories2());
                  },
                  child: Image.asset("assets/images/backbutton.png"),
                ),
                title: Text(
                    itemforcategories_Controller.userList.value.categoryTitle
                        .toString(),
                    // "Items for Starters",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
                centerTitle: true,
                actions: [

                  GestureDetector(onTap: (){
                    Get.to(()=>Card2());
                  },
                    child:   Obx(() =>Padding(padding: EdgeInsets.only(right: 15,top: 5)
                      ,child:  b.Badge(
                          onTap: (){
                            Get.to(()=>Card2());
                          }, badgeContent: Text(
                        iconcount.value.toString(),
                        // "10",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white,fontSize: 7,fontFamily: GoogleFonts.outfit().fontFamily
                        ),),
                          badgeStyle: b.BadgeStyle(badgeColor: Colors.black),
                          // position: b.BadgePosition.topEnd(top),
                          child:  Icon(
                            size: 28,
                            Icons.shopping_cart_outlined,
                            color: Color(0xff911FDA),
                          )
                      ) ,
                    ) ),),
                ],
              ),
              body: SafeArea(
                child:


        NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
        if (scrollNotification is ScrollEndNotification) {
// Check if the scroll position is equal to the max extent
        if (ScrollerController.position.pixels ==
        ScrollerController.position.maxScrollExtent) {
// Call the function
          ScrollerController.position.pixels -10;
        _onScrollEnd();
        }
        }
        return true;
        },
        child: SingleChildScrollView(
        controller: ScrollerController,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.02),
                        TextFormField(
                          // onFieldSubmitted:(x){
                          //   //searchCategoriesByName(x);
                          // },
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
                              hintStyle:
                              Theme.of(context)
                                  .textTheme.bodyMedium
                                  ?.copyWith(
                                fontSize: 14,
                                color: Color(0xff9796A1),
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts
                                    .outfit()
                                    .fontFamily,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(
                                  20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Color(0xffDCDCDC))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Color(0xffDCDCDC))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Color(0xffDCDCDC)))),
                        ),
                        SizedBox(height: height * 0.02),
                   GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: .6,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              mainAxisExtent: 250,
                            ),
                            //  item count use pagination
                            itemCount:
                            //ItemList.length+(isLoading ? 1 : 0), // list in pagination
                            ItemList.value!.length,
                            itemBuilder: (context, index) {
                              // final itemIndex = (currentPage - 1) * itemsPerPage + index;
                              return
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      itemcategiorscategoryid =  ItemList.value![index]
                                          .productId.toString();
                                      itemcategiorsslug =
                                          ItemList.value![index].productSlug;
                                    });
                                    Get.to(() => Detalis());
                                  }, child: Container(
                                  height: height * 0.3,
                                  width: width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF5F5F5),
                                      borderRadius: BorderRadius.circular(25)),
                                  child:
                                      Padding(padding: EdgeInsets.only(right: 10,left: 10),
                                      child:Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          SizedBox(height: height * 0.02),
                                          Center(
                                            child:
                                            Stack(alignment: Alignment.center,
                                              children: [
                                                Image.asset("assets/images/plateblanck.png",height: 120,
                                                  width: 120,),
                                                CircleAvatar(radius:50,
                                                    backgroundImage: NetworkImage (
                                                      ItemList.value![index]
                                                          .productImg
                                                          .toString(),
                                                    ) ),
                                              ],),


                                          ),
                                          SizedBox(height: height * 0.01),
                                          Text(
                                            ItemList.value![index]
                                                .productTitle
                                                .toString(),
                                            //"Piyaza Chicken ",
                                            textAlign: TextAlign.center,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Text(
                                            ItemList.value![index]
                                                .productDiscription
                                                .toString(),
                                            //"Strips of Corn Fed Chic...",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                color: Color(0xff9796A1),
                                                fontWeight: FontWeight.w300),
                                          ),

                                          SizedBox(height: height * 0.01),
                                          if (ItemList.value![index]
                                              .productPrice !=
                                              "")
                                            RichText(
                                                text: TextSpan(children: [
                                                  WidgetSpan(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 3),
                                                      child: Text(
                                                        "£ ",
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                            fontSize: 8,
                                                            color: Color(
                                                                0xff911FDA),
                                                            fontFamily:
                                                            GoogleFonts
                                                                .mulish()
                                                                .fontFamily,
                                                            fontWeight:
                                                            FontWeight.w700),
                                                      ),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                      text:
                                                      ItemList.value![index]
                                                          .productPrice
                                                          .toString(),
                                                      //"11.55",
                                                      style: Theme
                                                          .of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                          color: Color(0xff911FDA),
                                                          fontFamily:
                                                          GoogleFonts
                                                              .outfit()
                                                              .fontFamily,
                                                          fontWeight:
                                                          FontWeight.w700))
                                                ])),
                                        ],
                                      ) ,)

                                  ,
                                ),
                                );
                            }),




                        SizedBox(height: Get.height*0.02,)
                      ],
                    ),
                  ),
                ),
              ),),
            );
        }});
  }

//
// List<ProductDetails> searchCategoriesByName(String searchTerm) {
//   final List<ProductDetails> matchingCategories = [];
//
//   for (final ProductDetails  in itemforcategories_Controller.userList.value.productCategory!
//      )  {
//     if (ProductDetails.productTitle != null &&
//         ProductDetails.productTitle!.toLowerCase().contains(searchTerm.toLowerCase())) {
//       matchingCategories.add(ProductDetails );
//     }
//   }
//   Searchingcategories3.value=true;
//   Searchingitem3.value=matchingCategories;
//
//   return matchingCategories;
// }

// paginations
// int _getDisplayedItemCount() {
//   final totalItems = Searchingcategories3.value
//       ? Searchingitem3.length
//       : itemforcategories_Controller.userList.value.productDetails!.length;
//
//   final startIndex = (currentPage - 1) * itemsPerPage;
//   final endIndex = startIndex + itemsPerPage;
//
//   // Ensure endIndex does not exceed the total number of items
//   return endIndex > totalItems ? totalItems - startIndex : itemsPerPage;
// }






}
