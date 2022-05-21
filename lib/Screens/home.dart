import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_khabar/Screens/news_feed.dart';
import 'package:global_khabar/Screens/personal.dart';
import 'package:global_khabar/Screens/search.dart';
import 'package:global_khabar/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import 'bookmark.dart';

class Home extends StatefulWidget {
  late String cs;
  late String check;


  Home(String cs, String check){
    this.cs= cs;
    this.check= check;



  }


  @override
  _HomeState createState() => _HomeState(cs, check);
}

class _HomeState extends State<Home> {

  late String cs1;
  late String check1;

  _HomeState(String cs1, String check1){
    print("\n\n @@@@@@@@@>> passed value $cs1");
    this.cs1= cs1;
    this.check1= check1;

  }


  int currentIndex = 0;

  void changePage(int? index) {
    if (index != null) {
      setState(() {
        currentIndex = index;
      });
    }
  }









  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=> Data(),

      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0.0,
            toolbarHeight: 70.0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
              ),
            ),
            /*title: Text(
            "Global Khabar",
            style: GoogleFonts.lobster(
              //style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),*/

            automaticallyImplyLeading: false,
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                /*Image.asset('images/icons/icon.jpg',fit: BoxFit.contain, width: 10.0, height: 10.0),*/

                Container(height: 20.0, width: 50.0, color: Colors.lightBlueAccent),
                Container(padding: const EdgeInsets.all(8.0), child:Text(
                  "Global Khabar",
                  style: GoogleFonts.lobster(
                    //style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),),

                GestureDetector(
                    child: new Container(
                        height: 20.0,
                        width: 40.0,
                        decoration: new BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: new BorderRadius.only(

                            topLeft: const Radius.circular(8.0),
                            bottomLeft: const Radius.circular(8.0),
                            topRight: const Radius.circular(8.0),
                            bottomRight: const Radius.circular(8.0),
                          ),

                          border: Border.all(
                            width: 2.0,
                            color: Colors.white,
                          ),
                          // use instead of BorderRadius.all(Radius.circular(20))
                        ),
                        child: new Center(
                          child: new Text("en",
                            style: TextStyle(
                              fontSize: 16.0,
                              height: 0.8,
                            ),
                          ),
                        )
                    ),

                    onTap: () {

                    }
                ),




              ],
            )

        ),
        body: <Widget>[
          newsFeed(cs1, check1),
          search(),
          bookmark(),
          personal(),
        ][currentIndex],
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: currentIndex,
          onTap: changePage,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor: Colors.black12, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.lightBlueAccent,
                icon: SvgPicture.asset(
                  'assets/icons/home_black_24dp.svg',
                  width: 30,
                  color: Colors.black54,
                  height: 30,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/home_black_24dp.svg',
                  width: 30,
                  color: Colors.lightBlueAccent,
                  height: 30,
                ),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: Colors.lightBlueAccent,
                icon: SvgPicture.asset(
                  'assets/icons/search_black_24dp.svg',
                  width: 30,
                  color: Colors.black54,
                  height: 30,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/search_black_24dp.svg',
                  width: 30,
                  color: Colors.lightBlueAccent,
                  height: 30,
                ),
                title: Text("Search")),
            BubbleBottomBarItem(
                backgroundColor: Colors.lightBlueAccent,
                icon: SvgPicture.asset(
                  'assets/icons/bookmark_black_24dp.svg',
                  width: 30,
                  color: Colors.black54,
                  height: 30,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/bookmark_black_24dp.svg',
                  width: 30,
                  color: Colors.lightBlueAccent,
                  height: 30,
                ),
                title: Text("Draft")),
            BubbleBottomBarItem(
                backgroundColor: Colors.lightBlueAccent,
                icon: SvgPicture.asset(
                  'assets/icons/account_circle_black_24dp.svg',
                  width: 30,
                  color: Colors.black54,
                  height: 30,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/account_circle_black_24dp                                                                                                                   .svg',
                  width: 30,
                  color: Colors.lightBlueAccent,
                  height: 30,
                ),
                title: Text("Personal")),
          ],
        ),
      ),
    );
  }
}
