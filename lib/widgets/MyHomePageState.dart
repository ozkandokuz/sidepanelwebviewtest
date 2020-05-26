import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sidepanelwebview/widgets/NavDrawer.dart';
import 'package:sidepanelwebview/utils/Constants.dart';
import 'package:sidepanelwebview/widgets/MyHomePage.dart';
import 'package:sidepanelwebview/widgets/MyAppBar.dart';
import 'package:sidepanelwebview/widgets/MyBottomBar.dart';
import 'package:logger/logger.dart';
import 'package:progress_dialog/progress_dialog.dart';


class MyHomePageState extends State<MyHomePage> {
  WebViewController _controller;
  //ProgressDialog pr;
  String weburl=Constants.BASE_URL+"?"+Constants.MOBILE_PARAMS;


  callback(url) {
    setState(() {
      weburl = url;
      _controller.loadUrl(weburl);
    });
  }

  @override
  void initState() {
    //pr = new ProgressDialog(context, ProgressDialogType.Normal);
   // pr.setMessage("Loading");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(weburl,callback),
      appBar: MyAppBar(weburl,callback),
      bottomNavigationBar: MyBottomBar(weburl,callback),
      body: Column(
        children:[

          /*
          (progress != 1.0)
              ? LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple))
              : null,
           */
          Expanded(
            child: WebView(
              //key: "00001",
              onWebViewCreated: (webViewController) {
                _controller = webViewController;
                //_loadHtmlFromAssets();
              },
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: weburl,
              onPageFinished: (url) {
              //print("Loaded!");
              },
            )
          ),

        ]
       ),
    );
  }




}