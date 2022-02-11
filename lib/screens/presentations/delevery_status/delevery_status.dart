import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class DeleveryStatus extends StatelessWidget {
  const DeleveryStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      "Delivery Status",
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
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderSteps(
                    orderName: "Order Taken",
                    orderImg: Constants.order_taken,
                    orderSubtitle: "",
                    trialing: const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const VerticalDottedLine(),
                  OrderSteps(
                    orderName: "Order is being prepared",
                    orderImg: Constants.order_prepared,
                    orderSubtitle: "",
                    trialing: const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const VerticalDottedLine(),
                  OrderSteps(
                    orderName: "Order is being delivered",
                    orderImg: Constants.order_taken,
                    orderSubtitle: "Your delivery agent is coming",
                    trialing: CircleAvatar(
                      backgroundColor: Constants.orange_background,
                      child: const Icon(
                        Icons.wifi_calling_3_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const VerticalDottedLine(),
                  Center(
                    child: Container(
                      height: getHeight(200),
                      width: getWidth(330),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            Constants.map,

                          ),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const VerticalDottedLine(),
                  OrderSteps(
                    orderName: "Order recieved",
                    orderImg: Constants.check_gif,
                    orderSubtitle: "",
                    trialing: const CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class VerticalDottedLine extends StatelessWidget {
  const VerticalDottedLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(50),
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) => Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 1, horizontal: getWidth(41)),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.black,
                  ),
                ),
              )),
    );
  }
}

class OrderSteps extends StatelessWidget {
  OrderSteps({
    Key? key,
    required this.orderSubtitle,
    required this.orderName,
    required this.trialing,
    required this.orderImg,
  }) : super(key: key);
  String orderName;
  String orderImg;
  Widget trialing;

  String orderSubtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xffFFFAEB),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(orderImg),
      ),
      title: Text(
        orderName,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      subtitle: orderSubtitle == '' ? null : Text(orderSubtitle),
      trailing: trialing,
    );
  }
}
