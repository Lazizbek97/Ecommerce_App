import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class PaymentCompleted extends StatelessWidget {
  const PaymentCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(300),
                  width: getHeight(150),
                  child: Image.asset(Constants.check_gif),
                ),
                const Text(
                  "Congratulations!!!",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                const Text(
                    "Your order have been taken and is being attended to",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: getHeight(60),
                    width: getWidth(130),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, "/delevery_status"),
                      child: const Text(
                        "Track order",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(60),
                  width: getWidth(180),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/start_page", (route) => false);
                    },
                    child: Text(
                      "Continue shopping",
                      style: TextStyle(
                          color: Constants.orange_background, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Constants.orange_background),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
