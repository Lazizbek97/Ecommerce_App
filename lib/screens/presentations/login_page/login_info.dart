import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class LoginInfo extends StatelessWidget {
  const LoginInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              color: Constants.orange_background,
              // padding: EdgeInsets.symmetric(vertical: getWidth(30)),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: getHeight(130)),
                child: Column(
                  children: [
                    Image.asset(Constants.login_info_image),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Image.asset(Constants.shadow1_image)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(20),
              ),
              margin: EdgeInsets.symmetric(vertical: getHeight(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: getHeight(100),
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Get The Freshest Fruit Salad Combo",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "We deliver the best ad freshest fruit salad in town. Order for a combo today!",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: getHeight(60),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login_name");
                      },
                      child: const Text("Let's Continue"),
                      style: ElevatedButton.styleFrom(
                          primary: Constants.orange_background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
