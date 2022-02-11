import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/size_config.dart';
import 'package:ecommerce/screens/presentations/about_product_page/components/add_remove_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutProductPage extends StatelessWidget {
  const AboutProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        Constants.quinoa,
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
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Qunia Fruit Salad",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Add_remove_button(
                                        backColor: Colors.white,
                                        borderColor: Colors.black,
                                        icon: Icons.remove,
                                        iconColor: Colors.black),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      "1",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Add_remove_button(
                                        icon: Icons.add,
                                        backColor: Constants.plus_color,
                                        iconColor: Constants.orange_background,
                                        borderColor: Constants.plus_color),
                                  ),
                                ],
                              ),
                              const Text(
                                "W 2,000",
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                        const Text(
                          "Red Qunioa, Lime, Honey, Blueberries, Stawberries, Mango, Fresh mint",
                          style: TextStyle(
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
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Constants.plus_color,
                                child: SvgPicture.asset(Constants.heart_image,
                                    height: 24),
                              ),
                            ),
                            SizedBox(
                              height: getHeight(50),
                              width: getWidth(230),
                              child: ElevatedButton(
                                onPressed: () {},
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
}
