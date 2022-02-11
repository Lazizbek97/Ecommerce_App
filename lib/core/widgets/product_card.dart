import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class ProcductCard extends StatelessWidget {
  String name;
  String price;
  var color;

  String img;
  ProcductCard({
    Key? key,
    required this.img,
    required this.name,
    required this.price,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/about_product"),
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
                child: Image.asset(img),
              ),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "W $price",
                    style: TextStyle(color: Constants.orange_background),
                  ),
                  CircleAvatar(
                    radius: 15,
                    child: Icon(
                      Icons.add,
                      color: Constants.orange_background,
                    ),
                    backgroundColor: Constants.plus_color,
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
