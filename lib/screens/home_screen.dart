import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kpop_youtube/models/play_list_item.dart';
import 'package:kpop_youtube/screens/video_player_screen.dart';
import 'package:kpop_youtube/utils/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlaylistItem _playlistItem;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _getPlayListItem();
  }

  _getPlayListItem() async {
    _playlistItem = await Services.getPlayListItem();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KPOPTUBE"),
      ),
      body: _isLoading ? CircularProgressIndicator() : Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _playlistItem.items.length,
                itemBuilder: (context, index) {
                  Item item = _playlistItem.items[index];
                  return InkWell(
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return VideoPlayerScreen(item: item);
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: item.snippet.thumbnails.thumbnailsDefault.url,
                          ),
                          SizedBox(width: 20,),
                          Flexible(child: Text(item.snippet.title)),
                          SizedBox(width: 20,),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
