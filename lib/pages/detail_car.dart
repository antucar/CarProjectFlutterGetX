import 'package:carproject/getx/main_controller.dart';
import 'package:carproject/pages/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CarDetail extends StatefulWidget {
  @override
  _CarDetail createState() => _CarDetail();
}


class _CarDetail extends State<CarDetail> {

  final MainController _maincontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("Correct Answer",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                  ),
                ),
                SizedBox(height: 20,),
                Text("${_maincontroller.brand} ${_maincontroller.model}",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
                Text("${_maincontroller.engineCapacity}",style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
                ),
                SizedBox(height: 10,),
                Text("${_maincontroller.engineType}",style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
                ),
                SizedBox(height: 10,),
                Text("${_maincontroller.power}",style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
                ),
                SizedBox(height: 10,),
                Text("${_maincontroller.year}",style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
                ),
                SizedBox(height: 10,),
                Image.network(
                  _maincontroller.imageUrl.toString(),
                  width: 220.0,
                  height: 220.0,
                ),
                SizedBox(height: 30,),
                ElevatedButton(
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
                      ('Next Car'),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}


