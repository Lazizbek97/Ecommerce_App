import 'package:ecommerce/core/hive/add_hive.dart';
import 'package:ecommerce/core/model/foods_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class ProcductCard extends StatelessWidget {
  var color;

  ProcductCard({
    Key? key,
    required this.food,
    required this.color,
  }) : super(key: key);
  FoodsModel food;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, "/about_product", arguments: food),
      child: Container(
        width: getHeight(160),
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: getHeight(100),
                width: getHeight(100),
                child: Image.asset(food.img.toString()),
              ),
              Text(
                food.name.toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "W ${food.price}",
                    style: TextStyle(color: Constants.orange_background),
                  ),
                  InkWell(
                    onTap: () => AddingToHive.saveToBasket(food),
                    child: CircleAvatar(
                      radius: 15,
                      child: Icon(
                        Icons.add,
                        color: Constants.orange_background,
                      ),
                      backgroundColor: Constants.plus_color,
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
            right: 0,
            child: SvgPicture.asset(Constants.heart_image),
          ),
        ]),
      ),
    );
  }
}
