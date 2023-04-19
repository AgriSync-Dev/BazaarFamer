import 'package:flutter/material.dart';
import 'package:pirate_hunt/screens/all_products/all_products_screen.dart';
import '../../details/details_screen.dart';
import '/models/Product.dart';
// import '/screens/details/details_screen.dart';

import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class NewArrivalProducts extends StatelessWidget {
  const NewArrivalProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "New Arrival",
            pressSeeAll: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AllProductsScreen(),
              ));
            },
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              home_product.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: ProductCard(
                  title: home_product[index].title,
                  image: home_product[index].image,
                  price: home_product[index].price,
                  bgColor: home_product[index].bgColor,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(product: home_product[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
