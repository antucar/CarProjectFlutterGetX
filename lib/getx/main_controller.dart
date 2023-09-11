import 'dart:math';

import 'package:carproject/util/cars.dart';
import 'package:get/get.dart';

class MainController extends GetxController {

  RxString brand = ''.obs;
  RxString model = ''.obs;
  RxString year = ''.obs;
  RxString engineType = ''.obs;
  RxString engineCapacity = ''.obs;
  RxString power = ''.obs;
  RxString imageUrl = ''.obs;

  // Rastgele bir araba seçen fonksiyon
  void selectRandomCar() {
    final List<Map<String, dynamic>>? carList = cars['cars'];
    if (carList!.isNotEmpty) {
      final randomCarIndex = Random().nextInt(carList.length);
      final selectedCar = carList[randomCarIndex];

      // Seçilen araba özelliklerini atama
      brand.value = selectedCar['brand'];
      model.value = selectedCar['model'];
      year.value = selectedCar['year'];
      engineType.value = selectedCar['engine_type'];
      engineCapacity.value = selectedCar['engine_capacity'];
      power.value = selectedCar['power'];
      imageUrl.value = selectedCar['image_url'];
    }
  }
}
