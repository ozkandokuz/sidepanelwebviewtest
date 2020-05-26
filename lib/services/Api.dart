import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sidepanelwebview/utils/Constants.dart';

//const baseUrl = "https://www.artshopix.com/tmp/albums.json";
var baseUrl = Constants.BASE_URL+"/index.php?p=Menu&menu_type=8&json=1";

class api {
  static Future getMenuItems() {
    var url = baseUrl;// + "/users";
    return http.get(url);
  }
}