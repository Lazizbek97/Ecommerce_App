import 'package:ecommerce/core/hive/hive_boxes.dart';
import 'package:hive/hive.dart';

import '../model/foods_model.dart';

class AddingToHive {
  static saveToBasket(FoodsModel food) async {
    final Box<FoodsModel> foodBox = HiveBoxes.getFoods();
    await foodBox.add(food);
  }
}


