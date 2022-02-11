import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';


class TextInputField extends StatelessWidget {
  TextInputField({Key? key, required this.hintText}) : super(key: key);
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Constants.input_color,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ))),
    );
  }
}
