import 'package:flutter/material.dart';
import 'package:sidepanelwebview/widgets/MyBottomBarState.dart';


class MyBottomBar extends StatefulWidget with PreferredSizeWidget{

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  String weburl;
  Function(String) callback;

  MyBottomBar(this.weburl, this.callback);

  @override
  State<StatefulWidget> createState() => new MyBottomBarState();
}
