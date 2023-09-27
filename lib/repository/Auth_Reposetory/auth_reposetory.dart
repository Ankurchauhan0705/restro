import 'dart:ui';
import 'package:the29029restaurant/data/network/network_api_services.dart';
import 'package:the29029restaurant/models/Addreview_Model/addreview_model.dart';
import 'package:the29029restaurant/models/Bookatable_Model/bookatable_model.dart';
import 'package:the29029restaurant/models/Categories_Model/categories_model.dart';
import 'package:the29029restaurant/models/Categories_Model/itemsforcategories_model.dart';
import 'package:the29029restaurant/models/Categories_Model/order_buy.dart';
import 'package:the29029restaurant/models/Categories_Model/singlelitemproucta_model.dart';
import 'package:the29029restaurant/models/Categories_Model/subcategories_model.dart';
import 'package:the29029restaurant/models/Createpass_Model/createpass_model.dart';
import 'package:the29029restaurant/models/Drawer_Models/AboutUS_Model/aboutus_model.dart';
import 'package:the29029restaurant/models/Drawer_Models/ClientSays_Model/client_model.dart';
import 'package:the29029restaurant/models/Drawer_Models/ClientSays_Model/clients_model.dart';
import 'package:the29029restaurant/models/Drawer_Models/ContactUs_Model/contactdetals_model.dart';
import 'package:the29029restaurant/models/Drawer_Models/ContactUs_Model/contactus_model.dart';
import 'package:the29029restaurant/models/Drawer_Models/FollowUS_Model/followus_model.dart';
import 'package:the29029restaurant/models/Drawer_Models/PhotoGallery_Model/photogallery_model.dart';
import 'package:the29029restaurant/models/Login_Model/login_model.dart';
import 'package:the29029restaurant/models/MainCourse_Model/maincourse.dart';
import 'package:the29029restaurant/models/Menu_Model/restarantmenu_model/restaurantscreen_model.dart';
import 'package:the29029restaurant/models/Menulisting_Model/listingbuttondata_model.dart';
import 'package:the29029restaurant/models/Menulisting_Model/menulisting_model.dart';
import 'package:the29029restaurant/models/Party_Menu_Model/party_menu_model.dart';
import 'package:the29029restaurant/models/Profile_Model/UpdateProfile/Updateuseraddress_model.dart';
import 'package:the29029restaurant/models/Profile_Model/UpdateProfile/Updateuseremail_model.dart';
import 'package:the29029restaurant/models/Profile_Model/UpdateProfile/Updateuseremailotp_model.dart';
import 'package:the29029restaurant/models/Profile_Model/UpdateProfile/Updateusername_model.dart';
import 'package:the29029restaurant/models/Profile_Model/UpdateProfile/Updateuserpassword_model.dart';
import 'package:the29029restaurant/models/Profile_Model/UpdateProfile/Updateuserphonenumber_model.dart';
import 'package:the29029restaurant/models/Profile_Model/profile_model.dart';
import 'package:the29029restaurant/models/Profile_Model/update_model.dart';
import 'package:the29029restaurant/models/ResetpassOTP_Model/reserpassotp_model.dart';
import 'package:the29029restaurant/models/Resetpassword_Model/resetpassword_model.dart';
import 'package:the29029restaurant/models/Search_Model/search_model.dart';
import 'package:the29029restaurant/models/Sign_up_Model/sign_up_model.dart';
import 'package:the29029restaurant/models/Single_Model/single_model.dart';
import 'package:the29029restaurant/models/Starters_Model/starters_model.dart';
import 'package:the29029restaurant/models/Table_Model/table_model.dart';
import 'package:the29029restaurant/models/Takeawaymenu_Model/take_way_menu_model.dart';
import 'package:the29029restaurant/models/home/user_list_model.dart';
import 'package:the29029restaurant/models/menu_page_mpdel.dart';
import 'package:the29029restaurant/res/app_url/app_url.dart';

import '../../models/Bookatable_Model/upcomingmodel.dart';
import '../../models/Drawer_Models/MyOrder/myordermodel.dart';
import '../../models/Drawer_Models/MyOrder/orderdetailsmodel.dart';
import '../../models/Menu_Model/restarantmenu_model/restaurant_model.dart';



class AuthRepository {

  final _apiService  = NetworkApiServices() ;


  Future<SignUpModel> Signupapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.signupapi);
    return SignUpModel.fromJson(response);
  }

  Future<LoginModel> Loginapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.loginapi);
    return LoginModel.fromJson(response);
  }

  Future<ResetpasswordModel> Resetpasswordapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.resetpasswordapi);
    return ResetpasswordModel.fromJson(response);
  }

  Future<ResetpassOTPModel> ResetpasswordOTPapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.resetpasswordotp);
    return ResetpassOTPModel.fromJson(response);
  }

  Future<CreatepassModel> Createpassapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.createpassword);
    return CreatepassModel.fromJson(response);
  }


  Future<HomeModel> home_api(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.homepage);
    return HomeModel.fromJson(response);
  }


  Future<MenuPage> menueapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.menueapi);
    return MenuPage.fromJson(response);
  }

  // Future<TakewayModel> takewayapi(var data) async{
  //   dynamic response = await _apiService.postApi(data, AppUrl.onlineorderapi);
  //   return TakewayModel.fromJson(response);
  // }

  //tab buttomapi
  Future<MenulistingModel> Takewaysbuttomapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.buttom);
    return MenulistingModel.fromJson(response);
  }

  //resturantmenu
  Future<ButtonmenuModel> restaurantmenuapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.buttom);
    return ButtonmenuModel.fromJson(response);
  }



  //tab butttomapi screen
  Future<ListingsbuttomModel> takewaysscreenapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.buttomscreen);
    return ListingsbuttomModel.fromJson(response);
  }
