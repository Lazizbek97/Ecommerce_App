import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';
import 'components/name_input_feild.dart';

class LoginNamePage extends StatelessWidget {
  const LoginNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getHeight(500),
              color: Constants.orange_background,
              // padding: EdgeInsets.symmetric(vertical: getWidth(30)),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: getHeight(130)),
                child: Column(
                  children: [
                    Image.asset(Constants.login_name_image),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Image.asset(Constants.shadow2_image)
                  ],
                ),
              ),
            ),
            Container(
              height: getHeight(300),
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(20),
                vertical: getHeight(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "What is your name?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextInputField(hintText: "Name"),
                  SizedBox(
                    height: getHeight(60),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/start_page");
                      },
                      child: const Text("Sart Ordering"),
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
          ],
        ),
      ),
    );
  }
}
