import 'package:ecommerce/core/model/foods_model.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/size_config.dart';
import 'package:ecommerce/core/widgets/product_card.dart';
import 'package:ecommerce/screens/provider/hive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends SearchDelegate {
  FoodsModel? resultCard;
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context, "/start_page", (route) => false),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List foodList = context.watch<HiveProvider>().foodsList;
    // TODO: implement buildResults
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      height: getHeight(200),
      width: getHeight(160),
      child: ProcductCard(
          foodIndex: foodList.indexOf(resultCard),
          color: Constants.product_back_color),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestions = context.watch<HiveProvider>().foodsList.where((element) {
      final result = element.name!.toLowerCase().toString();
      final input = query.toLowerCase().toString();
      return result.contains(input);
    }).toList();
    // TODO: implement buildSuggestions
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              resultCard = suggestions[index];
              query = suggestions[index].name!;

              showResults(context);
            },
            title: Text(suggestions[index].name!),
          );
        });
  }
}
