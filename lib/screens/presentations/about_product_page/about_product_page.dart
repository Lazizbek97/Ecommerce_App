import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/size_config.dart';
import 'package:ecommerce/screens/presentations/about_product_page/components/add_remove_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../provider/hive_provider.dart';

class AboutProductPage extends StatelessWidget {
  AboutProductPage({Key? key, required this.foodIndex}) : super(key: key);

  int foodIndex;

  @override
  Widget build(BuildContext context) {
    HiveProvider provider = context.watch<HiveProvider>();

    return Scaffold(
      backgroundColor: Constants.orange_background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Image.asset(
                        provider.foodsList[foodIndex].img.toString(),
                        fit: BoxFit.cover,
                        height: getHeight(200),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 15,
                    child: InkWell(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, "/start_page"),
                      child: Chip(
                        label: const Text(
                          "Go back",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        avatar: const Icon(Icons.keyboard_arrow_left),
                        backgroundColor: Constants.product_back_color,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Constants.product_back_color,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.foodsList[foodIndex].name.toString(),
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.read<HiveProvider>().removeCount(
                                        provider.foodsList[foodIndex]);
                                  },
                                  child: Add_remove_button(
                                      backColor: Colors.white,
                                      borderColor: Colors.black,
                                      icon: Icons.remove,
                                      iconColor: Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    provider.foodsList[foodIndex].count
                                        .toString(),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    context.read<HiveProvider>().addCount(
                                        provider.foodsList[foodIndex]);
                                  },
                                  child: Add_remove_button(
                                      icon: Icons.add,
                                      backColor: Constants.plus_color,
                                      iconColor: Constants.orange_background,
                                      borderColor: Constants.plus_color),
                                ),
                              ],
                            ),
                            Text(
                              "W ${provider.foodsList[foodIndex].price}",
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: const Text(
                            "One Pack Containes:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Constants.orange_background,
                                      width: 2))),
                        ),
                        Text(
                          provider.foodsList[foodIndex].ingr.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                            "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you."),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                context.read<HiveProvider>().addToFavorite(
                                    provider.foodsList[foodIndex]);
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Constants.plus_color,
                                child: isLiked(
                                    provider.foodsList[foodIndex].isFavorite),
                              ),
                            ),
                            SizedBox(
                              height: getHeight(50),
                              width: getWidth(230),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await context
                                      .read<HiveProvider>()
                                      .saveToBasket(
                                          provider.foodsList[foodIndex]);
                                },
                                child: const Text("Add to basket"),
                                style: ElevatedButton.styleFrom(
                                    primary: Constants.orange_background),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
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
            height: getHeight(30),
            width: getHeight(30),
            child: Image.asset(Constants.heart_filled),
          )
        : SvgPicture.asset(Constants.heart_image, height: 24);
  }
}
