import 'package:get/get.dart';
import 'package:the29029restaurant/view/Splash.dart';
import 'routes_name.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => Splash() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    // GetPage(
    //   name: RouteName.loginView,
    //   page: () => LoginView() ,
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade ,
    // ) ,
    // GetPage(
    //   name: RouteName.homeView,
    //   page: () => HomeView() ,
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade ,
    // ) ,
  ];

}