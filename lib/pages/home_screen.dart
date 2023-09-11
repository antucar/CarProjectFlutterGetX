import 'package:carproject/getx/main_controller.dart';
import 'package:carproject/pages/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});





   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: CustomScrollView(
         slivers: [
           SliverAppBar(
             automaticallyImplyLeading: true,
             backgroundColor: Colors.black,
             flexibleSpace: FlexibleSpaceBar(
               centerTitle: true,
               title: Text('Car Game'),
             ),
             expandedHeight: 150,
             pinned: true,
           ),
           SliverPadding(
             padding: const EdgeInsets.all(16.0),
             sliver: SliverList(
               delegate: SliverChildListDelegate(
                 [
                   Center(
                     child: ElevatedButton(
                       onPressed: () {
                         Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) => Game()),
                         );
                       },
                       child: Container(
                         alignment: Alignment.center,
                         padding: EdgeInsets.symmetric(
                             vertical: 12.0, horizontal: 24.0),
                         child: Text(
                           ('Play'),
                           style: TextStyle(fontSize: 20.0),
                         ),
                       ),
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.white,
                         foregroundColor: Colors.black,
                         minimumSize: Size(60.0, 60.0),
                         maximumSize: Size(180.0, 60.0),
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(15.0),
                           side: BorderSide(color: Colors.black),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ],
       ),
     );
   }







}