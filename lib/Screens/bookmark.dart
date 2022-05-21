import 'package:flutter/material.dart';
import '../bookmark/news_model.dart';
import '../bookmark/helper.dart';
import 'news_article.dart';

class bookmark extends StatefulWidget {

  const bookmark({Key? key}) : super(key: key);

  @override
  State<bookmark> createState() => _bookmarkState();
}

class _bookmarkState extends State<bookmark> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //add Future Builder to get contacts
      body: FutureBuilder<List<NewsModel>>(
        future: DBHelper.readNews(), //read contacts list here
        builder: (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot) {
          //if snapshot has no data yet
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Loading...'),
                ],
              ),
            );
          }
          //if snapshot return empty [], show text
          //else show contact list
          return snapshot.data!.isEmpty
              ? Center(
            child: Text('No Bookmark in List yet!'),
          )
              : ListView(
            children: snapshot.data!.map((contacts) {

              return Center(
                child: ListTile(
                  title: Text(contacts.title),
                  subtitle: Text(contacts.desc),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await DBHelper.deleteNews(contacts.id!);
                      setState(() {
                        //rebuild widget after delete
                      });
                    },
                  ),

                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ArticleView(
                          articleUrl: contacts.desc,
                        )
                    ));
                  },

                ),
              );
            }).toList(),
          );
        },
      ),

    );
  }
}
