import 'package:flutter/material.dart';
import '../components/audiolist/AudioList.dart';

import 'settingspage.dart';

class Titles extends StatefulWidget {
  const Titles({Key? key}) : super(key: key);

  @override
  _TitlesState createState() => _TitlesState();
}

class _TitlesState extends State<Titles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: true,
        title: Text(
          "Libary",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
      ),
      body: Container(child: AudioList()),
    );
  }
}
