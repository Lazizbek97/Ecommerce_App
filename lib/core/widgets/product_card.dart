import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../screens/provider/hive_provider.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class ProcductCard extends StatelessWidget {
  ProcductCard({
    Key? key,
    required this.foodIndex,
    required this.color,
  }) : super(key: key);
  var color;

  int foodIndex;
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HiveProvider>();

    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, "/about_product", arguments: foodIndex),
      child: Container(
        width: getHeight(160),
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: getHeight(100),
                  width: getHeight(100),
                  child:
                      Image.asset(provider.foodsList[foodIndex].img.toString()),
                ),
                Text(
                  provider.foodsList[foodIndex].name.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "W ${provider.foodsList[foodIndex].price}",
                      style: TextStyle(color: Constants.orange_background),
                    ),
                    InkWell(
                      onTap: () => context
                          .read<HiveProvider>()
                          .saveToBasket(provider.foodsList[foodIndex]),
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
              child: InkWell(
                onTap: () {
                  context
                      .read<HiveProvider>()
                      .addToFavorite(provider.foodsList[foodIndex]);
                },
                child: isLiked(provider.foodsList[foodIndex].isFavorite),
              ),
            ),
          ],
        ),
      ),
    );
  }

  isLiked(isLiked) {
    return isLiked
        ? SizedBox(
            height: getHeight(20),
            width: getHeight(20),
            child: Image.asset(Constants.heart_filled),
          )
        : SvgPicture.asset(
            Constants.heart_image,
          );
  }
}
