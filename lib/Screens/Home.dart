import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Constant.dart';
import 'package:news_app/Models/news_model.dart';
import 'package:news_app/Screens/Drawer.dart';
import 'package:news_app/Screens/news_screen.dart';
import 'package:news_app/Services/api_calls.dart';

class Home extends StatefulWidget {
  String url;
  Home({this.url = everthing_url});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    debugPrint(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await showExitPopup(context);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
              softWrap: true,
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  await showExitPopup(context);
                },
                icon: Icon(
                  Icons.exit_to_app,
                ),
              ),
            ],
          ),
          drawer: NewsDrawer(),
          body: RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: FutureBuilder(
              future: WebServices().getNewsFromDrawer(url: widget.url),
              builder: (context, apiCalls) {
                if (apiCalls.hasError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                } else if (apiCalls.connectionState != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (apiCalls.hasData && apiCalls.data != null) {
                    NewsModel newsModel =
                        newsModelFromJson(apiCalls.data.toString());
                    debugPrint(newsModel.status.toString());
                    return ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10),
                        itemCount: newsModel.articles!.length,
                        itemBuilder: (context, index) {
                          var article = newsModel.articles![index];
                          var formattedTime = DateFormat('dd MMM - HH:mm')
                              .format(article.publishedAt!);
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsScreen(
                                    url: article.url,
                                    title: article.title,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 100,
                              margin: const EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(
                                          article.urlToImage.toString(),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  const SizedBox(width: 16),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(formattedTime),
                                        Text(
                                          article.title.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          article.description.toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
