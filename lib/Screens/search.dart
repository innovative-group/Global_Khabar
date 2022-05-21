import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_khabar/Provider/news.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'news_feed.dart';



class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}



class _searchState extends State<search> {

  TextEditingController searchWord= new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 120),
      children: <Widget>[
        Container(
          height: 48,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color(0xFFcdcdcd),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.16),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

              children: [
                  Expanded(
                    child: TextField(
                      controller: searchWord,
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: "Search for country news",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15),
                      ),


                    ),
                  ),
                  IconButton(

                    icon: Icon(Icons.search, size: 35.0,),
                    onPressed: () {
                      /*Data d1= new Data();
                      d1.changeCountryCode(searchWord.text);*/
                      String countryName;


                      Provider.of<Data>(context, listen: false).changeCountryCode(searchWord.text);
                      print("\n\n%%%%%%%%%%%>>"  + searchWord.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(searchWord.text, "search")));
                    },
                    color: Color(0xFF929292),


                  ),
              ],
          ),
        ),
      ],
    );
  }
}

class Data extends ChangeNotifier{

  String data= "us";


  void changeCountryCode(String newText)
  {
    data= newText;
    print("\n\n################# $data");
    notifyListeners();
    print("\n\n*************> $newText ************\n\n");

  }
}