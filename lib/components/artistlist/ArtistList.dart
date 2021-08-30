import 'package:flutter/material.dart';

import 'package:on_audio_query/on_audio_query.dart';

class ArtistList extends StatefulWidget {
  const ArtistList({Key? key}) : super(key: key);

  @override
  _ArtistListState createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  var audioQuery = OnAudioQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArtistModel>>(
      future: OnAudioQuery().queryArtists(
        sortType: ArtistSortType.DEFAULT,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
      ),
      builder: (context, item) {
        // Loading content
        if (item.data == null)
          return Center(child: CircularProgressIndicator());

        if (item.data!.isEmpty) return Text("Nobody found!");

        return ListView.builder(
          itemCount: item.data!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(item.data![index].artist
                  .replaceFirst("<unknown>", "Unknown Artist")),
              subtitle: Text(
                  item.data![index].numberOfAlbums.toString() + " Album(s)"),
            );
          },
        );
      },
    );
  }
}