//single tab on page
  Future<SingleModel> singleapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.singleapi);
    return SingleModel.fromJson(response);
  }
//restaurantapiin screen menu
  Future<ResturantbottonScreenModel> resturantbootoncreenapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.buttomscreen);
    return ResturantbottonScreenModel.fromJson(response);
  }
  //



  Future<MaincourseModel> maincourseapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.maincourseapi);
    return MaincourseModel.fromJson(response);
  }



  Future<TableModel> tablingapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.tablingapi);
    return TableModel.fromJson(response);
  }



//party menu
  Future<PartyMenuModel> PartyMenuapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.partymenuapi);
    return PartyMenuModel.fromJson(response);
  }

  Future<StartersModel> Startersapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.startersapi);
    return StartersModel.fromJson(response);
  }

  //  Drawer
  Future<AboutusModel> Aboutusapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.aboutusapi);
    return AboutusModel.fromJson(response);
  }

  Future<PhotoGalleryModel> Photogalleryapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.photogalleryapi);
    return PhotoGalleryModel.fromJson(response);
  }

  Future<FollowUSModel> Followusapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.followusapi);
    return FollowUSModel.fromJson(response);
  }

  Future<ContactUsModel> Contactususapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.contactusapi);
    return ContactUsModel.fromJson(response);
  }
  Future<ContactdetailsModel> Contactdetailsapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.contactdetailsapi);
    return ContactdetailsModel.fromJson(response);
  }

  Future<AddreviewModel> Addreviewapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.addreviewapi);
    return AddreviewModel.fromJson(response);
  }
  //1
  Future<ClientModel> Clientapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.clientsayapi);
    return ClientModel.fromJson(response);
  }
//2
  Future<ClientsModel> Clientsapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.clientssayapi);
    return ClientsModel.fromJson(response);
  }

  Future<myordermodel> Myorderapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.myorderayapi);
    return myordermodel.fromJson(response);
  }

  Future<OrderDetailsmodel> Orderdetailsapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.orderdetailsapi);
    return OrderDetailsmodel.fromJson(response);
  }

  // BookATabale BottomBar

  Future<BookatableModel> Bookatableapiusapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.bookatableapi);
    return BookatableModel.fromJson(response);
  }
  //upcoming book a table
  Future<UpcomingModel> Upcomingapiusapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.upcomingapi);
    return UpcomingModel.fromJson(response);
  }
  //online order in categories page

  Future<CategoriesModel> Categoriesapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.categoriesapi);
    // print("******************************");
    return CategoriesModel.fromJson(response);
  }

  Future<SubcatetegoriesModel> Subcategoriesapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.subcategoriesapi);
    return SubcatetegoriesModel.fromJson(response);
  }

  Future<ItemforcategoriesModel> itemforcategoriesapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.itemsforstartersapi);
    return ItemforcategoriesModel.fromJson(response);
  }
     // online order in single page in details api api function
  Future<SingleitemproductModel> singleitemproductedsapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.singleitemproductapi);
    return SingleitemproductModel.fromJson(response);
  }



// online order in order

  Future<OrderModel> orderapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.singlebuynowapi);
    return OrderModel.fromJson(response);
  }




 // Profile/Edit BottomBar

  Future<ProfileModel> Profileapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.profileapi);
    return ProfileModel.fromJson(response);
  }

  //user name

  Future<UpdateusernameModel> Updatenameapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.updatename);
    return UpdateusernameModel.fromJson(response);
  }


//phone number
  Future<Updateuserphonenumber> Updatephoneapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.updatephone);
    return Updateuserphonenumber.fromJson(response);
  }
//address
  Future<Updateuseraddress> Updateaddressapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.updateaddress);
    return Updateuseraddress.fromJson(response);
  }
//password
  Future<Updateuserpassword> Updatepasswordapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.updatepassword);
    return Updateuserpassword.fromJson(response);
  }
  //email
  Future<Updateuseremail> Updateemailapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.updateemail);
    return Updateuseremail.fromJson(response);
  }
  //otp
  Future<Updateuseremailotp> Updateemailotpapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.updateemailotp);
    return Updateuseremailotp.fromJson(response);
  }

  
  // Future<UpdateModel> Updateapi(var data) async{
  //   dynamic response = await _apiService.postApi(data, AppUrl.profileupdateapi);
  //   return UpdateModel.fromJson(response);
  // }


  Future<SearchModel> Searchapi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.searchapi);
    return SearchModel.fromJson(response);
  }


}