import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       enabled: false,
      decoration: InputDecoration(
          fillColor: Constants.input_color,
          filled: true,

          hintText: "Search for fruit salad combos",
          prefixIcon: const Icon(Icons.search),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ))),
    );
  }
}
