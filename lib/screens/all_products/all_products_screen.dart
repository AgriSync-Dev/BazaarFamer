import 'package:flutter/material.dart';
import 'package:pirate_hunt/models/Product.dart';
import 'package:pirate_hunt/screens/details/details_screen.dart';
import 'package:pirate_hunt/screens/home/components/product_card.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: widget.product.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('All Products'),
      ),
      body: GridView.builder(
        itemCount: demo_product.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            title: demo_product[index].title,
            image: demo_product[index].image,
            price: demo_product[index].price,
            bgColor: demo_product[index].bgColor,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(product: demo_product[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
