import 'package:appium_one/scroll_page.dart';
import 'package:flutter/material.dart';

import 'helpers/confirm_pop_up.dart';
import 'helpers/toast_helper.dart';


class HomeScreenPage extends StatefulWidget {

  final String username; // Example parameter

  const HomeScreenPage({super.key, required this.username}); // Constructor

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Welcome", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),key: ValueKey("welcome"),),centerTitle: true,),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("You are currently login as a ${widget.username} ",style: TextStyle(fontSize: 15),),

               // Center(child: Text("Welcome back folks",style: TextStyle(color: Colors.green,fontSize: 30),)),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),

                        onPressed: (){
                          showSubmitConfirmationDialog(
                            context: context,
                            onConfirm: (){
                              showCustomToastSuccess(context,"Success");
                            }
                          );
                          },

                           child: Text("Open Dialog Box",style: TextStyle(color: Colors.white),
                        ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

          TextButton(
              key: Key("scrollPageButton"), // Key for Appium test
              onPressed: () {


                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScrollTestPage()),
                );




              },

              child: Text("Scroll up down"),
          )
              ]
          ),
        )
    );
  }
}

