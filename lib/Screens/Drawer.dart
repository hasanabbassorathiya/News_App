import 'package:flutter/material.dart';
import 'package:news_app/Screens/Home.dart';

import '../Constant.dart';

class NewsDrawer extends StatefulWidget {
  @override
  _NewsDrawerState createState() => _NewsDrawerState();
}

class _NewsDrawerState extends State<NewsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.black12,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.article,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Text(
                      'News App\nBy Hasan Abbas Sorathiya',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                        url: everthing_url,
                      ),
                    ),
                  );
                },
                trailing: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'All News',
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: getDrawerTextStyle(context),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                        url: Apple,
                      ),
                    ),
                  );
                },
                trailing: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'All articles about Apple',
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: getDrawerTextStyle(context),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                        url: Tesla,
                      ),
                    ),
                  );
                },
                trailing: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'All articles about Tesla',
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: getDrawerTextStyle(context),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                        url: top_headlines,
                      ),
                    ),
                  );
                },
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Top business headlines in the US',
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: getDrawerTextStyle(context),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                        url: techcrunch,
                      ),
                    ),
                  );
                },
                trailing: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Top headlines from TechCrunch',
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: getDrawerTextStyle(context),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                        url: wallstreetjournel,
                      ),
                    ),
                  );
                },
                trailing: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Wall Street Journal',
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: getDrawerTextStyle(context),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                        url: Bitcoin,
                      ),
                    ),
                  );
                },
                trailing: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Top Bitcoin headlines',
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: getDrawerTextStyle(context),
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  await showExitPopup(context);
                },
                trailing: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Exit',
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: getDrawerTextStyle(context),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
