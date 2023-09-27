

import 'dart:ui';

import 'package:the29029restaurant/data/network/network_api_services.dart';
import 'package:the29029restaurant/models/Party_Menu_Model/party_menu_model.dart';
import 'package:the29029restaurant/models/home/user_list_model.dart';
import 'package:the29029restaurant/res/app_url/app_url.dart';



class HomeRepository {

  final _apiService  = NetworkApiServices() ;

  Future<PartyMenuModel> party_menu_api(var data) async{

    dynamic response = await _apiService.postApi(AppUrl.partymenuapi,data);
    print(response);
    return PartyMenuModel.fromJson(response) ;
  }


}