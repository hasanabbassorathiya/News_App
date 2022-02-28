import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const api_Key = 'YOUR_API_KEY';
const top_headlines =
    'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$api_Key';
const everthing_url =
    'http://newsapi.org/v2/everything?domains=wsj.com&apiKey=$api_Key&language=en';
const techcrunch =
    'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$api_Key&language=en';
const wallstreetjournel =
    'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$api_Key&language=en';
const Tesla =
    'https://newsapi.org/v2/everything?q=tesla&apiKey=$api_Key&language=en';
const Apple =
    'https://newsapi.org/v2/everything?q=apple&apiKey=$api_Key&language=en';
const Bitcoin =
    'https://newsapi.org/v2/everything?q=bitcoin&apiKey=$api_Key&language=en';

TextStyle getDrawerTextStyle(context) {
  return Theme.of(context).textTheme.headline1!.copyWith(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );
}

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Do you want to exit?"),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('yes selected');
                          exit(0);
                        },
                        child: Text("Yes"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple.shade700),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        print('no selected');
                        Navigator.of(context).pop();
                      },
                      child: Text("No", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
