import 'package:ecommerce/screens/presentations/my_basket_page/components/input_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/size_config.dart';

class PaymentButtons extends StatelessWidget {
  PaymentButtons({
    Key? key,
    required this.text,
    required this.buttonIndex,
    required this.scfContext,
  }) : super(key: key);
  String text;
  int buttonIndex;
  BuildContext scfContext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(50),
      width: getWidth(150),
      child: ElevatedButton(
        onPressed: () {
          buttonIndex == 1
              ? Navigator.pushReplacementNamed(context, "/completed")
              : bottomSheet(scfContext);
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Constants.orange_background),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Constants.orange_background),
          ),
        ),
      ),
    );
  }
}

bottomSheet(context) => showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                  "Card Holders Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                InputField(hintText: "Lazizbek Fayziev"),
                const Text(
                  "Card Number",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                InputField(
                  hintText: "1234 5678 8990 1290",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Date",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            InputField(
                              hintText: "10/30",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: getWidth(20),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "CCV",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            InputField(
                              hintText: "123",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: getHeight(80),
                  decoration: BoxDecoration(
                      color: Constants.orange_background,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: SizedBox(
                      height: getHeight(50),
                      width: getWidth(170),
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, "/completed"),
                        child: Text(
                          "Complete Order",
                          style: TextStyle(color: Constants.orange_background),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
