import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carproject/getx/main_controller.dart';
import 'package:carproject/pages/detail_car.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final _maincontroller = Get.put(MainController());
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _maincontroller.selectRandomCar();
  }

  void checkAnswer() {
    final String enteredModel = modelController.text;
    final String enteredYear = yearController.text;
    final String correctModel = _maincontroller.model.toString();
    final String correctYear = _maincontroller.year.toString();

    if (enteredModel == correctModel && enteredYear == correctYear) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CarDetail()),
      );
    } else {

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Wrong Answer'),
          content: Text('Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Brand: ${_maincontroller.brand}"),
            Image.network(_maincontroller.imageUrl.toString()),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: modelController,
                decoration: InputDecoration(labelText: 'Model'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: yearController,
                decoration: InputDecoration(labelText: 'Year'),
              ),
            ),
            ElevatedButton(
              onPressed: checkAnswer,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                child: Text(
                  'Check',
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
      ),
    );
  }
}
