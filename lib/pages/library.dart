import 'package:flutter/material.dart';
import '../components/audiolist/AudioList.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
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
          "Library",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
      ),
      body: Container(child: AudioList()),
    );
  }
}
