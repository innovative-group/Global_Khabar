

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:global_khabar/Screens/news_article.dart';
import '../bookmark/news_model.dart';
import '../bookmark/helper.dart';


class HomePageCard extends StatefulWidget {
  final NewsModel? contact;

  final String imageUrl, title, desc, url;

  HomePageCard(
      {Key? key,
        required this.imageUrl, required this.title, required this.desc, required this.url,
        this.contact})
      : super(key: key);

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  String iconColor= "white";
  int isClicked= 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              articleUrl: widget.url,
            )
        ));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              /*border: Border.all(
             // color: Colors.lightBlueAccent,//(0xFF757575),
              width: 3.0,
            ),*/
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    /* border: Border.all(
                  color: Color(0xff707070),
                  width: 1,
                ),*/
                    image: DecorationImage(
                        image: NetworkImage(widget.imageUrl), fit: BoxFit.fill),
                  ),
                  /* child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.black.withOpacity(0.33),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    )
                  ],
                ),
              ), */
                ),

                Container(
                  height: 33.0,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      IconButton(
                        onPressed: () async{
                          print("\n\n ---------->> Bookmark has been pressed.\n\n\n");

                          setState(() {
                            if(isClicked== 1)
                            {
                              isClicked= 0;
                            }
                            else{
                              isClicked= 1;
                            }


                          });
                          await DBHelper.saveNews(NewsModel(
                            title: widget.title,
                            desc: widget.url,
                          ));
                        },

                        icon: Icon (
                          //Icons.bookmark_border_sharp,
                          isClicked != 0 ? Icons.bookmark_sharp :  Icons.bookmark_border_sharp,
                          color: isClicked != 0 ? Colors.black54 : Colors.black45,
                          size: 28.0,
                        ),
                      ),


                      SizedBox(
                        width: 10,
                      ),


                      IconButton(
                        onPressed: () async{
/*
                     final urlImage= '$imageUrl';
                     final url= Uri.parse(urlImage);
                     final response= await http.get(url);
                     final bytes= response.bodyBytes;

                     final temp= await getTemporaryDirectory();
                     final path= '${temp.path}/image.jpg';
                     File(path).writeAsBytesSync(bytes);



                     await Share.shareFiles([path], text: "$title");
                     print("\n\n--------->> $title \n\n");
                     print("\n\n--------->> $desc \n\n");*/

                          FlutterShare.share(
                              title: '${widget.title}',
                              text: '${widget.desc}',
                              linkUrl: '${widget.url}',
                              chooserTitle: '${widget.imageUrl}');
                        },
                        icon: Icon(Icons.share),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),

                /*Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Container(
                height: 2,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFcdcdcd),
                ),
              ),
            ),*/


                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 0.0, bottom: 5.0,
                  ),
                  child: Text(widget.title,
                    style: TextStyle(
                      fontFamily: "League",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                /* SizedBox(
              height: 7,
            ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}