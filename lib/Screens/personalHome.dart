import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import '../Model/user_model.dart';
import 'home.dart';


class PersonalHome extends StatefulWidget {
  const PersonalHome({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PersonalHome> {


  TextEditingController textAreaMsg= new TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

      },

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Welcome"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[



                Text(
                  "Welcome to your Personal Home Page",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${loggedInUser.username}",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    )),
                Text("${loggedInUser.email}",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 15,
                ),


                TextFormField(
                  maxLines: 8,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(

                      hintText: "leave your feedback...",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(new Radius.circular(25.0))),
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                  controller: textAreaMsg,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty value";
                    }
                  },
                ),

                SizedBox(height: 20.0),

                Row(
                  children: <Widget> [
                    ActionChip(
                        label: Text("send",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),),
                        onPressed: () {

                          print("\n\n\n------->> this is email \n\n");
                          LauchEmail(
                            toEmail: "suyashshrestha48@gmail.com",
                            subject: "feedback",
                            message: "This is feed back from user."
                          );
                        }),
                    SizedBox(width: 20),
                    ActionChip(
                        label: Text("Logout",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),),
                        onPressed: () {
                          logout(context);
                        }),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home("us", "search")));
  }

  // for sending the email
  Future LauchEmail({ required String toEmail, required String subject, required String message}) async
  {

    print(" LaunchEmail is called \n\n");
/*
    String toEmail= "neupal22@gmail.com";
    String subject= "feedback";
    String message= msg;*/
    final Uri _emailLaunchUri= Uri(
        scheme: 'mailto',
        path: 'suyashshrestha48@gmail.com',
        queryParameters: {'subject': "Testing URL launcher", 'body': 'Message'});

    _launch(_emailLaunchUri.toString());

  }

  _launch(url) async {
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else {
      throw 'Could not launch $url';
    }
  }



}

