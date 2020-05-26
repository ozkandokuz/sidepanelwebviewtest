import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sidepanelwebview/utils/Constants.dart';
import 'package:sidepanelwebview/services/Api.dart';
import 'package:sidepanelwebview/widgets/MyBottomBar.dart';


class MyBottomBarState extends State<MyBottomBar> {


  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: 0,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Anasayfa'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('Sepetim'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list),
          title: Text('Siparişlerim'),

        ),
      ],
    );
  }
  void _goToHomePage(){
    widget.callback(Constants.BASE_URL+"/"+"?"+Constants.MOBILE_PARAMS);
  }
  void _goToCart(){
    widget.callback(Constants.BASE_URL+"/cart"+"?"+Constants.MOBILE_PARAMS);
  }
  void _goToMyOrders(){
    widget.callback(Constants.BASE_URL+"/index.php?p=Orders"+"&"+Constants.MOBILE_PARAMS);
  }

  void _searchSubmitted(String text){
    widget.callback(Constants.BASE_URL+"/index.php?p=Products&q="+text+"&"+Constants.MOBILE_PARAMS);
  }
  void _onItemTapped(_index) {
    switch (_index) {
      case 0:
        _goToHomePage();
        break;

      case 1:
        _goToCart();
        break;
      case 2:
        _goToMyOrders();
        break;
    }
  }
}