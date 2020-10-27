import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kpop_youtube/models/play_list_item.dart';
import 'package:kpop_youtube/screens/YoutubeList1.dart';
import 'package:kpop_youtube/screens/video_play2.dart';
import 'package:kpop_youtube/utils/services.dart';
import 'package:kpop_youtube/widget/side_menu.dart';

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
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text("KPOPTUBE"),
      ),
      body:YoutubeList1()
    );
  }
}
