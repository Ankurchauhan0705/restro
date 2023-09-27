

class AppUrl {
  static const String server ="https://www.the29029restaurant.com/";
  static const String baseurl = "${server}wp-json/myplugin/v1/";


  static const String signupapi = '${baseurl}registeration-api';
  // registeration
  static const String loginapi = 'https://www.the29029restaurant.com/wp-json/jwt-auth/v1/token'; //login token with
  // static const String loginapi = '${baseurl}login-api'; //login
  static const String resetpasswordapi = '${baseurl}resetpass-api'; //email
  static const String resetpasswordotp = '${baseurl}resetpass_otp_verify-api'; //otp
  static const String createpassword = '${baseurl}resetpass_change-api?'; //same password


  static const String homepage='${baseurl}home_page-api';
  static const String menueapi='${baseurl}menu_bar-api';
  static const String onlineorderapi='${baseurl}take_away_menu-api';

  static const String maincourseapi='${baseurl}take_away_menu_filter-api';
  // manu in tab in single phone
  static const String singleapi='${baseurl}restaurant_menu_single-api';

  static const String tablingapi='${baseurl}take_away_menu_tabing-api';
//menu
  static const String buttom= '${baseurl}menu_listing-api';
  //buttomscreen
  static const String buttomscreen= '${baseurl}restaurant_menu_filter-api';

  static const String partymenuapi= '${baseurl}menu_listing-api';
  //static const String partymenuapi='${baseurl}party_menu-api';
  static const String startersapi='${baseurl}party_menu_single-api';


  static const String aboutusapi = '${baseurl}about_us-api';
  static const String photogalleryapi = '${baseurl}photos_gallery-api';
  static const String followusapi = '${baseurl}follow_us-api';
  static const String  contactusapi ='${baseurl}contact_page-api';
  static const String  contactdetailsapi ='${baseurl}contact_details-api';
  static const String  addreviewapi ='${baseurl}add_review-api';
  static const String  clientsayapi ='${baseurl}site_review-api';
  static const String  clientssayapi ='${baseurl}site_review_get-api';
  static const String  myorderayapi ='${baseurl}order_history-api';
  static const String  orderdetailsapi ='${baseurl}order_details-api';




  static const String  bookatableapi ='${baseurl}booking_table-api';
  static const String  upcomingapi ='${baseurl}booking_history-api';


  //online order
  static const String  categoriesapi ='${baseurl}product_category-api';
  static const String  subcategoriesapi ='${baseurl}product_sub_category-api';

  // static const String  itemsforstartersapi ='${baseurl}product_listing_api-api';
  static const String  itemsforstartersapi ='${baseurl}product_listing_pageper_api-api';
  //static const String  singleitemproductapi ='${baseurl}single_product_api-api';
  static const String  singleitemproductapi ='${baseurl}single_product_variable-api';

  static const String  singlebuynowapi ='https://www.the29029restaurant.com//wp-json/wc/v3/orders';

  //static const String  singleproductbuynowpi ='${baseurl}single_product_buy_now-api';




  static const String  profileapi ='${baseurl}user_profile-api';
  static const String  updatephone ='${baseurl}user_phone_change';
  static const String  updateemail ='${baseurl}change_email_otp';
  static const String  updateemailotp ='${baseurl}user_email_otp_verify';
  static const String  updatepassword ='${baseurl}user_password_api';
  static const String  updateaddress ='${baseurl}user_address_change';
  static const String  updatename ='${baseurl}update_name';



  static const String  profileupdateapi ='${baseurl}user_profile_update-api';


  static const String searchapi ='${baseurl}search_form_api';


  // https://www.the29029restaurant.com/wp-json/myplugin/v1/search_form_api







}