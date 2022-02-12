// To parse this JSON data, do
//
//     final foodsModel = foodsModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'foods_model.g.dart';

FoodsModel foodsModelFromJson(String str) =>
    FoodsModel.fromJson(json.decode(str));

String foodsModelToJson(FoodsModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class FoodsModel extends HiveObject {
  FoodsModel({
    this.name,
    this.ingr,
    this.img,
    this.price,
    this.isFavorite,
    this.count,
  });

  @HiveField(0)
  String? name;
  @HiveField(1)
  String? ingr;
  @HiveField(2)
  String? img;
  @HiveField(3)
  int? price;
  @HiveField(4)
  bool? isFavorite;
  @HiveField(5)
  int? count;

  factory FoodsModel.fromJson(Map<String, dynamic> json) => FoodsModel(
        name: json["name"],
        ingr: json["ingr"],
        img: json["img"],
        price: json["price"],
        isFavorite: json["isFavorite"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "ingr": ingr,
        "img": img,
        "price": price,
        "isFavorite": isFavorite,
        "count": count,
      };
}
