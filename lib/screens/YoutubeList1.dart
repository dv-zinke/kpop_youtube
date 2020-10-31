import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kpop_youtube/models/play_list_item.dart';
import 'package:kpop_youtube/screens/video_play2.dart';
import 'package:kpop_youtube/utils/googleAdmob.dart';
import 'package:kpop_youtube/utils/services.dart';

class YoutubeList1 extends StatefulWidget {
  @override
  _YoutubeList1State createState() => _YoutubeList1State();
}

class _YoutubeList1State extends State<YoutubeList1> {
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
    return _isLoading
        ? Container(child: Center(child: CircularProgressIndicator()))
        : Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent) {
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
                      GoogleAdmob().hideBanner();
                      print("A");
//                      await Navigator.push(context,
//                          MaterialPageRoute(builder: (context) {
//                            return VideoPlay2(
//                              videoId: item.snippet.resourceId.videoId,
//                            );
//                          }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: item.snippet.thumbnails
                                    .thumbnailsDefault.url,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              Positioned(
                                child: Container(
                                  child: Text(
                                    "test",
                                    style:
                                    TextStyle(color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.black),
                                ),
                                bottom: 0,
                                right: 0,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(child: Text(item.snippet.title)),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}
