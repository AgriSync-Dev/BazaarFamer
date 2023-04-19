import 'package:flutter/material.dart';

class Product {
  final String id, description;
  final String image, title;
  final int price;
  final Color bgColor;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    this.description = '',
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Product> demo_product = [
  Product(
    id: '1',
    image: "assets/images/product_0.png",
    title: "Long Sleeve Shirts",
    price: 165,
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    id: '2',
    image: "assets/images/product_1.png",
    title: "Casual Henley Shirts",
    price: 99,
  ),
  Product(
    id: '3',
    image: "assets/images/product_2.png",
    title: "Curved Hem Shirts",
    price: 180,
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    id: '4',
    image: "assets/images/product_3.png",
    title: "Casual Nolin",
    price: 149,
    bgColor: const Color(0xFFEEEEED),
  ),
];
