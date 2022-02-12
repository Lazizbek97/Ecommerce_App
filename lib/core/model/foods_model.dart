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
class FoodsModel {
  FoodsModel({
    this.name,
    this.ingr,
    this.img,
    this.price,
  });
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? ingr;
  @HiveField(2)
  String? img;
  @HiveField(3)
  int? price;

  factory FoodsModel.fromJson(Map<String, dynamic> json) => FoodsModel(
        name: json["name"],
        ingr: json["ingr"],
        img: json["img"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "ingr": ingr,
        "img": img,
        "price": price,
      };
}
