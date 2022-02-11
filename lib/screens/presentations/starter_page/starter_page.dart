import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.pushNamed(context, "/login_info"),
        child: Center(
          child: Image.asset(Constants.logo_image),
        ),
      ),
    );
  }
}
