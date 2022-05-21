import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';



import 'createAccount.dart';
import 'loginPage.dart';

class personal extends StatefulWidget {
  const personal({Key? key}) : super(key: key);

  @override
  State<personal> createState() => _personalState();
}

class _personalState extends State<personal> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(

          elevation: 0.0,
          toolbarHeight: 10.0,
          //centerTitle: true,


          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(0.0),
              ),
            ),
          ),

        ),
        body: Column(
          children: <Widget> [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 0.0),
                //color: Colors.red,
                height: 300.0,

               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(60.0),
                   topRight: Radius.circular(60.0),

                 ),

               ),

               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget> [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
             
                     children: <Widget> [
                        Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: Text("Preferences",
                              style: GoogleFonts.mcLaren(fontSize: 20),

                            )),

                     ],
                   ),

                   Divider(
                     color: Colors.grey,
                     height: 36.0,
                     thickness: 2,
                   ),

                   Container(

                     margin: EdgeInsets.only(left:20.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget> [


                         Text("Account.............",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                         ),

                         SizedBox(
                           height: 16.0,
                         ),

                         TextButton(
                           style: TextButton.styleFrom(
                             minimumSize: Size.zero,
                             padding: EdgeInsets.all(0),
                             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                           ),
                           onPressed: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => const LoginPage()),
                             );

                           },
                           child: Text("Log into your Global Khabar Account.",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                           ),
                         ),

                         SizedBox(
                           height: 16.0,
                         ),
                         Divider(
                           color: Colors.grey[300],
                           height: 0.0,
                           thickness: 2,
                         ),

                         SizedBox(
                           height: 16.0,
                         ),

                         TextButton(
                           onPressed: () {
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => const CreateAccount()),
                             );
                           },
                           style: TextButton.styleFrom(
                             minimumSize: Size.zero,
                             padding: EdgeInsets.all(0),
                             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                           ),

                           child: Text("Create Account",
                             style: TextStyle(
                               color: Colors.grey[500],
                               fontSize: 15,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),

                         SizedBox(
                           height: 16.0,
                         ),

                         Divider(
                           color: Colors.grey[300],
                           height: 0.0,
                           thickness: 2,
                         ),

                         SizedBox(
                           height: 16.0,
                         ),

                         Text("General.............",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 20.0,
                             color: Colors.grey,
                             fontStyle: FontStyle.italic,
                           ),
                         ),

                         SizedBox(
                           height: 16.0,
                         ),
/*
                         TextButton(
                           onPressed: () {},
                           style: TextButton.styleFrom(
                             minimumSize: Size.zero,
                             padding: EdgeInsets.all(0),
                             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                           ),
                           child: Text("About Us",
                             style: TextStyle(
                               color: Colors.grey[500],
                               fontSize: 15,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),

                         SizedBox(
                           height: 16.0,
                         ),
                         Divider(
                           color: Colors.grey[300],
                           height: 0.0,
                           thickness: 2,
                         ),

                         SizedBox(
                           height: 16.0,
                         ),

                         TextButton(
                           onPressed: () {},
                           style: TextButton.styleFrom(
                             minimumSize: Size.zero,
                             padding: EdgeInsets.all(0),
                             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                           ),
                           child: Text("Developed By",
                             style: TextStyle(
                               color: Colors.grey[500],
                               fontSize: 15,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),

                         SizedBox(
                           height: 16.0,
                         ),

                         Divider(
                           color: Colors.grey[300],
                           height: 0.0,
                           thickness: 2,
                         ),

                         SizedBox(
                           height: 16.0,
                         ), */

                         Row(
                           children: <Widget> [
                             TextButton(

                               onPressed: () {
                                 FlutterShare.share(
                                     title: 'Example share',
                                     text: 'Global Khabar',
                                     linkUrl: 'https://flutter.dev/',
                                     chooserTitle: 'Example Chooser Title');
                               },

                               style: TextButton.styleFrom(
                                 minimumSize: Size.zero,
                                 padding: EdgeInsets.all(0),
                                 tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                               ),


                               child: Text("Share",
                                 style: TextStyle(
                                   color: Colors.grey[500],
                                   fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                             ),


                           ],
                         ),

                         SizedBox(
                           height: 16.0,
                         ),
                         Divider(
                           color: Colors.grey[300],
                           height: 0.0,
                           thickness: 2,
                         ),
/*
                         SizedBox(
                           height: 16.0,
                         ),


                         Text("App Preference..............",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 20.0,
                             color: Colors.grey,
                             fontStyle: FontStyle.italic,
                           ),
                         ),

                         SizedBox(
                           height: 16.0,
                         ),

                         TextButton(
                           onPressed: () {},
                           style: TextButton.styleFrom(
                             minimumSize: Size.zero,
                             padding: EdgeInsets.all(0),
                             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                           ),
                           child: Text("Theme",
                             style: TextStyle(
                               color: Colors.grey[500],
                               fontSize: 15,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ),

                         SizedBox(
                           height: 16.0,
                         ),
                         Divider(
                           color: Colors.grey[300],
                           height: 0.0,
                           thickness: 2,
                         ),

                         SizedBox(
                           height: 16.0,
                         ),

                         SizedBox(
                           height: 16.0,
                         ), */




                       ],
                     ),
                   ),


                 ],
               ),
               // width: 300.0,
              ),
            ),

          ],
        ),
    );
  }
}

