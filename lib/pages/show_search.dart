import 'package:appfood/constants/text_style.dart';
import 'package:appfood/modal/popular.dart';
import 'package:appfood/modal/product.dart';
import 'package:flutter/material.dart';

import '../routes/routes.dart';
import 'product_list_screen.dart';

class ShowSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {

    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];

    for (var result in productList) {
      if (result.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(result);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var results = matchQuery[index];
        return ListTile(
          title: Text(results.toString()),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchQuery = [];
    
    for (var result in productList) {
      if (result.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(result);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var results = matchQuery[index];
        final item = listPopular[index];
        return ListTile(
          onTap: () {
            final arg = convertToProduct(item);

            Navigator.pushNamed(context, Routes.itemPage, arguments: arg);
          },
          title: Row(
            children: [
              Image.asset(
                results.pathImage,
                height: 50,
                width: 50,
              ),
              Text(results.name,style: TextStyles.text16BoldBlack(),),
            ],
          ),
          subtitle: Text("\$ ${results.price.toString()}",style: TextStyles.text16BoldRed(),),
        );
      },
    );
  }

  Product convertToProduct(Popular e) {
    return Product(
        id: e.id,
        pathImage: e.img,
        name: e.name,
        price: e.money,
        describe: e.describe);
  }
}
