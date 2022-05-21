import 'package:flutter/material.dart';
import 'package:global_khabar/Model/custom_card.dart';
import 'package:global_khabar/Provider/article.dart';
import 'package:global_khabar/Provider/news.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryNews extends StatefulWidget {

  final String newsCategory;

  CategoryNews({required this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<Article>articles = <Article>[];

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCategoryNews();
  }

  void getCategoryNews() async {
    CatgoryNews news = CatgoryNews();
    await news.getCategoryNews(widget.newsCategory);
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Global Khabar",
          style: GoogleFonts.lobster(
            //style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        /*actions: <Widget>[
          Opacity(
            opacity: 1.0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.share,
                  color: Color(0xFF929292),
                  size: 35.0,
                ),
            ),
          )
        ],*/
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: CircularProgressIndicator(),
      ) : SingleChildScrollView(
        child: Container(
          child: Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return HomePageCard(

                    imageUrl: articles[index].urlToImage ,
                    title: articles[index].title ,
                    desc: articles[index].description ,
                    url: articles[index].url ,

                  );
                }),
          ),
        ),
      ),
    );
  }
}
