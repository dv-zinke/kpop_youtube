import 'dart:core';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kpop_youtube/models/channel_info.dart';
import 'package:kpop_youtube/models/play_list_item.dart';
import 'package:kpop_youtube/utils/ApiKey.dart';

class Services {
  static const PLAYLIST_ID = "PLo4pli4CxHm3pnBZLxHV8uubvCRF52C6C";
  static const _baseUrl = "www.googleapis.com";

  static Future<PlaylistItem> getPlayListItem() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails',
      'playlist_id': PLAYLIST_ID,
      'key': ApiKey.youtubeKey
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    Uri uri = Uri.https(_baseUrl, '/youtube/v3/playlistItems', parameters);
    print(uri);
    Response response = await http.get(uri, headers: headers);
    print(response.body);
    PlaylistItem playlistItem = playlistItemFromJson(response.body);
    return playlistItem;
  }
}
