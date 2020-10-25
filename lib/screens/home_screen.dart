import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kpop_youtube/models/play_list_item.dart';
import 'package:kpop_youtube/screens/video_play.dart';
import 'package:kpop_youtube/screens/video_play2.dart';
import 'package:kpop_youtube/screens/video_player_screen.dart';
import 'package:kpop_youtube/utils/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlaylistItem _playlistItem;
  bool _isLoading;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _scrollController = ScrollController();
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Drawer Header"),
              decoration: BoxDecoration(
                color: Colors.red
              ),
            ),
            ListTile(
              title: Text("dd 1"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("KPOPTUBE"),
      ),
      body: _isLoading ? CircularProgressIndicator() : Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: NotificationListener<ScrollEndNotification>(
                onNotification: (ScrollNotification notification){
                  if(notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                    print("끝");
                  }
                  return true;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _playlistItem.items.length,
                  itemBuilder: (context, index) {
                    Item item = _playlistItem.items[index];
                    return InkWell(
                      onTap: () async {
                        print("https://youtube.com/embed/${item.snippet.resourceId.videoId}?autoplay=1");
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return VideoPlay2(videoId: item.snippet.resourceId.videoId,);
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(color: Colors.black),
                              child: IndexedStack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: item.snippet.thumbnails.thumbnailsDefault.url,
                                  ),
                                  Positioned(child:
                                  Text("A", style: TextStyle(color: Colors.white),), bottom: 0, right: 0,)

                                ],
                              ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
