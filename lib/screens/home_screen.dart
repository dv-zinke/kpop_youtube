import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kpop_youtube/models/play_list_item.dart';
import 'package:kpop_youtube/screens/YoutubeList1.dart';
import 'package:kpop_youtube/screens/video_play2.dart';
import 'package:kpop_youtube/utils/googleAdmob.dart';
import 'package:kpop_youtube/utils/services.dart';
import 'package:kpop_youtube/widget/side_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleAdmob adMob = GoogleAdmob();
  String playListId;

  @override
  void initState() {
    super.initState();
    adMob.init();
  }

  void setPlayListId(String z) {
    print("Z");
    print(z);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(onTap: setPlayListId,),
      appBar: AppBar(
        title: Text("KPOPTUBE"),
      ),
      body:YoutubeList1(playListId: playListId,)
    );
  }
}
