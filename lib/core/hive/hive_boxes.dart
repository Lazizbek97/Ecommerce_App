import 'package:ecommerce/core/model/foods_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBoxes {
  static Box<FoodsModel> getFoods() => Hive.box<FoodsModel>("foods");
}
