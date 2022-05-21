
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:global_khabar/Model/categories_model.dart';
import 'package:global_khabar/Model/custom_card.dart';
import 'package:global_khabar/Model/news_categories.dart';
import 'package:global_khabar/Provider/article.dart';
import 'package:global_khabar/Provider/news.dart';
import 'package:global_khabar/Screens/search.dart';
import 'package:provider/provider.dart';

import 'categories_news.dart';

class newsFeed extends StatefulWidget {
  late String cs;
  late String check;

  newsFeed(String cs, String check){
    this.cs= cs;
    this.check= check;

  }
  @override
  _newsFeedState createState() => _newsFeedState(cs, check);
}

class _newsFeedState extends State<newsFeed> with SingleTickerProviderStateMixin {

  final urlImages= [
    "https://cdn3.vectorstock.com/i/1000x1000/21/77/we-are-hiring-door-signage-for-business-unlock-vector-31882177.jpg",
    "https://merojob.com/media/uploads/job/banner/lama_construction_banner_2hdspmw.jpg",
    "https://cdn.aussizzgroup.com/sitecontent/images/BL_accommodation_for_international_students.jpg",
    "http://techlekh.com/wp-content/uploads/2021/07/daraz-maha-bachat-hutmbanil-e1626426523379.png",
    "https://media-exp1.licdn.com/dms/image/C511BAQHJklJbKnUTMw/company-background_10000/0/1531789856221?e=2147483647&v=beta&t=1jnajBfg26L-hJBpGyPpDwqLXJCCXX8VdM01DZBpBh4",
    "https://www.itcollegenepal.com/wp-content/uploads/2021/08/Nami-Banner-1.jpg",
    "https://www.moroccoworldnews.com/wp-content/uploads/2020/08/Morocco-Launches-Digitalization-of-Services-for-Construction-Companies.png",
    "https://play-lh.googleusercontent.com/75XIkGh0jB6weu7X_fLuuSG5dRT9iq-tIqyCMTCC87nERGqsEHvG46aaLJGkKeuCLRI",
    "https://i.ytimg.com/vi/aAFTcXtRvDg/maxresdefault.jpg",
  ];



  late String cs1;
  late String check1;

  String location= 'Null, Pressed Button.';
  String Address= 'search';


  _newsFeedState(String cs1, String check1){
    this.cs1= cs1;
    this.check1= check1;

  }



  List<CategorieModel> categories = <CategorieModel>[];
  List<Article> articles = <Article>[];

  @override
  void initState() {


    if(check1== "main")
      {
        methodCalled();
      }

    print("//////------------>> I am activated.");
    Address = "search";
    // TODO: implement initState
    super.initState();

    setState(() {
      if(check1== "search")
        {
          print("\n\n\n <<<<<<<<<<<<<< I am called >>>>>>>>>>>>\n\n\n");
          getNews(cs1);
        }
    });
    categories = getCategories();

  }



  //---------------------------->> user location for auto country wise news <<-------------------

