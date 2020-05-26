import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Album {

  final int id;
  final String title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List> futureAlbum;

  List<Album> listModel = [];

  Future<List> fetchAlbum() async {



    final response =
    await http.get('https://www.artshopix.com/tmp/albums.json');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      //print(data);

      for(Map i in data){
        listModel.add(Album.fromJson(i));
      }

      // If the server did return a 200 OK response,
      // then parse the JSON.
      return listModel;//Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }


  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: listModel.length,
            itemBuilder: (context, i){
              final data = listModel[i];
              return Text(data.title);

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
