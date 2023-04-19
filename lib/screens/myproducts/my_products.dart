import 'package:flutter/material.dart';
import 'package:pirate_hunt/models/Product.dart';
import 'package:pirate_hunt/screens/myproducts/add_product.dart';

import '../details/details_screen.dart';
import '../home/components/product_card.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({super.key});

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: widget.product.bgColor,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('My Products'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.add_box,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {
      //         //add new products...........................
      //       },
      //     ),
      //   ],
      // ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProduct(),
            ),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
