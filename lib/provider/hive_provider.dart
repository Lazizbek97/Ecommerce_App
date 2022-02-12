import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../core/data/local_data/foods_data.dart';
import '../core/hive/hive_boxes.dart';
import '../core/model/foods_model.dart';
import '../core/service/food_service.dart';

class HiveProvider extends ChangeNotifier {
  List<FoodsModel> foodsList =
      FoodsService.fetchData(); //? buni provider bilan aloqasi yo'q
  final Box<FoodsModel> foodBox = HiveBoxes.getFoods();

  saveToBasket(FoodsModel food) async {
    try {
      await foodBox.add(food);
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
    model.count = model.count! + 1;
    await model.save();

    notifyListeners();
  }

  removeCount(FoodsModel model) async {
    model.count! >= 0 ? model.count = model.count! - 1 : null;
    await model.save();
    notifyListeners();
  }

  addToFavorite(FoodsModel model) async {
    print(model.isFavorite.toString());
    for (var element in foods_data) {
      if (element['name'] == model.name) {
        print("ajsdfnaidnflaidsnufpa");
        element['isFavorite'] = !model.isFavorite!;
        print(element['isFavorite']);
        foodsList = FoodsService.fetchData();
      }
    }
    notifyListeners();
  }
}
