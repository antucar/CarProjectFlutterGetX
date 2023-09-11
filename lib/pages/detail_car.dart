import 'package:carproject/getx/main_controller.dart';
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
            Obx(() => Column(
              children: [
                Text("Brand: ${_maincontroller.brand}"),
                Text("Model: ${_maincontroller.model}"),
                Text("Engine Capacity: ${_maincontroller.engineCapacity}"),
                Text("Engine Type: ${_maincontroller.engineType}"),
                Text("Horsepower: ${_maincontroller.power}"),
                Text("Year: ${_maincontroller.year}"),
                Image.network(_maincontroller.imageUrl.toString()),
              ],
            )),
          ],
        ),
      ),
    );
  }
}


