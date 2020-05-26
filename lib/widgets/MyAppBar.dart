import 'package:flutter/material.dart';
import 'package:sidepanelwebview/widgets/MyAppBarState.dart';


class MyAppBar extends StatefulWidget with PreferredSizeWidget{

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  String weburl;
  Function(String) callback;

  MyAppBar(this.weburl, this.callback);

  @override
  State<StatefulWidget> createState() => new MyAppBarState();
}
