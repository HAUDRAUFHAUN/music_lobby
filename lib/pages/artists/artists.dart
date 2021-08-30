import 'package:flutter/material.dart';

import 'artist-detail.dart';
import '../../components/artistlist/ArtistList.dart';

class Artists extends StatefulWidget {
  const Artists({Key? key}) : super(key: key);

  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
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
          "Artists",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
      ),
      body: Container(
        child: ArtistList(),
      ),
    );
  }
}
