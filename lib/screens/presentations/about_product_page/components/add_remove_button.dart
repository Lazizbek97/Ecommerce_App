import 'package:flutter/material.dart';

class Add_remove_button extends StatelessWidget {
  Add_remove_button({
    Key? key,
    required this.icon,
    required this.backColor,
    required this.iconColor,
    required this.borderColor,
  }) : super(key: key);
  IconData icon;
  Color iconColor;
  Color backColor;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      child: Icon(
        icon,
        color: iconColor,
      ),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor),
      ),
    );
  }
}
