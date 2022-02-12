import 'package:ecommerce/core/data/local_data/foods_data.dart';
import 'package:ecommerce/core/model/foods_model.dart';

class FoodsService {
  static fetchData() {
    return foods_data.map((e) => FoodsModel.fromJson(e)).toList();
  }
}