  void methodCalled() async
  {
    Position position= await _determinePosition();

    print("\n\n\n ----------------- \n\n\n");
    print(position.latitude);

    setState(() {
      location= 'Lat: ${position.latitude}, Long ${position.longitude}';
    });

    GetAddressFromLatLong(position);

  }



  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      //await Geolocator.openLocationSettings();
      methodCalled();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    return await Geolocator.getCurrentPosition();
  }




  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemark= await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);

    Placemark place= placemark[0];

    //Address= placemark[0].country;
    setState(() {
      print("\n\n\n ------------->> Before assign= "+cs1);
      cs1= '${place.country}';

      print("\n\n\n ------------->> After assign= "+Address);
      getNews(cs1);
    });

  }




  //---------------------------------------------------------------------








  void getNews(String CountryName) async {
    print("---------->> getNews() called <<------------");



    //---------------->> for filtering country code <<-------

    if(CountryName== "china" || CountryName== "China" || CountryName== "CHINA")
      setState(() {
        Address= "cn";
      });
    else if(CountryName== "mexico" || CountryName== "Mexico" || CountryName== "MEXICO")
      setState(() {
        Address= "mx";
      });
    else if(CountryName== "USA" || CountryName== "usa" || CountryName== "Usa" || CountryName== "America" || CountryName== "america" || CountryName== "AMERICA" )
      setState(() {
        Address= "us";
      });

    else if(CountryName== "greece" || CountryName== "Greece" || CountryName== "GREECE")
      setState(() {
        Address= "gr";
      });
    else if(CountryName== "netherlands" || CountryName== "Netherlands" || CountryName== "NETHERLANDS")
      setState(() {
        Address= "nl";
      });
    else if(CountryName== "south africa" || CountryName== "South Africa" || CountryName== "SOUTH AFRICA")
      setState(() {
        Address= "za";
      });
    else if(CountryName== "australia" || CountryName== "Australia" || CountryName== "AUSTRALIA")
      setState(() {
        Address= "au";
      });
    else if(CountryName== "hong kong" || CountryName== "Hong Kong" || CountryName== "HONG KONG")
      setState(() {
        Address= "hk";
      });
    else if(CountryName== "new zealand" || CountryName== "New Zealand" || CountryName== "NEW ZEALAND")
      setState(() {
        Address= "nz";
      });
    else if(CountryName== "south korea" || CountryName== "South Korea" || CountryName== "SOUTH KOREA")
      setState(() {
        Address= "kr";
      });
    else if(CountryName== "austria" || CountryName== "Austria" || CountryName== "AUSTRIA")
      setState(() {
        Address= "at";
      });
    else if(CountryName== "hungry" || CountryName== "Hungry" || CountryName== "HUNGRY")
      setState(() {
        Address= "hu";
      });
    else if(CountryName== "nigeria" || CountryName== "Nigeria" || CountryName== "NIGERIA")
      setState(() {
        Address= "ng";
      });
    else if(CountryName== "sweden" || CountryName== "Sweden" || CountryName== "SWEDEN")
      setState(() {
        Address= "se";
      });
    else if(CountryName== "belgium" || CountryName== "Belgium" || CountryName== "BELGIUM")
      setState(() {
        Address= "be";
      });
    else if(CountryName== "india" || CountryName== "India" || CountryName== "INDIA")
      setState(() {
        Address= "in";
      });
    else if(CountryName== "norway" || CountryName== "Norway" || CountryName== "NORWAY")
      setState(() {
        Address= "no";
      });
    else if(CountryName== "switzerland" || CountryName== "Switzerland" || CountryName== "SWITZERLAND")
      setState(() {
        Address= "ch";
      });



    else if(CountryName== "brazil" || CountryName== "Brazil" || CountryName== "BRAZIL")
      setState(() {
        Address= "br";
      });

    else if(CountryName== "indonesia" || CountryName== "Indonesia" || CountryName== "INDONESIA")
      setState(() {
        Address= "no";
      });
    else if(CountryName== "philippines" || CountryName== "Philippines" || CountryName== "PHILIPPINES")
      setState(() {
        Address= "ph";
      });
    else if(CountryName== "taiwan" || CountryName== "Taiwan" || CountryName== "TAIWAN")
      setState(() {
        Address= "tw";
      });
    else if(CountryName== "bulgaria" || CountryName== "Bulgaria" || CountryName== "BULGARIA")
      setState(() {
        Address= "bg";
      });
    else if(CountryName== "ireland" || CountryName== "Ireland" || CountryName== "IRELAND")
      setState(() {
        Address= "ie";
      });
    else if(CountryName== "poland" || CountryName== "Poland" || CountryName== "POLAND")
      setState(() {
        Address= "pl";
      });
    else if(CountryName== "thailand" || CountryName== "Thailand" || CountryName== "THAILAND")
      setState(() {
        Address= "th";
      });
    else if(CountryName== "canada" || CountryName== "Canada" || CountryName== "CANADA")
      setState(() {
        Address= "ca";
      });
    else if(CountryName== "israel" || CountryName== "Israel" || CountryName== "ISRAEL")
      setState(() {
        Address= "il";
      });
    else if(CountryName== "portugal" || CountryName== "Portugal" || CountryName== "PORTUGAL")
      setState(() {
        Address= "pt";
      });

    else if(CountryName== "turkey" || CountryName== "Turkey" || CountryName== "TURKEY")
      setState(() {
        Address= "tr";
      });
    else if(CountryName== "china" || CountryName== "China" || CountryName== "CHINA")
      setState(() {
        Address= "cn";
      });
    else if(CountryName== "italy" || CountryName== "Italy" || CountryName== "ITALY")
      setState(() {
        Address= "it";
      });
    else if(CountryName== "romania" || CountryName== "Romania" || CountryName== "ROMANIA")
      setState(() {
        Address= "ro";
      });
    else if(CountryName== "uae" || CountryName== "Uae" || CountryName== "UAE")
      setState(() {
        Address= "ae";
      });
    else if(CountryName== "colombia" || CountryName== "Colombia" || CountryName== "COLOMBIA")
      setState(() {
        Address= "co";
      });
    else if(CountryName== "japan" || CountryName== "Japan" || CountryName== "JAPAN")
      setState(() {
        Address= "jp";
      });
    else if(CountryName== "russia" || CountryName== "Russia" || CountryName== "RUSSIA")
      setState(() {
        Address= "ru";
      });

    else if(CountryName== "ukraine" || CountryName== "Ukraine" || CountryName== "UKRAINE")
      setState(() {
        Address= "ua";
      });

    else if(CountryName== "cuba" || CountryName== "Cuba" || CountryName== "CUBA")
      setState(() {
        Address= "cu";
      });

    else if(CountryName== "latvia" || CountryName== "Latvia" || CountryName== "LATVIA")
      setState(() {
        Address= "lv";
      });

    else if(CountryName== "saudi arabia" || CountryName== "Saudi Arabia" || CountryName== "SAUDI ARABIA")
      setState(() {
        Address= "sa";
      });

    else if(CountryName== "uk" || CountryName== "Uk" || CountryName== "UK")
      setState(() {
        Address= "gb";
      });

    else if(CountryName== "egypt" || CountryName== "Egypt" || CountryName== "EGYPT")
      setState(() {
        Address= "eg";
      });

    else if(CountryName== "malaysia" || CountryName== "Malaysia" || CountryName== "MALAYSIA")
      setState(() {
        Address= "my";
      });

    else if(CountryName== "singapore" || CountryName== "Singapore" || CountryName== "SINGAPORE")
      setState(() {
        Address= "sg";
      });

    else if(CountryName== "venuzuela" || CountryName== "Venuzuela" || CountryName== "VENUZUELA")
      setState(() {
        Address= "ve";
      });

    else if(CountryName== "france" || CountryName== "France" || CountryName== "FRANCE")
      setState(() {
        Address= "fr";
      });

    else if(CountryName== "slovakia" || CountryName== "Slovakia" || CountryName== "SLOVAKIA")
      setState(() {
        Address= "sk";
      });

    else if(CountryName== "germany" || CountryName== "Germany" || CountryName== "GERMANY")
      setState(() {
        Address= "de";
      });

    else if(CountryName== "morocco" || CountryName== "Morocco" || CountryName== "MOROCCO")
      setState(() {
        Address= "ma";
      });

    else if(CountryName== "slovenia" || CountryName== "Slovenia" || CountryName== "SLOVENIA")
      setState(() {
        Address= "si";
      });

    else {

      Fluttertoast.showToast(

        msg: "Sorry! ${Address} news is not available",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
        gravity: ToastGravity.CENTER,
      );

      Address= "us";
    }





    //-------------------------------------------------------


    News news = News();

      /*String code= Provider.of<Data>(context, listen: false).data;*/
      print("\n\n &&&&&&&&&&&&>> $Address\n\n");
      await news.getNews(Address);
      setState(() {

        articles = news.news;
      });


   /* setState(() {
      _loading = false;
    });*/
  }

  @override
  Widget build(BuildContext context)  {
    return ChangeNotifierProvider<Data>(
      create: (context)=> Data(),
      child: Scaffold(
        body: SafeArea(
          child: Address =="search" ? Center(
            child: CircularProgressIndicator(),
          )
              : Column(
                children: [

                  /// Categories
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            //imageAssetUrl: categories[index].imageAssetUrl,
                            categoryName: categories[index].categorieName,
                          );
                        }),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0,),
                    margin: EdgeInsets.only(left: 16.0, right: 16.0,),
                    height: 180.0,
                    width: double.infinity,

                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 200.0,
                        autoPlay: true,
                        //reverse: true,
                        autoPlayInterval: Duration(seconds: 2),
                      ),
                      itemCount: urlImages.length,
                      itemBuilder:(context, index, realIndex){
                        final urlImage= urlImages[index];

                        return buildImage(urlImage, index);
                      },
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 10.0),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: <Widget>[

                            /// Custom Card
                            Container(
                  
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
                                      //content: articles[index].content ?? "",
                                      //posturl: articles[index].articleUrl ?? "",
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index){
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.grey,
      width: double.infinity,
      child: Image.network(
        urlImage,
        fit: BoxFit.fill,
      ),
    );
  }

}


///Displaying News categories on the Home screen of the application
class CategoryCard extends StatelessWidget {
  final String /*imageAssetUrl*/ categoryName;

  CategoryCard({/*required this.imageAssetUrl,*/ required this.categoryName});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
              newsCategory: categoryName.toLowerCase(),
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            /* ClipRRect(
              borderRadius: BorderRadius.circular(5),
             child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),*/
            Container(
              padding: EdgeInsets.only(top: 10),
              //alignment: Alignment.center,
              //height: 60,
              //width: 120,
             /* decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26
              ),*/
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontFamily: "Avenir",
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

