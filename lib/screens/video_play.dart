import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class VideoPlay extends StatelessWidget {
  
  final String url;

  const VideoPlay({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebviewScaffold(url: url),
    );
  }
}


