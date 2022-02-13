import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../../core/data/local_data/foods_data.dart';
import '../../core/hive/hive_boxes.dart';
import '../../core/model/foods_model.dart';
import '../../core/service/food_service.dart';

class HiveProvider extends ChangeNotifier {
  List<FoodsModel> foodsList =
      FoodsService.fetchData(); //? buni provider bilan aloqasi yo'q
  final Box<FoodsModel> foodBox = HiveBoxes.getFoods();
  int total = 0;

  saveToBasket(FoodsModel food) async {
    try {
      await foodBox.add(food);
      await food.save();
    } catch (e) {
      food.count = 1 + food.count!;
      await food.save();
    }
    notifyListeners();
  }

  removeToBasket(int foodIndex) async {
    await foodBox.deleteAt(foodIndex);
    notifyListeners();
  }

  addCount(FoodsModel model) async {
    try {
      model.count = 1 + model.count!;
      await model.save();
    } catch (e) {}

    notifyListeners();
  }

  removeCount(FoodsModel model) async {
    try {
      model.count! > 0 ? model.count = model.count! - 1 : null;
      await model.save();
    } catch (e) {}

    notifyListeners();
  }

  addToFavorite(FoodsModel model) async {
    for (var element in foods_data) {
      if (element['name'] == model.name) {
        element['isFavorite'] = !model.isFavorite!;
        foodsList = FoodsService.fetchData();
      }
    }
    notifyListeners();
  }

  totalSum() {
    foodBox.values.toList().forEach((element) {
      total += element.price!;
    });
  }
}
