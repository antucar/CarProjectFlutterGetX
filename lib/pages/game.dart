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
    final String enteredModel = modelController.text.toLowerCase();
    final String enteredYear = yearController.text.toLowerCase();
    final String correctModel = _maincontroller.model.toString().toLowerCase();
    final String correctYear = _maincontroller.year.toString().toLowerCase();

    if (enteredModel == correctModel && enteredYear == correctYear) {
      Navigator.push(
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Brand: ${_maincontroller.brand}",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),
            Image.network(
                  _maincontroller.imageUrl.toString(),
                  width: 300.0,
                  height: 300.0,
                ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0,right: 50),
              child: TextField(
                controller: modelController,
                decoration: InputDecoration(labelText: 'Model'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0,right: 50),
              child: TextField(
                controller: yearController,
                decoration: InputDecoration(
                  labelText: 'Year',
                  alignLabelWithHint: true,
                ),
              ),
            ),
            SizedBox(height: 30),
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
