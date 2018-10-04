import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workshop_news/models/article.dart';

class ScienceTab extends StatefulWidget {
  @override
  _ScienceTabState createState() => new _ScienceTabState();
}

class _ScienceTabState extends State<ScienceTab> {

  List<Article> _articles = List<Article>();

  void _fetchArticles() async {
    var url = 'https://newsapi.org/v2/top-headlines?country=it&category=science&apiKey=fc0b950863f0456ebe2c7721f024684c';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var _body = jsonDecode(response.body);

      _body['articles'].forEach(
          (a) {
            Article article;
            article = Article.fromJson(a);
            setState(() {
              _articles.add(article);
            });
          }
      );


//      setState(() {
//        _articles = _body['articles'];
//      });
    }
    print('Loaded ${_articles.length}');
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    _fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    if (_articles.length > 0) {
      return Center(
          child: Column(
              children: <Widget>[
                Expanded(
                    child: ListView.builder(
                      itemCount: _articles.length,
                      itemBuilder: (BuildContext context, int index) {

                        Article _postItem;
                        _postItem = _articles[index];

                        return ExpansionTile(
                          leading: Image.network(_postItem.img.toString(), height: 50.00, width: 50.00,),
                          title: Text(_postItem.title),
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                                    child: Text(_postItem.content.toString()),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      IconButton(icon: Icon(Icons.launch), onPressed: () => _launchURL(_postItem.url)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider()
                          ],
                        );
                      },
                    )
                )
              ]
          )
      );
    } else {
      return AlertDialog(
        content: LinearProgressIndicator(),
        title: Text("Fetching Post"),
      );
    }
  }
}

