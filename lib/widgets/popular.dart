import 'package:appfood/constants/constant.dart';
import 'package:appfood/constants/space.dart';
import 'package:appfood/constants/text_style.dart';
import 'package:appfood/modal/popular.dart';
import 'package:appfood/modal/product.dart';
import 'package:appfood/routes/routes.dart';
import 'package:appfood/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class ListPopular extends StatelessWidget {
  const ListPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding16,
        vertical: kPadding10,
      ),
      height: kPopularCardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listPopular.length,
        itemBuilder: (context, index) {
          final item = listPopular[index];

          return _PopularItem(
            popularItem: item,
            onTap: () {
              final arg = convertToProduct(item);

              Navigator.pushNamed(context, Routes.itemPage, arguments: arg);
            },
          );
        },
        separatorBuilder: (context, index) {
          return kHorizontal20;
        },
      ),
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

class _PopularItem extends StatelessWidget {
  const _PopularItem({Key? key, required this.popularItem, this.onTap})
      : super(key: key);

  final Popular popularItem;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      popularItem.img,
      height: 130,
    );
    final name = Text(
      popularItem.name,
      style: TextStyles.text20Bold(),
    );
    final name1 = Text(popularItem.name1);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 170,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [boxShadow()],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            kVertical10,
            image,
            name,
            kVertical4,
            name1,
            kVertical12,
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${popularItem.money}',
          style: TextStyles.text16BoldRed(),
        ),
        const Icon(
          Icons.favorite_border,
          color: Colors.red,
        )
      ],
    );
  }
}
