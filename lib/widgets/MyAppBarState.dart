import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sidepanelwebview/utils/Constants.dart';
import 'package:sidepanelwebview/services/Api.dart';
import 'package:sidepanelwebview/widgets/MyAppBar.dart';


class MyAppBarState extends State<MyAppBar> {

  var AppBarSearchVisible=false;

  initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }
  _AppBarDefault() {
      return AppBar(
          backgroundColor: Constants.PrimaryColor,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          title: new Image.network(Constants.LOGO_URL),
          actions: <Widget>[ // Add 3 lines from here...
            IconButton(icon: Icon(Icons.search), onPressed: _searchPressed),
            IconButton(icon: Icon(Icons.person), onPressed:_goToMyAccount),
           // IconButton(icon: Icon(Icons.shopping_cart), onPressed: _goToCart),
          ],
    );
  }
  _AppBarSearch() {
      return AppBar(
        backgroundColor: Constants.PrimaryColor,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        title: new TextField(
          //controller: _filter,

          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search...',
            filled: true,
            fillColor: Colors.white,
            //border: OutlineInputBorder(),
            focusColor: Colors.red,
          ),

          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          onSubmitted: _searchSubmitted,
        ), //Text('Side menu'),
        actions: <Widget>[ // Add 3 lines from here...
          IconButton(icon: new Icon(Icons.close), onPressed: _searchPressed),
        ],
      );
  }


  @override
  Widget build(BuildContext context) {
    return AppBarSearchVisible?_AppBarSearch():_AppBarDefault();
  }
  void _goToHomePage(){
    widget.callback(Constants.BASE_URL+"/"+"?"+Constants.MOBILE_PARAMS);
  }
  void _goToCart(){
    widget.callback(Constants.BASE_URL+"/cart"+"?"+Constants.MOBILE_PARAMS);
  }
  void _goToMyAccount(){
    widget.callback(Constants.BASE_URL+"/login"+"?"+Constants.MOBILE_PARAMS);
  }

  void _searchPressed() {
    setState(() {
      if (!AppBarSearchVisible) {
        AppBarSearchVisible=true;
      } else {
        AppBarSearchVisible=false;
      }
    });
  }

  void _searchSubmitted(String text){
    widget.callback(Constants.BASE_URL+"/index.php?p=Products&q="+text+"&"+Constants.MOBILE_PARAMS);
  }
}