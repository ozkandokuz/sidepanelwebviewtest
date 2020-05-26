import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sidepanelwebview/utils/Constants.dart';
import 'package:sidepanelwebview/services/Api.dart';
import 'package:sidepanelwebview/models/Menu.dart';
import 'package:sidepanelwebview/widgets/NavDrawer.dart';


class NavDrawerState extends State<NavDrawer> {



  var menu_items = new List<Menu>();

  _getMenuItems() {
    api.getMenuItems().then((response) {
      setState(() {
        final json_data = json.decode(response.body);
        final Iterable mylist = json_data["result_data"];
        menu_items = mylist.map((model) => Menu.fromJson(model)).toList();
        //debugPrint("denemeler");
        //print(albums[0].id.toString());
      });
    });
  }


  initState() {
    super.initState();
    _getMenuItems();
  }
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];
    final MyListTiles=<Widget>[];
    //var albums = new List<Album>();

    MyListTiles.add(new DrawerHeader(
      child: Text(
        '...',//+responseList.title,
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(Constants.BASE_URL))),
    )
    );
/*
    MyListTiles.add(new ListTile(
      leading: Icon(Icons.input),
      title: Text("Album"),
      onTap: () => {},
    )
    );
*/
    for(int i=0;i<menu_items.length;i++){
      MyListTiles.add(new ListTile(
        leading: Icon(Icons.arrow_forward_ios),
        title: Text(menu_items[i].title),
        onTap: () {
          widget.callback(Constants.BASE_URL+menu_items[i].url+"?"+Constants.MOBILE_PARAMS);
          //controller.loadUrl(Constants.BASE_URL+"/login");
          Navigator.pop(context);
        },
      )
      );
    }

    return Drawer(
      child:
      ListView(
        padding: EdgeInsets.zero,
        children: MyListTiles,
      ),

    );
  }
}