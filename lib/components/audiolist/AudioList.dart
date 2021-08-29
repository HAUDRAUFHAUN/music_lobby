import 'package:flutter/material.dart';

import 'package:on_audio_query/on_audio_query.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AudioList extends StatefulWidget {
  const AudioList({Key? key}) : super(key: key);

  @override
  _AudioListState createState() => _AudioListState();
}

class _AudioListState extends State<AudioList> {
  var audioQuery = OnAudioQuery();

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  requestPermission() async {
    // Web platform don't support permissions methods.
    if (!kIsWeb) {
      bool permissionStatus = await audioQuery.permissionsStatus();
      if (!permissionStatus) {
        await audioQuery.permissionsRequest();
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
      future: OnAudioQuery().querySongs(
        sortType: SongSortType.DEFAULT,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
      ),
      builder: (context, item) {
        // Loading content
        if (item.data == null)
          return Center(child: CircularProgressIndicator());

        // When you try "query" without asking for [READ] or [Library] permission
        // the plugin will return a [Empty] list.
        if (item.data!.isEmpty) return Text("Nothing found!");

        // You can use [item.data!] direct or you can create a:
        // List<SongModel> songs = item.data!;
        return ListView.builder(
          itemCount: item.data!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(item.data![index].title),
              subtitle: Text(item.data![index].artist ?? "No Artist"),
              // This Widget will query/load image. Just add the id and type.
              // You can use/create your own widget/method using [queryArtwork].
              leading: QueryArtworkWidget(
                id: item.data![index].id,
                type: ArtworkType.AUDIO,
              ),
            );
          },
        );
      },
    );
  }
}
