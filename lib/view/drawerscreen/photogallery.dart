import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view_models/controller/Drawer_Controller/photogallery/photogallery_controller.dart';

String ?Imagestring;
class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  PhotoGallery_controller photoGallery_controller = Get.put(PhotoGallery_controller());

  @override
  void initState() {
    photoGallery_controller.photogalleryapihit();
    super.initState();
  }


  Future<void> showOptionsDialog(BuildContext context)  {
    return showDialog(


        context: context,
        barrierDismissible: true,
        builder: (BuildContext context)
        {
          final height = MediaQuery.of(context).size.height;
          final width = MediaQuery.of(context).size.width;
          return
            Container(
              height: height,width: width,
              child:
              InteractiveViewer(
                maxScale: 5.0,
                  minScale: 0.01,
                  child: Image.network(
                      Imagestring
                          .toString()),)

              );
       }
    );
  }


  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return

      Obx(
            () {
          switch (photoGallery_controller.rxRequestStatus.value) {
            case Status.LOADING:
              return const
              Scaffold(body: Center(child: CircularProgressIndicator()), );

            case Status.ERROR:
              if (photoGallery_controller.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
              }
            case Status.COMPLETED:
              return
                Scaffold(
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
                    title: Text("Photo Gallery",
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
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height * 0.02),
                            GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: .6,
                                  crossAxisSpacing: 17,
                                  mainAxisSpacing: 17,
                                  mainAxisExtent: 90,
                                ),
                                itemCount: photoGallery_controller
                                    .userList.value.photosGallery!.length,
                                itemBuilder: (context, index) {
                                  return
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10)
                                      ),
                                      child: GestureDetector(onTap: () {
                                        Imagestring =
                                            photoGallery_controller
                                                .userList
                                                .value
                                                .photosGallery![index]
                                                .images
                                                .toString();
                                        setState(() {
                                          Imagestring;
                                        });
                                        showOptionsDialog(context);
                                      },
                                          child:

                                          Image.network(
                                              photoGallery_controller
                                                  .userList
                                                  .value
                                                  .photosGallery![index]
                                                  .images
                                                  .toString())
                                      ),
                                    );
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                );
          }});
  }
}
