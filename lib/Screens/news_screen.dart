import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  String? url;
  String? title;

  NewsScreen({this.url, this.title});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  int position = 1;
  bool isLoaded = false;
  int pro = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title.toString(),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  Share.share(
                      widget.url.toString() + '\n\n' + widget.title.toString(),
                      subject: widget.title.toString());
                },
                icon: const Icon(
                  Icons.share,
                ))
          ],
        ),
        body: IndexedStack(
          index: position,
          children: [
            WebView(
              initialUrl: widget.url,
              onProgress: (progress) {
                setState(() {
                  pro = progress;
                });
              },
              onPageStarted: (value) {
                setState(() {
                  position = 1;
                });
              },
              onPageFinished: (value) {
                setState(() {
                  position = 0;
                });
              },
              initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
              gestureNavigationEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              backgroundColor: const Color(0x00000000),
              allowsInlineMediaPlayback: true,
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(
                    'Loading ${pro}%',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
