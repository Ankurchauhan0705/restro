import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static const userId = "id";
  static const introslieder = "introslieder";
  static const name = "name";
  static const username = "email";
  static const password = "password";
  static const mobnumber = "mob_no";
  static const countrycode = "country_code";
  static const DateofBirth = "dob";
  static const address = "address";
  static const image = "image";
  static const gender = "gender";
  static const token = "token";
  static const passenger = "passenger";
  static const date = "date";
  static const time = "time";
  static const deviceId = "deviceId";


  static SharedPreferences? localStorage;

  static Future init() async => localStorage = await SharedPreferences.getInstance();

}
