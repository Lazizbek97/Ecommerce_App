import 'package:ecommerce/core/model/foods_model.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/hive_provider.dart';
import 'components/input_field.dart';
import 'components/payment_buttons.dart';

class MyBasketPage extends StatelessWidget {
  const MyBasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FoodsModel> provider =
        context.watch<HiveProvider>().foodBox.values.toList();

    return Scaffold(
      backgroundColor: Constants.orange_background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: getHeight(80),
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      "My Basket",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
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
              child: Container(
                color: Colors.white,
                child: ListView.separated(
                  itemBuilder: ((context, index) => Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) async {
                          await context
                              .read<HiveProvider>()
                              .removeToBasket(index);
                        },
                        child: ListTile(
                          leading: Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(provider[index].img.toString()),
                          ),
                          title: Text(
                            provider[index].name.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Row(
                            children: [
                              const Text(
                                "1 packs",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                color: Constants.orange_background,
                                width: 3,
                                height: 15,
                              ),
                              Text(
                                "x ${provider[index].count}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "W ${provider[index].price}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: provider.length,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: getHeight(80),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "W ${context.watch<HiveProvider>().total}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getHeight(50),
                    width: getWidth(200),
                    child: ElevatedButton(
                      onPressed: () {
                        bottomSheet(context);
                      },
                      child: const Text("Checkout"),
                      style: ElevatedButton.styleFrom(
                          primary: Constants.orange_background),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bottomSheet(context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Delivery address",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  InputField(
                      hintText: "10th avenue, Lekki, Lagos, Lagos State"),
                  const Text(
                    "Number we can call",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  InputField(
                    hintText: "090990605708",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PaymentButtons(
                            text: "Pay on delivery",
                            buttonIndex: 1,
                            scfContext: context),
                        PaymentButtons(
                            text: "Pay with card",
                            buttonIndex: 2,
                            scfContext: context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
