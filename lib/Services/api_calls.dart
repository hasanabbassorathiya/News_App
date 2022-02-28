import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Constant.dart';

class WebServices {
  Future getNews() async {
    var response = await http.get(
      Uri.parse(top_headlines),
    );

    if (response.statusCode == 200) {
      debugPrint(response.body.toString());
      return response.body;
    } else {
      debugPrint(response.body.toString());
    }
  }

  Future getNewsFromDrawer({required String url}) async {
    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      //debugPrint(response.body.toString());
      return response.body;
    } else {
      debugPrint(response.body.toString());
    }
  }
}
