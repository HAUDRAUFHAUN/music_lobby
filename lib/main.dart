import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/settingspage.dart';
import 'pages/libary.dart';
import 'pages/artists/artists.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Lobby',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsPage()));
          },
          icon: Icon(
            Icons.settings,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Libary',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.00),
            ),
            leading: Icon(Icons.library_music),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Libary()));
            },
          ),
          ListTile(
            title: Text(
              'Artists',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.00),
            ),
            leading: Icon(Icons.group),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Artists()));
            },
          ),
        ],
      ),
    );
  }
}
