
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class VideoPlay2 extends StatefulWidget {

  final String videoId;

  const VideoPlay2({Key key, this.videoId}) : super(key: key);
  @override
  _VideoPlay2State createState() => _VideoPlay2State();
}

class _VideoPlay2State extends State<VideoPlay2> {
  InAppWebViewController webView;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrl: "https://www.youtube.com/embed/${widget.videoId}?autoplay=1&controls=1&rel=0",
      initialHeaders: {},
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          debuggingEnabled: true,
          mediaPlaybackRequiresUserGesture: false
        ),
      ),
      onWebViewCreated: (InAppWebViewController controller) {
        print("z");
        webView = controller;
      },
      onLoadStart: (InAppWebViewController controller, String url) {
        print("a");
      },
      onLoadStop: (InAppWebViewController controller, String url) {
        webView.evaluateJavascript(source: 'document.querySelector(".ytp-large-play-button").click()');
        print("B");
      },
    );
  }
}
