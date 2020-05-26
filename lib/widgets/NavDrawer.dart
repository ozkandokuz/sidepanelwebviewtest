import 'package:flutter/material.dart';
import 'package:sidepanelwebview/widgets/NavDrawerState.dart';


class NavDrawer extends StatefulWidget {
  static final String routeName = '/labelForm';

  String weburl;
  Function(String) callback;

  NavDrawer(this.weburl, this.callback);

  @override
  State<StatefulWidget> createState() => new NavDrawerState();
}
