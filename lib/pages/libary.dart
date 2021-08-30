import 'package:flutter/material.dart';
import '../components/audiolist/AudioList.dart';

class Libary extends StatefulWidget {
  const Libary({Key? key}) : super(key: key);

  @override
  _LibaryState createState() => _LibaryState();
}

class _LibaryState extends State<Libary> {
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
